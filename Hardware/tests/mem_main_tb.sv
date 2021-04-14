module mem_main_tb();
    
    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    localparam TESTS = 1;
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
    
    logic [127:0] data_RT_copy[NUM_RT+1:0];
    logic [31:0] addr_RT_copy[NUM_RT+1:0];
    logic we_RT_copy[NUM_RT+1:0];
    int error = 0;
    int test_count = 0;
    initial begin
        for(int test = 0; test < TESTS; test++) begin
            clk = 1;
            rst_n = 1;
            we_RT = '{NUM_RT{1'b0}};
            re_RT = '{NUM_RT{1'b0}};
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
            for(int k = 0; k < TEST_CYCLE; k++) begin
                // test foreach core
                for(int i = NUM_RT-1; i >= 0; i--) begin
                    if(!we_RT[i] & !re_RT[i]) begin
                        we_RT[i] = 1'b1;
                        data_RT_in[i] = {$random,$random,$random,$random};
                        addr_RT_rand[i] = $random;
                        addr_RT[i] = {10'b0, addr_RT_rand[i], 2'b0};
                        // avoid conflict
                        for(int j = 0; j < NUM_RT; j++) begin
                            while(addr_RT[i][21:16] === data_RT_copy[j][21:16]) begin
                                addr_RT_rand[i] = $random;
                                addr_RT[i] = {10'b0, addr_RT_rand[i], 2'b0};
                            end
                        end
                    end
                    if(we_RT[i] & !re_RT[i]) begin
                        data_RT_copy[i+2] = data_RT_in[i];
                        addr_RT_copy[i+2] = addr_RT[i];
                        we_RT_copy[i+2] = we_RT[i];
                        if(i == 1) begin
                            data_RT_copy[1] = data_RT_copy[NUM_RT+1];
                            addr_RT_copy[1] = addr_RT_copy[NUM_RT+1];
                            we_RT_copy[1] = we_RT_copy[NUM_RT+1];
                        end
                        if(i == 0) begin
                            data_RT_copy[0] = data_RT_copy[NUM_RT];
                            addr_RT_copy[0] = addr_RT_copy[NUM_RT];
                            we_RT_copy[0] = we_RT_copy[NUM_RT];
                        end
                    end
                end
                @(posedge clk);
                @(negedge clk);
                // test read
                for(int j = 0; j < NUM_RT; j++)begin
                    if(rdy_RT[j]) begin
                        if(we_RT[j]) begin
                            re_RT[j] = we_RT_copy[j];
                            we_RT[j] = 0;
                            addr_RT[j] = addr_RT_copy[j];
                        end
                        else if(re_RT[j]) begin
                            test_count ++;
                            if(data_RT_copy[j] !== data_RT_out[j]) begin
                                $display("Error! At cycle: %d, Failed R at address: 0x%h, port %d, data expecting: 0x%h, data got: 0x%h", 
                                        k, addr_RT_copy[j], j, data_RT_copy[j], data_RT_out[j]); 
                                error ++;
                                //$stop();
                            end
                            re_RT[j] = 0;
                        end
                    end
                end
            end
        end
        if(error == 0) begin
            $display("All <%d> tests passed!!!", test_count); 
        end
        else begin
            $display("In all <%d> tests, there are <%d> errors", test_count, error);
        end
        $stop();
    end
endmodule