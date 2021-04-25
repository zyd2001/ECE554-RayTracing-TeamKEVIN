module mem_CP_tb();

    parameter DEPTH = 32 * 1024;
    localparam BIT_ADDR = $clog2(DEPTH);
    /*
        Input
    */
    logic clk, rst_n;

    always #1 clk = ~clk;
    
    // DUT
    logic re_CP;
    // MC
    logic [31:0] data_MC;
    logic [1:0]ctrl_MC;
    logic we_MC, wrdone_MC;
    assign ctrl_MC[0] = we_MC;
    assign ctrl_MC[1] = wrdone_MC;
    /*
        Output
    */
    // DUT
    logic [31:0] data_out_CP;
    logic invalid_CP;

    mem_CP mem(clk, rst_n, re_CP, data_MC, ctrl_MC, invalid_CP, data_out_CP);
    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        data_MC = 0;
        we_MC = 0;
        re_CP = 0;
        wrdone_MC = 0;
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end

        // MC write
        for(int i = 0; i < 50; i++) begin
            data_MC = i;
            we_MC = 1;
            @(posedge clk);
            @(negedge clk);
            if(!invalid_CP) begin
                $display("Error! invalid_CP is not high during MC write at: %h", i);
                error ++;
            end
        end
        we_MC = 0;
        wrdone_MC = 1;
        @(posedge clk);
        wrdone_MC = 0;
        @(negedge invalid_CP);

        // first read test invalid bit
        for(int i = 0; i < 55; i++) begin
            re_CP = 1;
            if(i < 50) begin
                if(invalid_CP) begin
                    $display("Error! invalid_CP is high after MC write at: %h", i);
                    error ++;
                end
            end
            @(posedge clk);
            @(negedge clk);
            if(i < 50) begin
                if(data_out_CP !== i) begin
                    $display("Error! first read at: %h, expacting: %h, got: %h", i, i, data_out_CP);
                    error ++;
                end
            end
            else begin
                if(!invalid_CP) begin
                    $display("Error! invalid_CP is low after finished all readings at: %h", i);
                error ++;
            end
            end
        end
        re_CP = 0;
        // MC full write
        for(int i = 0; i < DEPTH; i++) begin
            data_MC = i << 2;
            we_MC = 1;
            @(posedge clk);
            @(negedge clk);
            if(!invalid_CP) begin
                $display("Error! invalid_CP is not high during MC write at: %h", i);
                error ++;
            end
        end
        we_MC = 0;
        wrdone_MC = 1;
        @(posedge clk);
        wrdone_MC = 0;
        @(negedge clk);
        if(invalid_CP) begin
            $display("Error! invalid_CP is high after reset");
            error ++;
        end
        // full read test invalid bit
        for(int i = 0; i < DEPTH; i++) begin
            re_CP = 1;
            if(invalid_CP) begin
                $display("Error! invalid_CP is high after MC write at: %h", i);
                error ++;
            end
            @(posedge clk);
            @(negedge clk);
            if(data_out_CP !== i << 2) begin
                $display("Error! first read at: %h, expacting: %h, got: %h", i, i << 2, data_out_CP);
                error ++;
            end
        end
        @(posedge clk);
        @(negedge clk);
        if(!invalid_CP) begin
            $display("Error! invalid_CP is low after finished all readings");
            error ++;
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