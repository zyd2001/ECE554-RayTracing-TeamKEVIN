module mem_main_cont_tb();
    
    parameter NUM_RT = 4;
    parameter NUM_THREAD = 32;
    parameter NUM_BANK_PTHREAD = 4;
    localparam TESTS = 4;
    localparam ADDRESS_DEPTH_PBANK = 12;
    localparam ADDRESS_BIT = $clog2(NUM_THREAD)+ADDRESS_DEPTH_PBANK+2;
    
    logic clk;
    logic rst_n;
    logic we_RT[NUM_RT-1:0];
    logic re_RT[NUM_RT-1:0];
    logic [31:0] addr_RT[NUM_RT-1:0];
    logic [31:0] addr_RT_comp[NUM_RT-1:0];
    logic [ADDRESS_BIT-1:0] addr_RT_comp_base[NUM_RT-1:0];
    logic [ADDRESS_BIT-1:0] addr_RT_base[NUM_RT-1:0];
    

    logic [127:0] data_RT_in[NUM_RT-1:0];


    logic rd_rdy_RT[NUM_RT-1:0];
    logic [127:0] data_RT_out[NUM_RT-1:0];

    always #1 clk = ~clk;


    mem_main #(NUM_RT, NUM_THREAD, NUM_BANK_PTHREAD) main(clk, rst_n, we_RT, re_RT, '{1'b1,1'b1,1'b1,1'b1}, addr_RT, data_RT_in,
                  data_RT_out, rd_rdy_RT);
    
    int error = 0;
    int test_count = 0;
    int k = 0;
    int cycleperprint = 1 << 15;
    int total = 1 << (ADDRESS_BIT-2);
    initial begin
        clk = 1;
        rst_n = 1;
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end
        for(int test = 0; test < TESTS; test++) begin
            we_RT = '{NUM_RT{1'b0}};
            re_RT = '{NUM_RT{1'b0}};
            $display("Test %d starting... ", test);
            for(int i=0;i<NUM_RT;++i) begin
                addr_RT[i] = 32'b0;
                addr_RT_base[i] = (i << (ADDRESS_BIT-2)) + test;
                data_RT_in[i] = 128'b0;
            end

            // test on RT
            for (int k = 0; k < total; k++) begin
                // test foreach core
                for(int i = NUM_RT-1; i >= 0; i--) begin
                    we_RT[i] = 1'b1;
                    addr_RT[i] = {{(30-ADDRESS_BIT){1'b0}}, addr_RT_base[i], 2'b0};
                    data_RT_in[i] = {(addr_RT[i]>>2)+(4<<28),(addr_RT[i]>>2) + (3<<28),(addr_RT[i]>>2) + (2<<28),(addr_RT[i]>>2) + (1<<28)};
                    addr_RT_base[i]=addr_RT_base[i]+4;
                    if(k % cycleperprint == 0) begin
                        $display("cycle %d, current write address 0x%h at port %d", k, addr_RT[i], i);
                    end
                end
                @(posedge clk);
            end
            // RT read
            for(int i=0;i<NUM_RT;++i) begin
                we_RT[i] = 1'b0;
                addr_RT[i] = 32'b0;
                addr_RT_comp[i] = 32'b0;
                addr_RT_comp_base[i] = (i << (ADDRESS_BIT-2)) + test;
                addr_RT_base[i] = (i << (ADDRESS_BIT-2)) + test;
                data_RT_in[i] = 128'b0;
            end
            for (int k = 0; k < total+4; k++) begin
                // test foreach core
                for(int i = NUM_RT-1; i >= 0; i--) begin
                    re_RT[i] = 1'b1;
                    addr_RT[i] = {{(30-ADDRESS_BIT){1'b0}}, addr_RT_base[i], 2'b0};
                    addr_RT_comp[i] = {{(30-ADDRESS_BIT){1'b0}}, addr_RT_comp_base[i], 2'b0};
                end
                @(posedge clk);
                for(int i = NUM_RT-1; i >= 0; i--) begin
                    if(rd_rdy_RT[0]) begin
                        test_count++;
                        if({(addr_RT_comp[i]>>2)+(4<<28),(addr_RT_comp[i]>>2) + (3<<28),(addr_RT_comp[i]>>2) + (2<<28),(addr_RT_comp[i]>>2) + (1<<28)} !== data_RT_out[i]) begin
                            $display("Error! At cycle: %d, Failed R at address: 0x%h, port %d, data expecting: 0x%h, data got: 0x%h", 
                                    k, (addr_RT_comp[i]>>2), i, {(addr_RT_comp[i]>>2)+(4<<28),(addr_RT_comp[i]>>2) + (3<<28),(addr_RT_comp[i]>>2) + (2<<28),(addr_RT_comp[i]>>2) + (1<<28)}, data_RT_out[i]); 
                            error ++;
                            $stop();
                        end
                        addr_RT_comp_base[i]=addr_RT_comp_base[i]+4;
                    end
                    addr_RT_base[i]=addr_RT_base[i]+4;
                    if(k % cycleperprint == 0) begin
                        $display("cycle %d, current read address 0x%h at port %d", k, addr_RT[i], i);
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