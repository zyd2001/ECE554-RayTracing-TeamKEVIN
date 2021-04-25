module RT_Core_single (
    clk, rst_n,
    Kernel_mode, End_program, Context_switch, 

    PD_scalar_wen, PD_scalar_wb_address, PD_scalar_wb_data,
    PD_vector_wen, PD_vector_wb_address, PD_vector_wb_data,
    PD_scalar_read_address1, PD_scalar_read_address2, 
    PD_vector_read_address1, PD_vector_read_address2,
    PD_scalar_read1, PD_scalar_read2,
    PD_vector_read1, PD_vector_read2,

    DEBUG_scalar_wb_address, DEBUG_scalar_wb_data,
    DEBUG_vector_wb_address, DEBUG_vector_wb_data,
    DEBUG_scalar_read_address1, DEBUG_scalar_read_address2, 
    DEBUG_vector_read_address1, DEBUG_vector_read_address2,
    DEBUG_scalar_read1, DEBUG_scalar_read2,
    DEBUG_vector_read1, DEBUG_vector_read2,

    MRTI_addr, MRTI_data,
    MEM_addr, MEM_data_write, MEM_data_read, MEM_read_en, MEM_write_en, MEM_done
);
    // Control / Normal signals
    input clk, rst_n;
    input Kernel_mode;
    output End_program, Context_switch;

    // PD interface signals
    input PD_scalar_wen, PD_vector_wen;
    input [4:0] PD_scalar_wb_address, PD_scalar_read_address1, PD_scalar_read_address2;
    input [3:0] PD_vector_wb_address, PD_vector_read_address1, PD_vector_read_address2;
    input [31:0] PD_Scalar_wb_data;
    input [127:0] PD_vector_wb_data;
    output [31:0] PD_scalar_read1, PD_scalar_read2;
    output [127:0] PD_vector_read1, PD_vector_read2;

    // Debug signals
    output [4:0] DEBUG_scalar_wb_address, DEBUG_scalar_read_address1, DEBUG_scalar_read_address2;
    output [3:0] DEBUG_vector_wb_address, DEBUG_vector_read_address1, DEBUG_vector_read_address2;
    output [31:0] DEBUG_Scalar_wb_data;
    output [127:0] DEBUG_vector_wb_data;
    output [31:0] DEBUG_scalar_read1, DEBUG_scalar_read2;
    output [127:0] DEBUG_vector_read1, DEBUG_vector_read2;

    // Instruction memory related
    input [31:0] MRTI_data;
    output [31:0] MRTI_addr;

    // Main Memory + Const Memory related
    output [31:0] MEM_addr;
    output [127:0] MEM_data_write; 
    output MEM_read_en, MEM_write_en;
    input [127:0] MEM_data_read;
    input MEM_done;    
    
    typedef enum logic [1:0] { idle, waiting_int_MEM, waiting_float } waiting_state;

    //////////////////////////////////////////////////////////////////
    //////////////// DE_EX_pipeline registers ////////////////////////
    //////////////////////////////////////////////////////////////////
    
    // Forwarding address. If address = 0 means no forwarding needed
    logic [4:0] DE_EX_S1_address, DE_EX_S2_address, DE_EX_Swb_address;
    logic [3:0] DE_EX_V1_address, DE_EX_V2_address, DE_EX_Vwb_address;

    // Control Pipeline
    logic DE_EX_intALU_op2_select;
    logic DE_EX_floatALU1_op1_select, DE_EX_floatALU3_op1_select, DE_EX_floatALU2_op1_select, DE_EX_floatALU4_op1_select;
    logic DE_EX_floatALU2_op2_select,DE_EX_floatALU4_op2_select;
    logic [1:0] DE_EX_floatALU1_op2_select, DE_EX_floatALU3_op2_select;
    logic DE_EX_intALU_en, DE_EX_floatALU1_en, DE_EX_floatALU2_en, DE_EX_floatALU3_en, DE_EX_floatALU4_en;
    
    logic [3:0] DE_EX_integer_ALU_opcode;
    logic [2:0] DE_EX_float_ALU_opcode;
    logic [2:0] DE_EX_Scalar_out_select, DE_EX_memory_op;
    logic DE_EX_vector_reduce_en, DE_EX_update_int_flag, DE_EX_update_float_flag;
    logic DE_EX_FIN, DE_EX_context_switch;

    ///////////////////////////////////////////////////////////////////
    //////////////// MEM_WB_pipeline registers ////////////////////////
    ///////////////////////////////////////////////////////////////////
    logic [127:0] MEM_WB_vector; // shared between ALU out and data out.
    logic [31:0] MEM_WB_scalar;
    logic [4:0] MEM_WB_Swb_address;
    logic [3:0] MEM_WB_Vwb_address;
    
    logic MEM_WB_FIN, MEM_WB_context_switch;
    //////////////////////////
    // Instruction Fetch Stage
    //////////////////////////
    logic IF_FIN;
    logic [1:0] next_pc_select;
    logic [31:0] PC_reg;
    logic [31:0] IF_PC_plus_four, IF_next_PC, IF_instruction, IF_link_address, DE_PC_plus_four_offset;

    typedef enum logic[1:0] { running, done, Kernel_mode_wait } FIN_state;
    FIN_state FIN_current_state, FIN_next_state;

    assign jump_enable = IF_instruction[31:26] == 6'b111011 | IF_instruction[31:26] == 6'b111100;
    assign IF_jump_address = {16'h0, IF_instruction[15:0]};

    assign IF_PC_plus_four = PC_reg + 4;

    always_comb begin : Select_next_PC
        case (next_pc_select)
            2'b0x: IF_next_PC = IF_PC_plus_four;
            2'b10: IF_next_PC = DE_PC_plus_four_offset
            default: IF_next_PC = IF_link_address;
        endcase
        if (IF_FIN) IF_next_PC = PC_reg;
    end

    assign MRTI_addr_rd = kernel_mode == 1'b1 ? PC_reg : IF_next_PC; // read first
    assign IF_instruction = MRTI_data_rd;

    always_ff @(posedge clk, negedge rst_n) begin    
        if (!rst_n) 
            PC_reg <= 31'h0000;
        else if (Kernel_mode == 1'b1 && PD_scalar_wen && PD_scalar_wb_address == 5'b11111)
            PC_reg <= PD_scalar_wb_data;
        else if (!IF_DE_stall || !IF_FIN)
            PC_reg <= IF_next_PC;   
    end

    always_ff @( posedge clk, negedge rst_n ) begin : IF_FIN_next_state
        if (!rst_n)
            FIN_current_state <= done;
        else 
            FIN_current_state <= FIN_next_state;
    end

    always_ff @( posedge clk, negedge rst_n ) begin : IF_FIN_state_machine
        IF_FIN = 1'b0;
        FIN_next_state = FIN_current_state;
            case (FIN_current_state)
                running: begin
                    if (!IF_DE_stall && next_pc_select == 2'b0 && IF_instruction[31:28] == 3'b1110) begin
                        IF_FIN = 1'b1;
                        FIN_next_state = done;
                    end
                end
                done: begin
                    IF_FIN = 1'b1;
                    if (Kernel_mode) 
                        FIN_next_state = Kernel_mode_wait;
                end
                default: begin
                    IF_FIN = 1'b1;
                    if (!Kernel_mode) begin
                        FIN_next_state = running;
                        IF_FIN = 1'b0;
                    end
                end
            endcase

    end
    //////////////////////////
    // IF DE pipeline
    //////////////////////////
    logic IF_DE_stall;
    
    logic IF_DE_enable, IF_DE_reset, IF_DE_FIN;
    logic [31:0] IF_DE_current_PC, IF_DE_instruction, IF_DE_current_PC_plus_four, IF_DE_instruction_bypass;

    always @(posedge clk, negedge rst_n) begin : IF_DE_pipeline
        if (!rst_n) begin
            IF_DE_current_PC <= 31'h0000;
            IF_DE_instruction <= 31'h0000;
            IF_DE_current_PC_plus_four <= 31'h0000;
            IF_DE_FIN <= 1'b0;
        end else if (!IF_DE_stall && !kernel_mode) begin
                if (next_pc_select != 2'b00) begin
                    IF_DE_current_PC <= 31'h0000;
                    IF_DE_instruction <= 31'h0000;
                    IF_DE_current_PC_plus_four <= 31'h0000;
                    IF_DE_FIN <= 1'b0;
                end else begin
                    IF_DE_FIN <= IF_FIN;
                    IF_DE_current_PC <= PC_reg;
                    IF_DE_instruction <= IF_instruction;
                    IF_DE_current_PC_plus_four <= IF_PC_plus_four;
                end
            end
        end
    end

    //////////////////////////
    // DE Stage
    //////////////////////////  
    logic [31:0] RF_scalar1_out, RF_scalar2_out, DE_scalar1, DE_scalar2;
    logic [127:0] DE_vector1, DE_vector2;

    logic DE_intALU_op2_select, DE_floatALU1_op1_select, DE_floatALU3_op1_select, DE_floatALU2_op1_select, DE_floatALU4_op1_select, DE_floatALU2_op2_select,DE_floatALU4_op2_select;
    logic [1:0] DE_floatALU1_op2_select, DE_floatALU3_op2_select;
    logic DE_intALU_en, DE_floatALU1_en, DE_floatALU2_en, DE_floatALU3_en, DE_floatALU4_en;
    logic [2:0] DE_Scalar_out_select, DE_memory_op;
    logic DE_vector_reduce_en;
    
    logic EX_busy, MEM_busy;
    logic [1:0] EX_int_flag, EX_float_flag;
    logic EX_int_flag_en, EX_float_flag_en;
    logic DE_Branch_stall, DE_Mem_address_stall;

    logic [4:0] DE_S1_address, DE_S2_address, DE_Swb_address;
    logic [3:0] DE_V1_address, DE_V2_address, DE_Vwb_address;

    logic [4:0] DE_S1bp_address, DE_S2bp_address;
    logic [3:0] DE_V1bp_address, DE_V2bp_address;

    logic DE_EX_S1_select, DE_EX_S2_select, DE_EX_V1_select, DE_EX_V2_select;
    logic DE_update_int_flag, DE_update_float_flag;
    
    logic DE_context_switch;

    // make sure it arrives early for RF memory
    assign IF_DE_instruction_bypass = IF_instruction;

    always_comb begin : DE_bypass_address
        DE_S1bp_address = IF_DE_instruction_bypass[20:16];
        DE_S2bp_address = IF_DE_instruction_bypass[15:11];
        DE_V1bp_address = IF_DE_instruction_bypass[19:16];
        DE_V2bp_address = IF_DE_instruction_bypass[14:11];
        // V get from S
        if (IF_DE_instruction_bypass[31:26] == 6'b100111)
            DE_V1bp_address = IF_DE_instruction_bypass[24:21];
        // Store S
        if (IF_DE_instruction_bypass[31:26] == 6'b111100)
            DE_S2bp_address = IF_DE_instruction_bypass[25:21];
        // Store V
        if (IF_DE_instruction_bypass[31:26] == 6'b111111)
            DE_V1bp_address = IF_DE_instruction_bypass[24:21];
    end

    // WB Not written yet
    Register_file RF(.clk(clk), 
        .scalar_read_address1(Kernel_mode ? PD_scalar_read_address1 : DE_S1bp_address), .scalar_read_address2(Kernel_mode ? PD_scalar_read_address2 : DE_S2bp_address), 
        .vector_read_address1(Kernel_mode ? PD_vector_read_address1 : DE_V1bp_address), .vector_read_address2(Kernel_mode ? PD_vector_read_address2 : DE_V2bp_address), 
        .scalar_read1(RF_scalar1_out), .scalar_read2(RF_scalar2_out), 
        .vector_read1(DE_vector1), .vector_read2(DE_vector2),
        .scalar_wen(Kernel_mode ? PD_scalar_wen : |MEM_WB_Swb_address), .scalar_wb_address(Kernel_mode ? PD_scalar_wb_address : MEM_WB_Swb_address), 
        .vector_wen(Kernel_mode ? PD_vector_wen : |MEM_WB_Vwb_address), .vector_wb_address(Kernel_mode ? PD_vector_wb_address : MEM_WB_Vwb_address), 
        .scalar_wb_data(Kernel_mode ? PD_scalar_wb_data : MEM_WB_scalar), .vector_wb_data(Kernel_mode ? PD_vector_wb_data : MEM_WB_vector)
    );

    assign DE_scalar1 = DE_S1_address == 5'b11111 ? IF_DE_current_PC_plus_four : RF_scalar1_out;
    assign DE_scalar2 = DE_S2_address == 5'b11111 ? IF_DE_current_PC_plus_four : RF_scalar2_out;

    assign PD_scalar_read1 = PD_scalar_read_address1 == 5'b11111 ? IF_PC_plus_four : RF_scalar1_out;
    assign PD_scalar_read2 = PD_scalar_read_address2 == 5'b11111 ? IF_PC_plus_four : RF_scalar2_out;
    assign PD_vector_read1 = DE_vector1;
    assign PD_vector_read2 = DE_vector2;

    assign DEBUG_scalar_read_address1 = DE_S1bp_address;
    assign DEBUG_scalar_read_address2 = DE_S2bp_address;
    assign DEBUG_vector_read_address1 = DE_V1bp_address;
    assign DEBUG_vector_read_address2 = DE_V2bp_address;
    assign DEBUG_scalar_read1 = DE_scalar1;
    assign DEBUG_scalar_read2 = DE_scalar2;
    assign DEBUG_vector_read1 = DE_vector1;
    assign DEBUG_vector_read2 = DE_vector2;
    assign DEBUG_scalar_wb_address = MEM_WB_Swb_address;
    assign DEBUG_scalar_wb_data = MEM_WB_scalar;
    assign DEBUG_vector_wb_address = MEM_WB_Vwb_address;
    assign DEBUG_vector_wb_data = MEM_WB_vector;


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
        .vector_reduce_en(DE_vector_reduce_en), .update_int_flag(DE_update_int_flag), .update_float_flag(DE_update_float_flag),
        .context_switch(DE_context_switch)
    );

    address_decode_unit ADU(
        .instruction(IF_DE_instruction), .DE_S1_address(DE_S1_address), .DE_S2_address(DE_S2_address), 
        .DE_Swb_address(DE_Swb_address), .DE_V1_address(DE_V1_address), .DE_V2_address(DE_V2_address), .DE_Vwb_address(DE_Vwb_address)
    );

    branch branch_unit(
        .clk(clk), .rst_n(clk), 
        .EX_busy(EX_busy), .MEM_busy(MEM_busy), 
        .IF_DE_stall(DE_Branch_stall), .next_pc_select(next_pc_select), 
        .int_flag(EX_int_flag), .float_flag(EX_float_flag), .int_flag_en(EX_int_flag_en), .float_flag_en(EX_float_flag_en), 
        .branch_opcode(IF_DE_instruction[28:26]), .branch_en(IF_DE_instruction[31:29] == 3'b110)
    );

    Forwarding_decode Decode_stage_data_hazard(
        .DE_EX_Swb_address(DE_EX_Swb_address), .DE_EX_Vwb_address(DE_EX_Vwb_address), .MEM_WB_Swb_address(MEM_WB_Swb_address), .MEM_WB_Vwb_address(MEM_WB_Vwb_address), 
        .DE_EX_MEM_read(DE_EX_memory_op[2:1] == 2'b10), .DE_EX_V_reduce(DE_EX_vector_reduce_en), .DE_stall(DE_Mem_address_stall), 
        .DE_S1_address(DE_S1_address), .DE_S2_address(DE_S2_address), .DE_V1_address(DE_V1_address), .DE_V2_address(DE_V2_address),
        .DE_EX_S1_select(DE_EX_S1_select), .DE_EX_S2_select(DE_EX_S2_select), .DE_EX_V1_select(DE_EX_V1_select), .DE_EX_V2_select(DE_EX_V2_selectDE_EX_V2_select)
    );

    assign IF_DE_stall = DE_Branch_stall | DE_Mem_address_stall;
    
    //////////////////////////
    // DE EX Pipeline
    ////////////////////////// 

    logic [31:0] DE_EX_scalar1, DE_EX_scalar2;
    logic [127:0] DE_EX_vector1, DE_EX_vector2;
    logic [15:0] DE_EX_immediate;

    logic EX_int_knockdown, EX_float1_knockdown, EX_float2_knockdown, EX_float3_knockdown, EX_float4_knockdown;
    logic DE_EX_stall;
    // data pipeline
    always_ff @( posedge clk, negedge rst_n ) begin 
        if (!rst_n) begin 
            DE_EX_Scalar1 <= 31'b0;
            DE_EX_Scalar2 <= 31'b0;
            DE_EX_Vector1 <= 127'b0;
            DE_EX_Vector2 <= 127'b0;
            DE_EX_immediate <= 15'b0;
        end else begin
            if (!EX_busy && !MEM_busy) begin
                DE_EX_scalar1 <= DE_EX_S1_select ? MEM_WB_scalar : DE_scalar1;
                DE_EX_scalar2 <= DE_EX_S2_select ? MEM_WB_scalar : DE_scalar2;
                DE_EX_vector1 <= DE_EX_V1_select ? MEM_WB_vector : DE_vector1;
                DE_EX_vector2 <= DE_EX_V2_select ? MEM_WB_vector : DE_vector2;
                DE_EX_immediate <= IF_DE_instruction[15:0];
            end
        end
    end

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
            if (!EX_busy && !MEM_busy) begin
                DE_EX_S1_address <= DE_S1_address;
                DE_EX_S2_address <= DE_S2_address;
                DE_EX_Swb_address <= IF_DE_stall ? 5'b0 : DE_Swb_address;
                DE_EX_V1_address <= DE_V1_address;
                DE_EX_V2_address <= DE_V2_address;
                DE_EX_Vwb_address <= IF_DE_stall ? 4'b0 : DE_Vwb_address;
            end
        end 
    end
    
    // Control Pipeline
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin
            DE_EX_integer_ALU_opcode <= 4'b0;
            DE_EX_float_ALU_opcode <= 3'b0;
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
            DE_EX_update_int_flag <= 1'b0,
            DE_EX_update_float_flag <= 1'b0;
            DE_EX_FIN <= 1'b0;
            DE_EX_context_switch <= 1'b0;
        end
        else begin
            if (!EX_busy && !MEM_busy) begin
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

                DE_EX_update_int_flag <= DE_update_int_flag,
                DE_EX_update_float_flag <= DE_update_float_flag;
                // Int and float opcode is special designed 
                DE_EX_integer_ALU_opcode <= {IF_DE_instruction[31:28] == 4'b1000?1'b1:1'b0, IF_DE_instruction[30:28] == 3'b110?1'b1:1'b0, IF_DE_instruction[27:26]};
                // memory needs integer ALU to do multiply
                if (IF_DE_instruction[31] == 1'b1 && IF_DE_instruction[29:28] == 2'b11)
                    DE_EX_integer_ALU_opcode[1:0] = 2'b0;
                
                DE_EX_float_ALU_opcode <= {IF_DE_instruction[31:28] == 4'b1001?1'b1:1'b0, IF_DE_instruction[27:26]};

                DE_EX_FIN <= IF_DE_FIN;
                DE_EX_context_switch <= DE_context_switch;
            end

        end
    end
    
    // Enable pipeline
    always_ff @( posedge clk, negedge rst_n ) begin : DE_EX_enable_pipeline
        if (!rst_n) begin
            DE_EX_intALU_en <= 1'b0;
            DE_EX_floatALU1_en <= 1'b0;
            DE_EX_floatALU2_en <= 1'b0;
            DE_EX_floatALU3_en <= 1'b0;
            DE_EX_floatALU4_en <= 1'b0;
        end
        else begin
            if (EX_int_knockdown)
                DE_EX_intALU_en <= 1'b0;
            else if (!EX_busy && !MEM_busy)
                DE_EX_intALU_en <= IF_DE_stall == 1'b1 ? 1'b0 : DE_intALU_en;

            if (EX_float1_knockdown)
                DE_EX_floatALU1_en <= 1'b0
            else if (!EX_busy && !MEM_busy)
                DE_EX_floatALU1_en <= IF_DE_stall == 1'b1 ? 1'b0 : DE_floatALU1_en;
            
            if (EX_float2_knockdown)
                DE_EX_floatALU2_en <= 1'b0
            else if (!EX_busy && !MEM_busy)
                DE_EX_floatALU2_en <= IF_DE_stall == 1'b1 ? 1'b0 : DE_floatALU2_en;

            if (EX_float3_knockdown)
                DE_EX_floatALU3_en <= 1'b0
            else if (!EX_busy && !MEM_busy)
                DE_EX_floatALU3_en <= IF_DE_stall == 1'b1 ? 1'b0 : DE_floatALU3_en;

            if (EX_float4_knockdown)
                DE_EX_floatALU4_en <= 1'b0
            else if (!EX_busy && !MEM_busy)
                DE_EX_floatALU4_en <= IF_DE_stall == 1'b1 ? 1'b0 :  DE_floatALU4_en;
        end

    end
    //////////////////////////
    // EX Stage
    //////////////////////////  
    logic [31:0] EX_forwarded_scalar1, EX_forwarded_scalar2;
    logic [127:0] EX_forwarded_vector1, EX_forwarded_vector2;
    logic [31:0] EX_integer_ALU_OP1, EX_integer_ALU_OP2, EX_integer_ALU_out;
    logic [31:0] EX_float_ALU1_OP1, EX_float_ALU1_OP2, EX_float_ALU2_OP1, EX_float_ALU2_OP2;
    logic [31:0] EX_float_ALU3_OP1, EX_float_ALU3_OP2, EX_float_ALU4_OP1, EX_float_ALU4_OP2;
    logic [31:0] EX_float_ALU1_out, EX_float_ALU2_out, EX_float_ALU3_out, EX_float_ALU4_out;
    logic EX_integer_done, EX_float1_done, EX_float2_done, EX_float3_done, EX_float4_done;
    logic [1:0] EX_integer_flag, EX_float1_flag, EX_float2_flag, EX_float2_flag, EX_float2_flag;
    
    logic [31:0] EX_Scalar_out;
    logic [127:0] EX_Vector_out;

    waiting_state EX_current_state, EX_next_state;

    always_ff @( posedge clk, negedge rst_n ) begin : EX_waiting_update_state     
        if (!rst_n)
            EX_current_state <= idle;
        else
            EX_current_state <= EX_next_state;
    end

    always_comb begin : EX_waiting_state_machine
        EX_busy = 1'b0;
        EX_next_state = EX_current_state;
        case (EX_current_state)
            idle: begin
                if (DE_EX_intALU_en && ~EX_integer_done) begin
                    EX_next_state = waiting_int_MEM;
                    EX_busy = 1'b1;
                end
                if (DE_EX_floatALU1_en && ~EX_float1_done) begin
                    EX_next_state = waiting_float;
                    EX_busy = 1'b1;
                end
            end
            waiting_int_MEM: begin
                EX_busy = 1'b1;
                if (EX_integer_done) begin
                    EX_next_state = idle; 
                    EX_busy = 1'b0;
                end
            end
            default: begin
                EX_busy = 1'b1;
                if (EX_float1_done) begin
                    EX_next_state = idle; 
                    EX_busy = 1'b0;
                end
            end
        endcase
    end

    always_comb begin : EX_forwarding
        if (DE_EX_S1_address == EX_MEM_Swb_address) 
            EX_forwarded_scalar1 = EX_MEM_s_out;
        else if (DE_EX_S1_address == MEM_WB_Swb_address)
            EX_forwarded_scalar1 = MEM_WB_scalar;
        else
            EX_forwarded_scalar1 = DE_EX_scalar1;

        if (DE_EX_S2_address == EX_MEM_Swb_address) 
            EX_forwarded_scalar2 = EX_MEM_s_out;
        else if (DE_EX_S2_address == MEM_WB_Swb_address)
            EX_forwarded_scalar2 = MEM_WB_scalar;
        else
            EX_forwarded_scalar2 = DE_EX_scalar1;

        if (DE_EX_V1_address == EX_MEM_Vwb_address) 
            EX_forwarded_vector1 = EX_MEM_v_out;
        else if (DE_EX_V1_address == MEM_WB_Vwb_address)
            EX_forwarded_vector1 = MEM_WB_vector;
        else
            EX_forwarded_vector1 = DE_EX_vector1;

        if (DE_EX_V2_address == EX_MEM_Vwb_address) 
            EX_forwarded_vector2 = EX_MEM_v_out;
        else if (DE_EX_V2_address == MEM_WB_Vwb_address)
            EX_forwarded_vector2 = MEM_WB_vector;
        else
            EX_forwarded_vector2 = DE_EX_vector2;
    end

    // Int ALU
    always_comb begin 
        EX_integer_ALU_OP1 = EX_forwarded_scalar1;
        if (DE_EX_intALU_op2_select) 
            EX_integer_ALU_OP2 = {{17{DE_EX_immediate[15]}}, DE_EX_immediate[14:0]}; 
        else 
            EX_integer_ALU_OP2 = EX_forwarded_scalar2; 
    end

    // float ALU1
    always_comb begin 
        if (DE_EX_floatALU1_op1_select)
            EX_float_ALU1_OP1 = EX_forwarded_scalar1;
        else 
            EX_float_ALU1_OP1 = EX_forwarded_vector1[31:0];

        case (DE_EX_floatALU1_op2_select)
            2'b00: EX_float_ALU1_OP2 = EX_forwarded_vector2[31:0];
            2'b01: EX_float_ALU1_OP2 = EX_forwarded_scalar2;
            default: EX_float_ALU1_OP2 = EX_forwarded_vector1[63:32];
        endcase
    end

    // float ALU2
    always_comb begin 
        if (DE_EX_floatALU2_op1_select)
            EX_float_ALU2_OP1 = EX_forwarded_scalar1;
        else 
            EX_float_ALU2_OP1 = EX_forwarded_vector1[63:32];

        if (DE_EX_floatALU2_op2_select)
            EX_float_ALU2_OP2 = EX_forwarded_scalar2;
        else
            EX_float_ALU2_OP2 = EX_forwarded_vector2[63:32];
    end

    // float ALU3
    always_comb begin 
        if (DE_EX_floatALU3_op1_select)
            EX_float_ALU3_OP1 = EX_forwarded_scalar1;
        else 
            EX_float_ALU3_OP1 = EX_forwarded_vector1[95:64];

        case (DE_EX_floatALU3_op2_select)
            2'b00: EX_float_ALU3_OP2 = EX_forwarded_vector2[95:64];
            2'b01: EX_float_ALU3_OP2 = EX_forwarded_scalar2;
            default: EX_float_ALU3_OP2 = EX_forwarded_vector1[127:96];
        endcase
    end

    // float ALU4
    always_comb begin 
        if (DE_EX_floatALU4_op1_select)
            EX_float_ALU4_OP1 = EX_forwarded_scalar1;
        else 
            EX_float_ALU4_OP1 = EX_forwarded_vector1[127:96];

        if (DE_EX_floatALU4_op2_select)
            EX_float_ALU4_OP2 = EX_forwarded_scalar2;
        else
            EX_float_ALU4_OP2 = EX_forwarded_vector2[127:96];
        endcase
    end

    Integer_alu IALU(.op1(EX_integer_ALU_OP1), .op2(EX_integer_ALU_OP2), .clk(clk), .rst_n(rst_n), .en(), .en_knock_down(EX_int_knockdown),
        .out(EX_integer_ALU_out), .done(EX_integer_done), .operation(DE_EX_integer_ALU_opcode), .flag(EX_int_flag));
    
    Float_alu FALU1(.op1(EX_float_ALU1_OP1), .op2(EX_float_ALU1_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU1_en), .en_knock_down(EX_float1_knockdown),
        .out(EX_float_ALU1_out), .done(EX_float1_done), .operation(DE_EX_float_ALU1_opcode), .flag(EX_float_flag));
    Float_alu FALU2(.op1(EX_float_ALU2_OP1), .op2(EX_float_ALU2_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU2_en), .en_knock_down(EX_float2_knockdown),
        .out(EX_float_ALU2_out), .done(EX_float2_done), .operation(DE_EX_float_ALU2_opcode), .flag());
    Float_alu FALU3(.op1(EX_float_ALU3_OP1), .op2(EX_float_ALU3_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU3_en), .en_knock_down(EX_float3_knockdown),
        .out(EX_float_ALU3_out), .done(EX_float3_done), .operation(DE_EX_float_ALU3_opcode), .flag());
    Float_alu FALU4(.op1(EX_float_ALU4_OP1), .op2(EX_float_ALU4_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU4_en), .en_knock_down(EX_float4_knockdown),
        .out(EX_float_ALU4_out), .done(EX_float4_done), .operation(DE_EX_float_ALU4_opcode), .flag());

    assign EX_int_flag_en = EX_integer_done & DE_EX_update_int_flag;
    assign EX_float_flag_en = EX_float1_done & DE_EX_update_float_flag;

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
            if (!MEM_busy) begin
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
            if (!MEM_busy) begin
                EX_MEM_Swb_address <= EX_busy ? 5'b0 : DE_EX_Swb_address;
                EX_MEM_Vwb_address <= EX_busy ? 4'b0 :DE_EX_Vwb_address;
                EX_MEM_V_data_address <= DE_EX_V1_address;
                EX_MEM_S_data_address <= DE_EX_S2_address;
            end
        end
    end

    // control
    logic [2:0] EX_MEM_memory_op, 
    logic EX_MEM_vector_reduce_en;
    logic MEM_v_reduce_knockdown, MEM_knockdown;
    logic EX_MEM_FIN, EX_MEM_context_switch;
    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_control_pipeline
        if (!rst_n) begin
            EX_MEM_memory_op <= 3'b0;
            EX_MEM_vector_reduce_en <= 1'b0;
            EX_MEM_FIN <= 1'b0;
            EX_MEM_context_switch <= 1'b0;
        end else begin
            if (!MEM_busy) begin
                DE_EX_FIN <= 1'b0;
                DE_EX_context_switch <= 1'b0;
            end
            if (MEM_knockdown)
                EX_MEM_memory_op <= 3'b0;
            else if (!MEM_busy)
                EX_MEM_memory_op <= EX_busy == 1'b1 ? 3'b0 : DE_EX_memory_op;

            if (MEM_v_reduce_knockdown)
                EX_MEM_vector_reduce_en <= 3'b0;
            else if (!MEM_busy)
                EX_MEM_vector_reduce_en <= EX_busy == 1'b1 ? 1'b0 : DE_EX_vector_reduce_en;
        end
    end


    //////////////////////////
    // MEM Stage
    ////////////////////////// 
    logic [31:0] MEM_reduce_out, MEM_forwarded_s_data;
    logic [127:0] MEM_forwarded_v_data;
    logic memory_done, V_reduce_done;

    assign MEM_knockdown = EX_MEM_memory_op[2];
    assign MEM_v_reduce_knockdown = EX_MEM_vector_reduce_en;
    
    assign MM_addr = EX_MEM_s_out;
    assign MM_data_write = EX_MEM_memory_op[0] == 1'b1 ? MEM_forwarded_v_data : {96'b0, MEM_forwarded_s_data};

    floatAdder FPU(EX_MEM_v_out[31:0], EX_MEM_v_out[93:64], 2'b00, MEM_reduce_out, EX_MEM_vector_reduce_en);
    waiting_state MEM_current_state, MEM_next_state;

    always_ff @( posedge clk, negedge rst_n ) begin : MEM_waiting_update_state     
        if (!rst_n)
            MEM_current_state <= idle;
        else
            MEM_current_state <= MEM_next_state;
    end

    always_comb begin : MEM_waiting_state_machine
        MEM_busy = 1'b0;
        MEM_next_state = MEM_current_state;
        case (MEM_current_state)
            idle: begin
                if (EX_MEM_memory_op[2] && ~memory_done) begin
                    MEM_next_state = waiting_int_MEM;
                    MEM_busy = 1'b1;
                end
                if (EX_MEM_vector_reduce_en && ~V_reduce_done) begin
                    MEM_next_state = waiting_float;
                    MEM_busy = 1'b1;
                end
            end
            waiting_int_MEM: begin
                MEM_busy = 1'b1;
                if (memory_done) begin
                    MEM_next_state = idle; 
                    MEM_busy = 1'b0;
                end
            end
            default: begin
                MEM_busy = 1'b1;
                if (V_reduce_done) begin
                    MEM_next_state = idle; 
                    MEM_busy = 1'b0;
                end
            end
        endcase
    end

    always_comb begin : MEM_forwarding
        if (EX_MEM_S_data_address == MEM_WB_Swb_address) 
            MEM_forwarded_s_data = EX_MEM_s_out;
        else 
            MEM_forwarded_s_data = EX_MEM_s_out;

        if (EX_MEM_V_data_address == MEM_WB_Vwb_address) 
            MEM_forwarded_v_data = EX_MEM_v_out;
        else 
            MEM_forwarded_v_data = EX_MEM_v_out;

    end

    //////////////////////////
    // MEM_WB Pipeline
    ////////////////////////// 

    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_data_pipeline
        if (!rst_n) begin
            MEM_WB_vector <= 128'b0;
            MEM_WB_scalar <= 32'b0;
            MEM_WB_Swb_address <= 5'b0;
            MEM_WB_Vwb_address <= 4'b0;
            MEM_WB_FIN <= 1'b0;
            MEM_WB_context_switch <= 1'b0;
        end
        else begin
            MEM_WB_FIN <= EX_MEM_FIN;
            MEM_WB_context_switch <= EX_MEM_context_switch;

            MEM_WB_Swb_address <= MEM_busy ? 5'b0 : EX_MEM_Swb_address;
            MEM_WB_Vwb_address <= MEM_busy ? 4'b0 :EX_MEM_Vwb_address;

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

    assign End_program = MEM_WB_FIN;
    assign Context_switch = MEM_WB_context_switch;


endmodule