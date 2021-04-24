module mem_inst_const_tb();

    parameter DEPTH = 512;
    localparam BIT_ADDR = $clog2(DEPTH);
    /*
        Input
    */
    logic clk, rst_n;

    always #1 clk = ~clk;
    
    // DUT
    logic unsigned [31:0] addr;
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

    mem_inst_const mem(clk, rst_n, addr, data_MC, ctrl_MC, busy, data_out);
    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        addr = 0;
        data_MC = 0;
        we_MC = 0;
        wdone_MC = 0;
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
            addr = {{(32-BIT_ADDR-2){1'b0}}, i, 2'b0};
            if(busy) begin
                $display("Error! busy is high after MC write at: %h", i);
                error ++;
            end
            @(posedge clk);
            @(negedge clk);
            if(data_out !== i) begin
                $display("Error! full read at: %h, expacting: %h, got: %h", addr, i, data_out);
                error ++;
            end
        end
        if(error == 0) begin
            $display("All tests passed!!!"); 
        end
        else begin
            $display("In all tests, there are <%d> errors", error);
        end
        $stop();
    end


endmodule