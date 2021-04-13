module mem_main_tb();
    
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

    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    localparam TESTS=10;

    mem_main #(NUM_RT, NUM_THREAD, NUM_BANK_PTHREAD) main(clk, rst_n, we_RT, re_RT, addr_RT, data_RT_in, addr_MC, re_MC,
                  data_RT_out, rdy_RT, data_MC_out, rdy_MC);
    
    logic [127:0] data_RT_copy[NUM_RT-1:0];
    logic [31:0] addr_RT_copy[NUM_RT-1:0];
    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        we_RT = `{NUM_RT{0}};
        re_RT = `{NUM_RT{0}};
        for(int i=0;i<NUM_RT;++i) begin
            addr_RT[i] = 32'b0;
            data_RT_in[i] = 128'b0;
        end
        re_MC = 1'b0;
        addr_MC = 32'b0;;

        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end
        // test on RT
        for(int test = 0; test < TESTS; test++) begin
            int testcycle = 1000;
            for(int k = 0; k < testcycle; k++) begin
                // test foreach core
                for(int i = 0; i < NUM_RT; i++) begin
                    if(!we_RT[i]) begin
                        we_RT[i] = $random;
                        data_RT_in[i] = $random;
                        addr_RT_rand[i] = $random;
                        addr_RT[i] = {10'b0, addr_RT_rand[i], 2'b0}
                    end
                    if(we_RT[i] & !re_RT) begin
                        data_RT_copy[i] = data_RT_in[i];
                        addr_RT_copy[i] = addr_RT[i];
                    end
                end
                @(posedge clk);
                for(int j = 0; j < NUM_RT; j++)begin
                    if(rdy_RT[j]) begin
                        if(we_RT[j]) begin
                            re_RT[j] = we_RT[j];
                            we_RT[j] = 0;
                        end
                        else if(re_RT[j]) begin
                            if(data_RT_copy[j] !== data_RT_out[j]) begin
                                error ++;
                                $display("Error! Failed W/R at address: 0x%h, port %d, data expecting: 0x%h, data got: 0x%h", 
                                     addr_RT_copy[j], j, data_RT_copy[j], data_RT_out[j]); 
                            end
                            re_RT[i] = 0;
                        end
                    end
                end    
                @(negedge clk);
            end
        end
        if(error == 0) begin
            $display("All test passed!!!"); 
        end
        else begin
            $display("No! there are %d errors", error);
        end
    end
endmodule