module mem_inst_const(clk, rst_n, addr, data_MC, ctrl_MC, busy, data_out);

    parameter DEPTH = 512;
    /*
        Input
    */
    input clk, rst_n;
    // DUT
    input unsigned [31:0] addr;
    // MC
    input [31:0] data_MC;
    input [1:0] ctrl_MC;
    /*
        Output
    */
    // DUT
    output [31:0] data_out;
    output busy;

    logic we;
    logic [31:0] data_in;
    // mem modules
    mem_simple #(.DEPTH(DEPTH)) mem (.clk(clk), .rst_n(rst_n), .we(we), .addr(addr), .data_in(data_in), 
            .data_MC(data_MC), .ctrl_MC(ctrl_MC), .busy(busy), .data_out(data_out));
    
endmodule