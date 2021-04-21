module RT_Core_single (
    clk, rst_n,
    Kernel_mode, End_program, Context_switch, 
    scalar_wen, scalar_wb_address, scalar_wb_data,
    vector_wen, vector_wb_address, vector_wb_data,
    scalar_read_address1, scalar_read_address2, 
    vector_read_address1, vector_read_address2,
    scalar_read1, scalar_read2,
    vector_read1, vector_read2,

    MRTI_addr_rd, MRTI_data_rd,
    MM_addr, MM_data_write, MM_data_read
);
    input clk, rst_n;
    input Kernel_mode;
    output End_program, Context_switch;

    output scalar_wen, vector_wen;
    output  [4:0] scalar_wb_address, scalar_read_address1, scalar_read_address2;
    output  [3:0] vector_wb_address, vector_read_address1, vector_read_address2;
    output  [31:0] Scalar_wb_data;
    output  [127:0] vector_wb_data;
    input [31:0] scalar_read1, scalar_read2;
    input [127:0] vector_read1, vector_read2;

    // Memory related
    input [31:0] MRTI_data_rd;
    output [31:0] MRTI_addr_rd;

    output [31:0] MM_addr;
    output [127:0] MM_data_write; 
    input  [127:0] MM_data_read;

    logic [31:0] PC_reg;
    logic jump_enable;
    logic [31:0] IF_PC_plus_four, IF_next_PC, IF_instruction;

    logic IF_DE_enable, IF_DE_reset;
    logic [31:0] IF_DE_current_PC, IF_DE_instruction, IF_DE_current_PC_plus_four, IF_DE_instruction_bypass;
    

    logic [31:0] RF_scalar1_out, RF_scalar2_out, DE_scalar1, DE_scalar2;
    logic [127:0] DE_vector1, DE_vector2;
    logic [31:0] DE_PC_plus_four_offset;


 

    //////////////////////////
    // Instruction Fetch Stage
    //////////////////////////
    assign jump_enable = IF_instruction[31:26] == 6'b111011 | IF_instruction[31:26] == 6'b111100;
    assign IF_jump_address = {16'h0, IF_instruction[15:0]};

    assign IF_PC_plus_four = PC_reg + 4;
    assign IF_next_PC =  jump_enable ? IF_jump_address : IF_PC_plus_four; // more to come
    assign MRTI_addr_rd = IF_next_PC; // read first
    assign IF_instruction = MRTI_data_rd;


    always_ff @(posedge clk, negedge rst_n) begin    
        if (!rst_n) 
            PC_reg <= 31'h0000;
        else 
            PC_reg <= IF_next_PC;   
    end

    //////////////////////////
    // IF DE pipeline
    //////////////////////////

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            IF_DE_current_PC <= 31'h0000;
            IF_DE_instruction <= 31'h0000;
            IF_DE_current_PC_plus_four <= 31'h0000;
        end else begin
            if (IF_DE_enable && IF_DE_reset) begin
                IF_DE_current_PC <= 31'h0000;
                IF_DE_instruction <= 31'h0000;
                IF_DE_current_PC_plus_four <= 31'h0000;
            end else if (IF_DE_enable && !IF_DE_reset) begin
                IF_DE_current_PC <= PC_reg;
                IF_DE_instruction <= IF_instruction;
                IF_DE_current_PC_plus_four <= IF_PC_plus_four;
            end
        end
    end

    //////////////////////////
    // DE Stage
    //////////////////////////  
    logic DE_intALU_op2_select, DE_floatALU1_op1_select, DE_floatALU3_op1_select, DE_floatALU2_op1_select, DE_floatALU4_op1_select, DE_floatALU2_op2_select,DE_floatALU4_op2_select;
    logic [1:0] DE_floatALU1_op2_select, DE_floatALU3_op2_select;
    logic DE_intALU_en, DE_floatALU1_en, DE_floatALU2_en, DE_floatALU3_en, DE_floatALU4_en;
    logic [2:0] DE_Scalar_out_select, DE_memory_op;
    logic DE_vector_reduce_en;
    // make sure it arrives early for RF memory
    assign IF_DE_instruction_bypass = IF_instruction;

    // WB Not written yet
    Register_file RF(.clk(clk), 
        .scalar_read_address1(Kernel_mode ? PD_scalar_read_address1 : IF_DE_instruction_bypass[25:21]), .scalar_read_address2(Kernel_mode ? PD_scalar_read_address2 : IF_DE_instruction_bypass[20:16]), 
        .vector_read_address1(Kernel_mode ? PD_vector_read_address1 : IF_DE_instruction_bypass[24:21]), .vector_read_address2(Kernel_mode ? PD_vector_read_address2 : IF_DE_instruction_bypass[19:16]), 
        .scalar_read1(RF_scalar1_out), .scalar_read2(RF_scalar2_out), 
        .vector_read1(DE_vector1), .vector_read2(DE_vector2)
    );

    assign DE_scalar1 = IF_DE_instruction[25:21] == 5'b11111 ? IF_DE_current_PC_plus_four : RF_scalar1_out;
    assign DE_scalar2 = IF_DE_instruction[20:16] == 5'b11111 ? IF_DE_current_PC_plus_four : RF_scalar2_out;

    assign PD_scalar_read1 = PD_scalar_read_address1 == 6'b111111 ? IF_PC_plus_four : RF_scalar1_out;
    assign PD_scalar_read2 = PD_scalar_read_address2 == 6'b111111 ? IF_PC_plus_four : RF_scalar2_out;
    assign PD_vector_read1 = DE_vector1;
    assign PD_vector_read2 = DE_vector2;

    assign DE_PC_plus_four_offset = IF_DE_current_PC_plus_four + {{17{IF_DE_instruction[15]}}, IF_DE_instruction[14:0]}; 

    instruction_decode_unit IDU(.opcode(IF_DE_instruction[31:26]), .immediate(IF_DE_instruction[1:0]),
        .intALU_op2_select(DE_intALU_op2_select),
        .floatALU1_op1_select(DE_floatALU1_op1_select), .floatALU2_op1_select(DE_floatALU2_op1_select),
        .floatALU3_op1_select(DE_floatALU3_op1_select), .floatALU4_op1_select(DE_floatALU4_op1_select),
        .floatALU1_op2_select(DE_floatALU1_op2_select), .floatALU2_op2_select(DE_floatALU2_op2_select),
        .floatALU3_op2_select(DE_floatALU3_op2_select), .floatALU4_op2_select(DE_floatALU4_op2_select),
        .intALU_en(DE_intALU_en), .floatALU1_en(DE_floatALU1_en), .floatALU2_en(DE_floatALU2_en), 
        .floatALU3_en(DE_floatALU3_en), .floatALU4_en(DE_floatALU4_en),
        .Scalar_out_select(DE_Scalar_out_select), .memory_op(DE_memory_op),
        .vector_reduce_en(DE_vector_reduce_en)
    );

    //////////////////////////
    // DE EX Pipeline
    ////////////////////////// 


    logic [31:0] DE_EX_scalar1, DE_EX_scalar2;
    logic [127:0] DE_EX_vector1, DE_EX_vector2;
    logic [15:0] DE_EX_immediate;

    // data pipeline
    always_ff @( posedge clk, negedge rst_n ) begin 
        if (!rst_n) begin 
            DE_EX_Scalar1 <= 31'b0;
            DE_EX_Scalar2 <= 31'b0;
            DE_EX_Vector1 <= 127'b0;
            DE_EX_Vector2 <= 127'b0;
            DE_EX_immediate <= 15'b0;
        end else begin
            DE_EX_scalar1 <= DE_scalar1;
            DE_EX_scalar2 <= DE_scalar2;
            DE_EX_vector1 <= DE_vector1;
            DE_EX_vector2 <= DE_vector2;
            DE_EX_immediate <= IF_DE_instruction[15:0];
        end
    end

    // Forwarding address. If address = 0 means no forwarding needed
    logic [4:0] DE_EX_S1_address, DE_EX_S2_address, DE_EX_Swb_address;
    logic [3:0] DE_EX_V1_address, DE_EX_V2_address, DE_EX_Vwb_address;

    // forwarding pipeline
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            DE_EX_S1_address <= 5'b0;
            DE_EX_S2_address <= 5'b0;
            DE_EX_Swb_address <= 5'b0;
            DE_EX_V1_address <= 4'b0;
            DE_EX_V2_address <= 4'b0;
            DE_EX_Vwb_address <= 4'b0;
        end else begin
            /// Three Instruction mode
            if (IF_DE_instruction[31] === 1'b0) begin

                DE_EX_S1_address <= IF_DE_instruction[20:16];
                DE_EX_S2_address <= IF_DE_instruction[15:11];
                DE_EX_V1_address <= IF_DE_instruction[19:16];
                DE_EX_V2_address <= IF_DE_instruction[14:11];

                DE_EX_Swb_address <= IF_DE_instruction[25:21];
                DE_EX_Vwb_address <= IF_DE_instruction[24:21];
                // VV instructions 
                if (IF_DE_instruction[30:29] === 2'b00) begin
                    DE_EX_S1_address <= 5'b0;
                    DE_EX_S2_address <= 5'b0;

                    DE_EX_Swb_address <= 5'b0;
                    DE_EX_Vwb_address <= IF_DE_instruction[28] == 1'b0? IF_DE_instruction[24:21] : 4'b0;
                end 
                // VF instructions
                else if(IF_DE_instruction[30:28] === 3'b010) begin
                    DE_EX_S1_address <= 5'b0;
                    DE_EX_V2_address <= 4'b0;

                    DE_EX_Swb_address <= 5'b0;
                end 
                // NAOX instructions 
                else if(IF_DE_instruction[30:28] === 3'b011) begin
                    DE_EX_V1_address <= 4'b0;
                    DE_EX_V2_address <= 4'b0; 
                    DE_EX_Vwb_address <= 4'b0; 
                end 
                // Int and Float operations
                else begin
                    DE_EX_V1_address <= 4'b0;
                    DE_EX_V2_address <= 4'b0; 
                    DE_EX_Vwb_address <= 4'b0; 
                    DE_EX_Swb_address <= IF_DE_instruction[28] == 1'b0? IF_DE_instruction[25:21] : 5'b0;
                end
            end
            // Immediate MODe
            else begin
                DE_EX_S1_address <= IF_DE_instruction[20:16];
                DE_EX_V1_address <= IF_DE_instruction[19:16];
                
                DE_EX_S2_address <= 5'b0;
                DE_EX_V2_address <= 4'b0;

                DE_EX_Swb_address <= IF_DE_instruction[25:21];
                DE_EX_Vwb_address <= IF_DE_instruction[24:21];
                // If Write back enable
                if (IF_DE_instruction[30] == 1'b0) begin
                    case (IF_DE_instruction[29:28])
                        2'b00: begin
                            DE_EX_V1_address <= 4'b0;
                            DE_EX_Vwb_address <= 4'b0;
                        end
                        2'b01: begin
                            case (IF_DE_instruction[27:26])
                                2'b00: begin
                                    DE_EX_S1_address <= 5'b0;
                                    DE_EX_Vwb_address <= 4'b0;
                                end
                                2'b01: begin
                                    DE_EX_S1_address <= 5'b0;
                                    DE_EX_Vwb_address <= 4'b0;
                                end
                                2'b10: begin
                                    DE_EX_V1_address <= IF_DE_instruction[24:21];
                                    DE_EX_Vwb_address <= 4'b0;
                                end
                                default: begin
                                    DE_EX_V1_address <= 4'b0;
                                    DE_EX_Swb_address <= 5'b0;
                                end
                                   
                            endcase
                        end
                        2'b10: begin
                            DE_EX_V1_address <= 4'b0;
                            DE_EX_Vwb_address <= 4'b0;
                        end
                        // memory load
                        default: begin
                            DE_EX_V1_address <= 4'b0;
                            if (IF_DE_instruction[27] == 1'b1) DE_EX_Swb_address <= 5'b0;
                            else DE_EX_Vwb_address <= 4'b0;
                            
                        end
                    endcase
                end
                else begin
                    DE_EX_Vwb_address <= 4'b0;
                    DE_EX_Swb_address <= 5'b0;
                    DE_EX_V1_address <= 4'b0;
                    DE_EX_S1_address <= 5'b0;
                    // for load instructions
                    if (IF_DE_instruction[29:28] == 2'b11) begin
                        DE_EX_S1_address <= IF_DE_instruction[20:16];
                        if (IF_DE_instruction[27:26] == 2'b11) DE_EX_V1_address <= IF_DE_instruction[24:21]
                        else DE_EX_S2_address <= IF_DE_instruction[25:21];

                    end
                end

            end
        end
    end
    
    // Control Pipeline
    logic DE_EX_intALU_op2_select;
    logic DE_EX_floatALU1_op1_select, DE_EX_floatALU3_op1_select, DE_EX_floatALU2_op1_select, DE_EX_floatALU4_op1_select;
    logic DE_EX_floatALU2_op2_select,DE_EX_floatALU4_op2_select;
    logic [1:0] DE_EX_floatALU1_op2_select, DE_EX_floatALU3_op2_select;
    logic DE_EX_intALU_en, DE_EX_floatALU1_en, DE_EX_floatALU2_en, DE_EX_floatALU3_en, DE_EX_floatALU4_en;
    
    logic [3:0] DE_EX_integer_ALU_opcode;
    logic [2:0] DE_EX_float_ALU_opcode;
    logic [2:0] DE_EX_Scalar_out_select, DE_EX_memory_op;
    logic DE_EX_vector_reduce_en;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin
            DE_EX_integer_ALU_opcode <= 4'b0;
            DE_EX_float_ALU_opcode <= 3'b0;
            DE_EX_intALU_en <= 1'b0;
            DE_EX_floatALU1_en <= 1'b0;
            DE_EX_floatALU2_en <= 1'b0;
            DE_EX_floatALU3_en <= 1'b0;
            DE_EX_floatALU4_en <= 1'b0;
            DE_EX_intALU_op2_select <= 1'b0;
            DE_EX_floatALU1_op1_select <= 1'b0; 
            DE_EX_floatALU3_op1_select <= 1'b0; 
            DE_EX_floatALU2_op1_select <= 1'b0; 
            DE_EX_floatALU4_op1_select <= 1'b0;
            DE_EX_floatALU2_op2_select <= 1'b0;
            DE_EX_floatALU4_op2_select <= 1'b0;
            DE_EX_floatALU1_op2_select <= 2'b0;
            DE_EX_floatALU3_op2_select <= 2'b0;
            DE_EX_Scalar_out_select <= 3'b0;
            DE_EX_memory_op <= 3'b0;
            DE_EX_vector_reduce_en <= 1'b0;
        end
        else begin
            DE_EX_intALU_en <= DE_intALU_en;
            DE_EX_floatALU1_en <= DE_floatALU1_en;
            DE_EX_floatALU2_en <= DE_floatALU2_en;
            DE_EX_floatALU3_en <= DE_floatALU3_en;
            DE_EX_floatALU4_en <= DE_floatALU4_en;

            DE_EX_intALU_op2_select <= DE_intALU_op2_select;
            DE_EX_floatALU1_op1_select <= DE_floatALU1_op1_select; 
            DE_EX_floatALU3_op1_select <= DE_floatALU3_op1_select; 
            DE_EX_floatALU2_op1_select <= DE_floatALU2_op1_select; 
            DE_EX_floatALU4_op1_select <= DE_floatALU4_op1_select;
            DE_EX_floatALU2_op2_select <= DE_floatALU2_op2_select;
            DE_EX_floatALU4_op2_select <= DE_floatALU4_op2_select;
            DE_EX_floatALU1_op2_select <= DE_floatALU1_op2_select;
            DE_EX_floatALU3_op2_select <= DE_floatALU3_op2_select;

            DE_EX_Scalar_out_select <= DE_Scalar_out_select;
            DE_EX_memory_op<= DE_memory_op;
            DE_EX_vector_reduce_en <= DE_vector_reduce_en;

            // Int and float opcode is special designed 
            DE_EX_integer_ALU_opcode <= {IF_DE_instruction[31:28] == 4'b1000?1'b1:1'b0, IF_DE_instruction[30:28] == 3'b110?1'b1:1'b0, IF_DE_instruction[27:26]};
            // memory needs integer ALU to do multiply
            if (IF_DE_instruction[31] == 1'b1 && IF_DE_instruction[29:28] == 2'b11)
                DE_EX_integer_ALU_opcode[1:0] = 2'b0;
            
            DE_EX_float_ALU_opcode <= {IF_DE_instruction[31:28] == 4'b1001?1'b1:1'b0, IF_DE_instruction[27:26]};

        end
    end
    
    //////////////////////////
    // EX Stage
    //////////////////////////  
    logic [31:0] EX_integer_ALU_OP1, EX_integer_ALU_OP2, EX_integer_ALU_out;
    logic [31:0] EX_float_ALU1_OP1, EX_float_ALU1_OP2, EX_float_ALU2_OP1, EX_float_ALU2_OP2;
    logic [31:0] EX_float_ALU3_OP1, EX_float_ALU3_OP2, EX_float_ALU4_OP1, EX_float_ALU4_OP2;
    logic [31:0] EX_float_ALU1_out, EX_float_ALU2_out, EX_float_ALU3_out, EX_float_ALU4_out;
    logic EX_integer_done, EX_float1_done, EX_float2_done, EX_float3_done, EX_float4_done;
    logic [1:0] EX_integer_flag, EX_float1_flag, EX_float2_flag, EX_float2_flag, EX_float2_flag;
    
    logic [31:0] EX_Scalar_out;
    logic [127:0] EX_Vector_out;

    // Int ALU
    always_comb begin 
        EX_integer_ALU_OP1 = DE_EX_scalar1;
        if (DE_EX_intALU_op2_select) 
            EX_integer_ALU_OP2 = {{17{DE_EX_immediate[15]}}, DE_EX_immediate[14:0]}; 
        else 
            EX_integer_ALU_OP2 = DE_EX_scalar2; 
    end

    // float ALU1
    always_comb begin 
        if (DE_EX_floatALU1_op1_select)
            EX_float_ALU1_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU1_OP1 = DE_EX_vector1[31:0];

        case (DE_EX_floatALU1_op2_select)
            2'b00: EX_float_ALU1_OP2 = DE_EX_vector2[31:0];
            2'b01: EX_float_ALU1_OP2 = DE_EX_scalar2;
            default: EX_float_ALU1_OP2 = DE_EX_vector1[63:32];
        endcase
    end

    // float ALU2
    always_comb begin 
        if (DE_EX_floatALU2_op1_select)
            EX_float_ALU2_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU2_OP1 = DE_EX_vector1[63:32];

        if (DE_EX_floatALU2_op2_select)
            EX_float_ALU2_OP2 = DE_EX_scalar2;
        else
            EX_float_ALU2_OP2 = DE_EX_vector2[63:32];
    end

    // float ALU3
    always_comb begin 
        if (DE_EX_floatALU3_op1_select)
            EX_float_ALU3_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU3_OP1 = DE_EX_vector1[95:64];

        case (DE_EX_floatALU3_op2_select)
            2'b00: EX_float_ALU3_OP2 = DE_EX_vector2[95:64];
            2'b01: EX_float_ALU3_OP2 = DE_EX_scalar2;
            default: EX_float_ALU3_OP2 = DE_EX_vector1[127:96];
        endcase
    end

    // float ALU4
    always_comb begin 
        if (DE_EX_floatALU4_op1_select)
            EX_float_ALU4_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU4_OP1 = DE_EX_vector1[127:96];

        if (DE_EX_floatALU4_op2_select)
            EX_float_ALU4_OP2 = DE_EX_scalar2;
        else
            EX_float_ALU4_OP2 = DE_EX_vector2[127:96];
        endcase
    end

    Integer_alu IALU(.op1(EX_integer_ALU_OP1), .op2(EX_integer_ALU_OP2), .clk(clk), 
        .out(EX_integer_ALU_out), .done(EX_integer_done), .operation(DE_EX_integer_ALU_opcode), .flag(EX_integer_flag));
    
    Float_alu FALU1(.op1(EX_float_ALU1_OP1), .op2(EX_float_ALU1_OP2), .clk(clk), 
        .out(EX_float_ALU1_out), .done(EX_float1_done), .operation(DE_EX_float_ALU1_opcode), .flag(EX_float1_flag));
    Float_alu FALU2(.op1(EX_float_ALU2_OP1), .op2(EX_float_ALU2_OP2), .clk(clk), 
        .out(EX_float_ALU2_out), .done(EX_float2_done), .operation(DE_EX_float_ALU2_opcode), .flag(EX_float2_flag));
    Float_alu FALU3(.op1(EX_float_ALU3_OP1), .op2(EX_float_ALU3_OP2), .clk(clk), 
        .out(EX_float_ALU3_out), .done(EX_float3_done), .operation(DE_EX_float_ALU3_opcode), .flag(EX_float3_flag));
    Float_alu FALU4(.op1(EX_float_ALU4_OP1), .op2(EX_float_ALU4_OP2), .clk(clk), 
        .out(EX_float_ALU4_out), .done(EX_float4_done), .operation(DE_EX_float_ALU4_opcode), .flag(EX_float4_flag));

    //////////////////////////
    // EX MEM Pipeline
    ////////////////////////// 

    // data 
    logic [127:0] EX_MEM_v_out; // shared between ALU out and data out.
    logic [31:0] EX_MEM_s_out, EX_MEM_memory_data; // Address and data

    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_data_pipeline
        if (!rst_n) begin
            EX_MEM_v_out <= 128'b0;
            EX_MEM_s_out <= 32'b0;
            EX_MEM_memory_data <= 32'b0;
        end
        else begin
            EX_MEM_memory_data <= DE_EX_scalar2;
            EX_MEM_v_out <= {EX_float_ALU4_out, EX_float_ALU3_out, EX_float_ALU2_out, EX_float_ALU1_out};
            if (DE_EX_Scalar_out_select[2] == 1'b0)
                EX_MEM_s_out <= EX_integer_ALU_out;
            else 
                case (DE_EX_Scalar_out_select[1:0])
                    2'b00: EX_MEM_s_out <= EX_float_ALU1_out;
                    2'b01: EX_MEM_s_out <= EX_float_ALU2_out;
                    2'b10: EX_MEM_s_out <= EX_float_ALU3_out;
                    default: EX_MEM_s_out <= EX_float_ALU4_out;
                endcase
        end

    end

    // forwarding. Only for data!
    logic [4:0] EX_MEM_S_data_address, EX_MEM_Swb_address;
    logic [3:0] EX_MEM_V_data_address, EX_MEM_Vwb_address;

    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_forwarding_pipeline
        if (!rst_n) begin
            EX_MEM_Swb_address <= 5'b0;
            EX_MEM_S_data_address <= 5'b0;
            EX_MEM_V_data_address <= 4'b0;
            EX_MEM_Vwb_address <= 4'b0;
        end else begin
            EX_MEM_Swb_address <= DE_EX_Swb_address;
            EX_MEM_Vwb_address <= DE_EX_Vwb_address;
            EX_MEM_V_data_address <= DE_EX_V1_address;
            EX_MEM_S_data_address <= DE_EX_S2_address;
        end
    end

    // control
    logic [2:0] EX_MEM_memory_op, 
    logic EX_MEM_vector_reduce_en;
    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_control_pipeline
        if (!rst_n) begin
            EX_MEM_memory_op <= 3'b0;
            EX_MEM_vector_reduce_en <= 1'b0;
        end else begin
            EX_MEM_memory_op <= DE_EX_memory_op;
            EX_MEM_vector_reduce_en <= DE_EX_vector_reduce_en;

        end
    end


    //////////////////////////
    // MEM Stage
    ////////////////////////// 
    logic [31:0] MEM_reduce_out;
    assign MM_addr = EX_MEM_s_out;
    assign MM_data_write = EX_MEM_memory_op[0] == 1'b1 ? EX_MEM_v_out : {96'b0, EX_MEM_memory_data};

    floatAdder FPU(EX_MEM_v_out[31:0], EX_MEM_v_out[93:64], 2'b00, MEM_reduce_out, EX_MEM_vector_reduce_en);

    //////////////////////////
    // MEM_WB Pipeline
    ////////////////////////// 

    // data 
    logic [127:0] MEM_WB_vector; // shared between ALU out and data out.
    logic [31:0] MEM_WB_scalar;
    logic [4:0] MEM_WB_Swb_address;
    logic [3:0] MEM_WB_Vwb_address;

    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_data_pipeline
        if (!rst_n) begin
            MEM_WB_vector <= 128'b0;
            MEM_WB_scalar <= 32'b0;
            MEM_WB_Swb_address <= 5'b0;
            MEM_WB_Vwb_address <= 4'b0;
        end
        else begin
            MEM_WB_Swb_address <= EX_MEM_Swb_address;
            MEM_WB_Vwb_address <= EX_MEM_Vwb_address;

            if (EX_MEM_memory_op == 3'b001) 
                MEM_WB_vector <= MM_data_read;
            else MEM_WB_vector <= EX_MEM_v_out;

            if (EX_MEM_memory_op == 3'b000) 
                MEM_WB_scalar <= MM_data_read[31:0];
            else if (EX_MEM_vector_reduce_en) 
                MEM_WB_scalar <= MEM_reduce_out;
            else MEM_WB_scalar <= EX_MEM_s_out;

        end
    end


endmodule