module mem_main_j_tb();
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
    logic [19:0] addr_RT_rand[NUM_RT-1:0];
    

    logic [127:0] data_RT_in[NUM_RT-1:0];

    logic re_MC;
    logic [31:0] addr_MC;//


    logic rdy_RT[NUM_RT-1:0];
    logic [127:0] data_RT_out[NUM_RT-1:0];

    logic rdy_MC;//
    logic [127:0] data_MC_out;//

    always #1 clk = ~clk;


    mem_main #(NUM_RT, NUM_THREAD, NUM_BANK_PTHREAD) main(clk, rst_n, we_RT, re_RT, addr_RT, data_RT_in, addr_MC, re_MC,
                  data_RT_out, rdy_RT, data_MC_out, rdy_MC);

    initial begin
        clk = 0;
        rst_n = 1;
        for (int i = 0; i < NUM_RT; i++) begin
            we_RT[i] = 0;
            re_RT[i] = 0;
        end

        @(negedge clk);
        rst_n = 0;
        @(negedge clk);
        rst_n = 1;
    end
endmodule