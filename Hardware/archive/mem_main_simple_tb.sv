module mem_main_simple_tb();
    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    localparam TESTS=1;
    localparam TEST_CYCLE = 50;


    logic clk;
    logic rst_n;
    logic we_RT[NUM_RT-1:0];
    logic re_RT[NUM_RT-1:0];
    logic [31:0] addr_RT[NUM_RT-1:0];
    
    logic [127:0] data_RT_in[NUM_RT-1:0];

    logic re_MC;
    logic [31:0] addr_MC;//


    wire rdy_RT[NUM_RT-1:0];
    wire [127:0] data_RT_out[NUM_RT-1:0];

    wire rdy_MC;//
    wire [127:0] data_MC_out;//

    always #1 clk = ~clk;


    mem_main #(NUM_RT, NUM_THREAD, NUM_BANK_PTHREAD) main(clk, rst_n, we_RT, re_RT, addr_RT, data_RT_in, addr_MC, re_MC,
                  data_RT_out, rdy_RT, data_MC_out, rdy_MC);

    // initial begin
    //     clk = 0;
    //     rst_n = 1;
    //     for (int i = 0; i < NUM_RT; i++) begin
    //         we_RT[i] = 0;
    //         re_RT[i] = 0;
    //         addr_RT = 32'b0;
    //         data_RT_in = 128'b0;
    //         re_MC = 0;
    //         addr_MC = 32'b0;
    //     end

    //     @(negedge clk);
    //     rst_n = 0;
    //     @(negedge clk);
    //     rst_n = 1;

    //     for (int i = 0; i < 64; i++) begin
    //         for (int j = 0; j < 4; j++) begin
    //             for (int k = 0; k < 4096; k++)
    //                 re_RT[i] = 1;
    //                 addr_RT = {{10{1'b0}}, 6'(i), {2{1'b0}}, };
    //         end
    //     end
    // end
endmodule