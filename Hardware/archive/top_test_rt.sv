`include "platform_if.vh"
`include "afu_json_info.vh"
module top_test_rt(clk, rst, rx, tx);
    
    input clk, rst;
    input  t_if_ccip_Rx rx;
    output t_if_ccip_Tx tx;

    localparam NUM_RT = 4;
    localparam BIT_RT = $clog2(NUM_RT);
    localparam NUM_IC = 4;
    localparam BIT_IC = $clog2(NUM_IC);
    localparam NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);

    logic rst_n;
    assign rst_n = ~rst;




    // Control / Normal signals
    logic kernel_mode;

    logic End_program, Context_switch;
    logic End_program_reg, Context_switch_reg;

    // PD interface signals
    logic PD_scalar_wen, PD_vector_wen;
    logic [4:0] PD_scalar_wb_address, PD_scalar_read_address1, PD_scalar_read_address2;
    logic [3:0] PD_vector_wb_address, PD_vector_read_address1, PD_vector_read_address2;
    logic [31:0] PD_scalar_wb_data;
    logic [127:0] PD_vector_wb_data;

    logic [31:0] PD_scalar_read1, PD_scalar_read2;
    logic [31:0] PD_scalar_read1_reg, PD_scalar_read2_reg;
    logic [127:0] PD_vector_read1, PD_vector_read2;
    logic [127:0] PD_vector_read1_reg, PD_vector_read2_reg;

    // Instruction memory related
    logic [31:0] MRTI_data;

    logic [31:0] MRTI_addr;
    logic [31:0] MRTI_addr_reg;

    // Main Memory + Const Memory related
    logic [127:0] MEM_data_read;
    logic MEM_done;  

    logic [31:0] MEM_addr;
    logic [31:0] MEM_addr_reg;
    logic [127:0] MEM_data_write; 
    logic [127:0] MEM_data_write_reg;
    logic MEM_read_en, MEM_write_en;
    logic MEM_read_en_reg, MEM_write_en_reg;

    RT_core_single rt(.*);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            kernel_mode <= 0;
            PD_scalar_wen<=0;
            PD_vector_wen<=0;
            PD_scalar_wb_address<=0;
            PD_scalar_read_address1<=0;
            PD_scalar_read_address2<=0;
            PD_vector_wb_address<=0;
            PD_vector_read_address1<=0;
            PD_vector_read_address2<=0;
            PD_scalar_wb_data<=0;
            PD_vector_wb_data<=0;
            MRTI_data<=0;
            MEM_data_read<=0;
            MEM_done<=0;

            End_program_reg<=0;
            Context_switch_reg<=0;
            PD_scalar_read1_reg<=0;
            PD_scalar_read2_reg<=0;
            PD_vector_read1_reg<=0;
            PD_vector_read2_reg<=0;
            MRTI_addr_reg<=0;
            MEM_addr_reg<=0;
            MEM_data_write_reg<=0;
            MEM_read_en_reg<=0;
            MEM_write_en_reg<=0;
        end
        else begin
            kernel_mode <= rx.c0.data[0];
            PD_scalar_wen<=rx.c0.data[1];
            PD_vector_wen<=rx.c0.data[2];
            PD_scalar_wb_address<=rx.c0.data[4:0];
            PD_scalar_read_address1<=rx.c0.data[9:5];
            PD_scalar_read_address2<=rx.c0.data[14:10];
            PD_vector_wb_address<=rx.c0.data[18:15];
            PD_vector_read_address1<=rx.c0.data[22:19];
            PD_vector_read_address2<=rx.c0.data[26:23];
            PD_scalar_wb_data<=rx.c0.data[31:0];
            PD_vector_wb_data<=rx.c0.data[127:0];
            MRTI_data<=rx.c0.data[63:32];
            MEM_data_read<=rx.c0.data[255:128];
            MEM_done<=rx.c0.data[300];

            End_program_reg<=End_program;
            Context_switch_reg<=Context_switch;
            PD_scalar_read1_reg<=PD_scalar_read1;
            PD_scalar_read2_reg<=PD_scalar_read2;
            PD_vector_read1_reg<=PD_vector_read1;
            PD_vector_read2_reg<=PD_vector_read2;
            MRTI_addr_reg<=MRTI_addr;
            MEM_addr_reg<=MEM_addr;
            MEM_data_write_reg<=MEM_data_write;
            MEM_read_en_reg<=MEM_read_en;
            MEM_write_en_reg<=MEM_write_en;
        end
    end

    logic [63:0] tx_reg_0, tx_reg_1, tx_reg_2, tx_reg_3;
    logic [63:0] tx_reg_out;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_reg_0 <=64'h0;
            tx_reg_1 <= 64'h0;
            tx_reg_2 <= 64'h0;
            tx_reg_3 <= 64'h0;
            tx_reg_out <= 64'h0;
        end
        else begin
            tx_reg_0 <= {{60'h0},End_program_reg,Context_switch_reg,MEM_read_en_reg,MEM_write_en_reg};
            tx_reg_1 <= {PD_scalar_read1_reg & PD_scalar_read2_reg, MRTI_addr_reg & MEM_addr_reg};
            tx_reg_2 <= PD_vector_read1_reg[127:64] & PD_vector_read1_reg[63:0] 
                        & PD_vector_read2_reg[127:64] & PD_vector_read2_reg[63:0];
            tx_reg_3 <= MEM_data_write_reg[127:64] & MEM_data_write_reg[63:0];
            tx_reg_out <= tx_reg_0 & tx_reg_1 & tx_reg_2 & tx_reg_3;
        end
    end

    assign tx.c2.data = tx_reg_out;

endmodule


Float_alu FALU1(.op1(EX_float_ALU1_OP1), .op2(EX_float_ALU1_OP2), .clk(clk), .rst_n(rst_n)
, .en(DE_EX_floatALU1_en), .en_knock_down(EX_float1_knockdown),
        .out(EX_float_ALU1_out), .done(EX_float_done), .operation(DE_EX_float_ALU_opcode)
        , .flag(EX_float_flag));
    
    assign EX_float_ALU1_out = EX_float_ALU1_OP1 + EX_float_ALU1_OP2;
    assign EX_float_flag = DE_EX_float_ALU_opcode[2:1] & DE_EX_float_ALU_opcode[1:0];
    assign EX_float_done = EX_float_ALU1_OP1[9] & DE_EX_floatALU1_en;
    assign EX_float1_knockdown = EX_float_ALU1_OP2[10]
    
    Float_alu FALU2(.op1(EX_float_ALU2_OP1), .op2(EX_float_ALU2_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU2_en), .en_knock_down(EX_float2_knockdown),
        .out(EX_float_ALU2_out), .done(), .operation(DE_EX_float_ALU_opcode), .flag());

    assign EX_float_ALU2_out = EX_float_ALU2_OP1 + EX_float_ALU2_OP2；
    assign EX_float2_knockdown = DE_EX_floatALU2_en & (&DE_EX_float_ALU_opcode);

    Float_alu FALU3(.op1(EX_float_ALU3_OP1), .op2(EX_float_ALU3_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU3_en), .en_knock_down(EX_float3_knockdown),
        .out(EX_float_ALU3_out), .done(), .operation(DE_EX_float_ALU_opcode), .flag());

    assign EX_float_ALU3_out = EX_float_ALU3_OP1 + EX_float_ALU3_OP2;
    assign EX_float3_knockdown = DE_EX_floatALU3_en & (&DE_EX_float_ALU_opcode);

    Float_alu FALU4(.op1(EX_float_ALU4_OP1), .op2(EX_float_ALU4_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU4_en), .en_knock_down(EX_float4_knockdown),
        .out(EX_float_ALU4_out), .done(), .operation(DE_EX_float_ALU_opcode), .flag());

    assign EX_float_ALU4_out = EX_float_ALU4_OP1 + EX_float_ALU4_OP2;
    assign EX_float4_knockdown = DE_EX_floatALU4_en & (&DE_EX_float_ALU_opcode);