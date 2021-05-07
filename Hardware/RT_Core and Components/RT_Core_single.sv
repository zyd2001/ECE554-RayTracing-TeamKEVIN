module RT_Core_single (
    clk, rst_n,
    Kernel_mode, End_program, Context_switch, 
    PD_scalar_wen, PD_scalar_wb_address, PD_scalar_wb_data,
    PD_vector_wen, PD_vector_wb_address, PD_vector_wb_data,
    PD_scalar_read_address1, PD_scalar_read_address2, 
    PD_vector_read_address1, PD_vector_read_address2,
    PD_scalar_read1, PD_scalar_read2,
    PD_vector_read1, PD_vector_read2
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

    


endmodule