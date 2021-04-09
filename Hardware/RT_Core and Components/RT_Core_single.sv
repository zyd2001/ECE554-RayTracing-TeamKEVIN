module RT_Core_single (
    clk, rst_n,
    Kernel_mode, End_program, Context_switch, 
    PD_scalar_wen, PD_scalar_wb_address, PD_scalar_wb_data,
    PD_vector_wen, PD_vector_wb_address, PD_vector_wb_data,
    PD_scalar_read_address1, PD_scalar_read_address2, 
    PD_vector_read_address1, PD_vector_read_address2,
    PD_scalar_read1, PD_scalar_read2,
    PD_vector_read1, PD_vector_read2,

    MRTI_addr_rd, MRTI_data_rd
);
    input clk, rst_n;
    input Kernel_mode;
    output End_program, Context_switch;

    input PD_scalar_wen, PD_vector_wen;
    input  [4:0] PD_scalar_wb_address, PD_scalar_read_address1, PD_scalar_read_address2;
    input  [3:0] PD_vector_wb_address, PD_vector_read_address1, PD_vector_read_address2;
    input  [31:0] PD_scalar_wb_data;
    input  [127:0] PD_vector_wb_data;
    output [31:0] PD_scalar_read1, PD_scalar_read2;
    output [127:0] PD_vector_read1, PD_vector_read2;

    // Memory related
    input [31:0] MRTI_data_rd;
    output [31:0] MRTI_addr_rd;

    logic [31:0] PC_reg;
    logic [31:0] IF_PC_plus_four, IF_next_PC, IF_instruction;

    logic IF_DE_enable, IF_DE_reset;
    logic [31:0] IF_DE_current_PC, IF_DE_instruction, IF_DE_current_PC_plus_four, IF_DE_instruction_bypass;

    logic [31:0] RF_scalar1_out, RF_scalar2_out, DE_scalar1, DE_scalar2;
    logic [127:0] DE_vector1, DE_vector2;
    //////////////////////////
    // Instruction Fetch Stage
    //////////////////////////
    assign IF_PC_plus_four = PC_reg + 4;
    assign IF_next_PC = IF_PC_plus_four; // more to come
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
    )

    assign 

endmodule