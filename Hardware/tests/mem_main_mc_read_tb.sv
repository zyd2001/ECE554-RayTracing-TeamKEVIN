module mem_main_mc_read_tb();
    
    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    localparam TESTS = 3;
    localparam ADDRESS_DEPTH_PBANK = 12;
    localparam NUM_THREAD_BIT = $clog2(NUM_THREAD);
    localparam ADDRESS_BIT = ADDRESS_DEPTH_PBANK;
    
    logic clk;
    logic rst_n;
    logic we_RT[NUM_RT-1:0];
    logic re_RT[NUM_RT-1:0];
    logic [31:0] addr_RT[NUM_RT-1:0];
    logic [ADDRESS_BIT-1:0] addr_RT_base;
    logic [NUM_THREAD_BIT-1:0] addr_RT_thread[NUM_RT-1:0];
    

    logic [127:0] data_RT_in[NUM_RT-1:0];

    logic re_MC;


    logic rd_rdy_RT[NUM_RT-1:0];
    logic [127:0] data_RT_out[NUM_RT-1:0];

    logic rdy_MC;
    logic [127:0] data_MC_out;

    always #1 clk = ~clk;


    mem_main #(NUM_RT, NUM_THREAD, NUM_BANK_PTHREAD) main(clk, rst_n, we_RT, re_RT, addr_RT, data_RT_in, re_MC,
                  data_RT_out, rd_rdy_RT, data_MC_out, rdy_MC);
    
    logic [127:0] datastore [NUM_THREAD-1:0];
    logic RT_busy[NUM_RT-1:0];
    logic end_test;
    int error = 0;
    initial begin
        for(int test = 0; test < TESTS; test++) begin
            $display("Test %d starting... ", test);
            clk = 1;
            rst_n = 1;
            addr_RT_base = {(ADDRESS_BIT-1){1'b1}};
            we_RT = '{NUM_RT{1'b0}};
            re_RT = '{NUM_RT{1'b0}};
            for(int i=0;i<NUM_RT;++i) begin
                addr_RT[i] = 32'b0;
                data_RT_in[i] = 128'b0;
                addr_RT_thread[i] = i;
            end
            re_MC = 1'b0;

            // reset
            @(posedge clk) begin end
            rst_n = 1'b0; // active low reset
            @(posedge clk) begin end
            rst_n = 1'b1; // reset finished
            @(posedge clk) begin end
            // write output from RT
            while(!end_test) begin
                // test foreach core
                for(int i = NUM_RT-1; i >= 0; i--) begin
                    we_RT[i] = 1'b1;
                    data_RT_in[i] = {$random,$random,$random,$random};
                    datastore[addr_RT_thread[i]] = data_RT_in[i];
                    addr_RT[i] = {addr_RT_thread[i], addr_RT_base, 4'b0};
                    if(&addr_RT_thread[i]) begin
                        end_test = 1;
                    end
                    addr_RT_thread[i] = addr_RT_thread[i] + 4;
                    $display("current writing address 0x%h", addr_RT[i]);
                end
                @(posedge clk);
            end
            end_test = 0;
            for(int i = NUM_RT-1; i >= 0; i--) begin
                we_RT[i] = 1'b0;
            end
            @(negedge clk);
            addr_RT_thread[0] = 0;
            // test pipe read from mc
            while(!end_test) begin
                re_MC = 1'b1;
                @(posedge clk);
                if(rdy_MC) begin
                    if(data_MC_out !== datastore[addr_RT_thread[0]]) begin
                        $display("Error! At thread: %d, data expecting: 0x%h, data got: 0x%h", 
                                addr_RT_thread[0], datastore[addr_RT_thread[0]], data_MC_out); 
                        error ++;
                        //$stop();
                    end
                    if(&addr_RT_thread[0]) begin
                        end_test = 1;
                    end
                    addr_RT_thread[0]++;
                end
            end

        end
        if(error == 0) begin
            $display("All tests passed!!!"); 
        end
        else begin
            $display("There are <%d> errors", error);
        end
        $stop();
    end
endmodule