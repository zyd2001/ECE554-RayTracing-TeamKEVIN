module mem_main_full_tb();
    
    parameter NUM_RT = 4;
    parameter NUM_THREAD = 32;
    parameter NUM_BANK_PTHREAD = 4;
    localparam TESTS = 2;
    localparam ADDRESS_DEPTH_PBANK = 12;
    localparam ADDRESS_BIT = $clog2(NUM_THREAD)+ADDRESS_DEPTH_PBANK+2;
    
    logic clk;
    logic rst_n;
    logic we_RT[NUM_RT-1:0];
    logic re_RT[NUM_RT-1:0];
    logic [31:0] addr_RT[NUM_RT-1:0];
    logic [ADDRESS_BIT-1:0] addr_RT_base[NUM_RT-1:0];
    

    logic [127:0] data_RT_in[NUM_RT-1:0];


    logic rd_rdy_RT[NUM_RT-1:0];
    logic [127:0] data_RT_out[NUM_RT-1:0];

    always #1 clk = ~clk;

    mem_main #(NUM_RT, NUM_THREAD, NUM_BANK_PTHREAD) main(clk, rst_n, we_RT, re_RT, '{1'b1,1'b1,1'b1,1'b1}, addr_RT, data_RT_in,
                  data_RT_out, rd_rdy_RT);
    
    logic [127:0] data_RT_copy[NUM_RT+1:0];
    logic [31:0] addr_RT_copy[NUM_RT+1:0];
    logic we_RT_copy[NUM_RT+1:0];
    logic RT_busy[NUM_RT-1:0];
    int error = 0;
    int test_count = 0;
    logic [1:0] end_test;
    int k = 0;
    int prevk = 0;
    int cycleperprint = 1 << 15;
    initial begin
        for(int test = 0; test < TESTS; test++) begin
            $display("Test %d starting... ", test);
            clk = 1;
            rst_n = 1;
            we_RT = '{NUM_RT{1'b0}};
            re_RT = '{NUM_RT{1'b0}};
            RT_busy = '{NUM_RT{1'b0}};
            end_test = 2'b0;
            for(int i=0;i<NUM_RT;++i) begin
                addr_RT[i] = 32'b0;
                addr_RT_base[i] = i << (ADDRESS_BIT-2);
                data_RT_in[i] = 128'b0;
            end

            // reset
            @(posedge clk) begin end
            rst_n = 1'b0; // active low reset
            @(posedge clk) begin end
            rst_n = 1'b1; // reset finished
            @(posedge clk) begin end
            // test on RT
            while(!end_test[1]) begin
                k++;
                // test foreach core
                for(int i = NUM_RT-1; i >= 0; i--) begin
                    if(!RT_busy[i]) begin
                        RT_busy[i] = 1'b1;
                        we_RT[i] = 1'b1;
                        data_RT_in[i] = {$random,$random,$random,$random};
                        addr_RT[i] = {{(30-ADDRESS_BIT){1'b0}}, addr_RT_base[i], 2'b0};
                        if(&addr_RT_base[i]) begin
                            end_test = 2'b01;
                        end
                        addr_RT_base[i] ++;
                        if(k % cycleperprint < prevk) begin
                            $display("cycle %d, current address 0x%h at port %d", k, addr_RT[i], i);
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
                if(we_RT[0] & !re_RT[0]) begin
                   prevk = k % cycleperprint;
                end
                @(posedge clk);
                @(negedge clk);
                // test read
                for(int j = 0; j < NUM_RT; j++)begin
                    if(re_RT[j]) begin
                        re_RT[j] = 1'b0;
                    end
                    else if(we_RT[j]) begin
                        re_RT[j] = we_RT_copy[j];
                        we_RT[j] = 0;
                        addr_RT[j] = addr_RT_copy[j];
                    end
                    if(rd_rdy_RT[j]) begin
                        test_count ++;
                        if(data_RT_copy[j] !== data_RT_out[j]) begin
                            $display("Error! At cycle: %d, Failed R at address: 0x%h, port %d, data expecting: 0x%h, data got: 0x%h", 
                                    k, addr_RT_copy[j], j, data_RT_copy[j], data_RT_out[j]); 
                            error ++;
                            $stop();
                        end
                        RT_busy[j] = 0;
                        if(end_test[0])begin
                            end_test = 2'b10;
                        end
                    end
                end
            end
        end
        if(test_count == 0) begin
            $display("Error! <%d> test has been run", test_count);
        end 
        else if(error == 0) begin
            $display("All <%d> tests passed!!!", test_count); 
        end
        else begin
            $display("In all <%d> tests, there are <%d> errors", test_count, error);
        end
        $stop();
    end
endmodule