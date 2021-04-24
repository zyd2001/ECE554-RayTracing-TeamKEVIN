module mem_simple_tb();

    parameter DEPTH = 512;
    localparam BIT_ADDR = $clog2(DEPTH);
    localparam TESTS = 100000;
    /*
        Input
    */
    logic clk, rst_n;

    always #1 clk = ~clk;
    
    // DUT
    logic we;
    logic unsigned [31:0] addr_in;
    logic [31:0] data_in;
    // MC
    logic [31:0] data_MC;
    logic [1:0]ctrl_MC;
    logic we_MC, wdone_MC;
    assign ctrl_MC[0] = we_MC;
    assign ctrl_MC[1] = wdone_MC;
    /*
        Output
    */
    // DUT
    logic [31:0] data_out;
    logic busy;

    mem_simple mem(clk, rst_n, we, addr_in, data_in, data_MC, ctrl_MC, busy, data_out);
    int data_store [DEPTH-1:0];
    logic unsigned [BIT_ADDR-1:0] rand_addr, addr_copy;
    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        we = 0;
        addr_in = 0;
        data_in = 0;
        data_MC = 0;
        we_MC = 0;
        wdone_MC = 0;
        addr_copy = 0;
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end

        // MC write
        for(int i = 0; i < DEPTH; i++) begin
            data_MC = i;
            we_MC = 1;
            data_store[i] = i;
            @(posedge clk);
            if(!busy) begin
                $display("Error! busy is not high during MC write at: %h", i);
                error ++;
            end
        end
        we_MC = 0;
        wdone_MC = 1;
        @(posedge clk);
        wdone_MC = 0;
        @(negedge busy);

        // full read
        for(int i = 0; i < DEPTH; i++) begin
            addr_in = {{(32-BIT_ADDR-2){1'b0}}, i, 2'b0};
            if(busy) begin
                $display("Error! busy is high after MC write at: %h", i);
                error ++;
            end
            @(posedge clk);
            @(negedge clk);
            if(data_out !== i) begin
                $display("Error! full read at: %h, expacting: %h, got: %h", addr_in, i, data_out);
                error ++;
            end
        end
        // random RW
        for(int i = 0; i < TESTS; i++) begin
            rand_addr = $random;
            addr_in = {{(32-BIT_ADDR-2){1'b0}}, rand_addr, 2'b0};
            data_in = $random;
            we = $random;
            if(we) begin
                data_store[rand_addr] = data_in;
            end
            @(posedge clk);
            @(negedge clk);
            if (!we) begin
                if(data_out !== data_store[rand_addr]) begin
                    $display("Error! read: %d, addr: %h, expacting: %h, got: %h", i, addr_in, data_store[rand_addr], data_out);
                    error ++;
                end
            end
        end
        if(error == 0) begin
            $display("All <%d> tests passed!!!", TESTS); 
        end
        else begin
            $display("In all <%d> tests, there are <%d> errors", TESTS, error);
        end
        $stop();
    end


endmodule