module mem_main(clk, rst_n, we_RT, re_RT, addr_RT, data_RT_in, re_MC,
                data_RT_out, rd_rdy_RT, data_MC_out, rdy_MC);

    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    localparam NUM_BANK = NUM_THREAD * NUM_BANK_PTHREAD;

    /*
        Input
    */
    input clk, rst_n;
    //RT
    input we_RT[NUM_RT-1:0];
    input re_RT[NUM_RT-1:0];
    input [31:0] addr_RT[NUM_RT-1:0];
    input [127:0] data_RT_in[NUM_RT-1:0];
    //MC
    input re_MC;

    /*
        Output
    */
    //RT
    output reg rd_rdy_RT[NUM_RT-1:0];
    output [127:0] data_RT_out[NUM_RT-1:0];
    //MC
    output reg rdy_MC;
    output [127:0] data_MC_out;
endmodule