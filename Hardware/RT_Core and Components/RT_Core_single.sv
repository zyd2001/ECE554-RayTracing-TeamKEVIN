module RT_Core_single (
    clk, rst_n,
    Kernel_mode, End_program, Context_switch, 
    scalar_wen, scalar_wb_address, scalar_wb_data,
    vector_wen, vector_wb_address, vector_wb_data,
    scalar_read_address1, scalar_read_address2, 
    vector_read_address1, vector_read_address2,
    scalar_read1, scalar_read2,
    vector_read1, vector_read2,

    MRTI_addr_rd, MRTI_data_rd
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

    logic [31:0] PC_reg;
    logic jump_enable;
    logic [31:0] IF_PC_plus_four, IF_next_PC, IF_instruction;

    logic IF_DE_enable, IF_DE_reset;
    logic [31:0] IF_DE_current_PC, IF_DE_instruction, IF_DE_current_PC_plus_four, IF_DE_instruction_bypass;
    

    logic [31:0] RF_scalar1_out, RF_scalar2_out, DE_scalar1, DE_scalar2;
    logic [127:0] DE_vector1, DE_vector2;
    logic [31:0] DE_PC_plus_four_offset;

    // Opcode Decode
    logic DE_EX_S1_enable, DE_EX_S2_enable, DE_EX_V1_enable, DE_EX_V2_enable, DE_EX_Swb_enable, DE_EX_Vwb_enable;
    logic [4:0] DE_EX_S1_address, DE_EX_S2_address, DE_EX_Swb_address;
    logic [3:0] DE_EX_V1_address, DE_EX_V2_address, DE_EX_Vwb_address;

    logic DE

 

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

    //////////////////////////
    // DE EX Pipeline
    ////////////////////////// 

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            DE_EX_S1_enable <= 1'b0;
            DE_EX_S2_enable <= 1'b0;
            DE_EX_V1_enable <= 1'b0;
            DE_EX_V2_enable <= 1'b0;
            DE_EX_Swb_enable <= 1'b0;
            DE_EX_Vwb_enable <= 1'b0;
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
                    DE_EX_S1_enable <= 1'b0;
                    DE_EX_S2_enable <= 1'b0;
                    DE_EX_V1_enable <= 1'b1;
                    DE_EX_V2_enable <= 1'b1;
                    DE_EX_Swb_enable <= 1'b0;
                    DE_EX_Vwb_enable <= ~IF_DE_instruction[28];
                end 
                // VF instructions
                else if(IF_DE_instruction[30:28] === 3'b010) begin
                    DE_EX_S1_enable <= 1'b0;
                    DE_EX_S2_enable <= 1'b1;
                    DE_EX_V1_enable <= 1'b1;
                    DE_EX_V2_enable <= 1'b0;
                    DE_EX_Swb_enable <= 1'b0;
                    DE_EX_Vwb_enable <= 1'b1;
                end 
                // NAOX instructions 
                else if(IF_DE_instruction[30:28] === 3'b011) begin
                    DE_EX_S1_enable <= 1'b1;
                    DE_EX_S2_enable <= 1'b1;
                    DE_EX_V1_enable <= 1'b0;
                    DE_EX_V2_enable <= 1'b0;
                    DE_EX_Swb_enable <= 1'b1;
                    DE_EX_Vwb_enable <= 1'b0;
                end 
                // Int and Float operations
                else begin
                    DE_EX_S1_enable <= 1'b1;
                    DE_EX_S2_enable <= 1'b1;
                    DE_EX_V1_enable <= 1'b0;
                    DE_EX_V2_enable <= 1'b0;
                    DE_EX_Swb_enable <= ~IF_DE_instruction[28];
                    DE_EX_Vwb_enable <= 1'b0;
                    if ()
                end
            end
            // Immediate MODe
            else begin
                


            end
            

        end
    end
    
    // EX stage 
    logic [31:0] EX_integer_ALU_OP1, EX_integer_ALU_OP2;
    

endmodule