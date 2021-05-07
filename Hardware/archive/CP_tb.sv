module CP_tb();

    parameter DEPTH = 65536;
    localparam BIT_ADDR = $clog2(DEPTH);
    parameter NUM_THREAD = 32;
    // mem_CP
    /*
        Input
    */
    logic clk, rst_n;

    always #1 clk = ~clk;
    
    // DUT
    logic re_CP_mem;
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
    logic [31:0] data_out_PD;
    logic invalid_cp_mem;
    // CP
    /*
        input
    */
    // MC
    logic init_mem_fin;
    logic patch_out_done_MC;
    /*
        output
    */
    // PD
    logic load_start_PD;
    logic load_done_PD;

    CP #(NUM_THREAD) cp(clk, rst_n, invalid_cp_mem, init_mem_fin, patch_out_done_MC,
        load_start_PD, load_done_PD, re_CP_mem);
    mem_CP mem(clk, rst_n, re_CP_mem, data_MC, ctrl_MC, invalid_cp_mem, data_out_PD);
    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        data_MC = 0;
        we_MC = 0;
        wrdone_MC = 0;
        init_mem_fin = 0;
        patch_out_done_MC = 0;
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end

        // MC write
        for(int i = 0; i < NUM_THREAD+10; i++) begin
            data_MC = i;
            we_MC = 1;
            @(posedge clk);
            @(negedge clk);
            if(!invalid_cp_mem) begin
                $display("Error! invalid_cp_mem is not high during MC write at: %h", i);
                error ++;
            end
        end
        we_MC = 0;
        wrdone_MC = 1;
        init_mem_fin = 1;
        @(posedge clk);
        @(negedge clk);
        wrdone_MC = 0;
        init_mem_fin = 0;
        // first read test not full invalid stop
        for(int i = 0; i < NUM_THREAD+15; i++) begin
            if(i < NUM_THREAD+10) begin
                if(invalid_cp_mem) begin
                    $display("Error! invalid_cp_mem is high after MC write at: %h", i);
                    error ++;
                end
            end
            @(posedge clk);
            @(negedge clk);
            if(i%NUM_THREAD==0) begin
                if(!load_start_PD) begin
                    $display("Error! load_start_PD is not high... when initing at: %h", i);
                    error ++;
                end
            end
            if(i < NUM_THREAD+10) begin
                if(data_out_PD !== i) begin
                    $display("Error! first read at: %h, expacting: %h, got: %h", i, i, data_out_PD);
                    error ++;
                end
            end
            else begin
                if(!invalid_cp_mem) begin
                    $display("Error! invalid_cp_mem is low after finished all readings at: %h", i);
                    error ++;
                end
            end
            if(i == NUM_THREAD+10) begin
                if(!load_done_PD) begin
                    $display("Error! load_done_PD is low after finished final patch at: %h", i);
                    error ++;
                end
            end
            if(i == NUM_THREAD-1) begin
                @(posedge clk);
                @(negedge clk);
                if(!load_done_PD) begin
                    $display("Error! load_done_PD is low after finished first patch at: %h", i);
                    error ++;
                end
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                @(negedge clk);
                patch_out_done_MC = 1;
                @(posedge clk);
                @(negedge clk);
                patch_out_done_MC = 0;
            end
        end
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        patch_out_done_MC = 1;
        @(posedge clk);
        @(negedge clk);
        patch_out_done_MC = 0;
        
        // MC full write
        for(int i = 0; i < DEPTH; i++) begin
            data_MC = i << 2;
            we_MC = 1;
            @(posedge clk);
            @(negedge clk);
            if(!invalid_cp_mem) begin
                $display("Error! invalid_cp_mem is not high during MC write at: %h", i);
                error ++;
            end
        end
        we_MC = 0;
        wrdone_MC = 1;
        init_mem_fin = 1;
        @(posedge clk);
        @(negedge clk);
        wrdone_MC = 0;
        init_mem_fin = 0;

        // full read test invalid bit
        for(int i = 0; i < DEPTH; i++) begin
            if(invalid_cp_mem) begin
                $display("Error! invalid_cp_mem is high after MC write at: %h", i);
                error ++;
            end
            @(posedge clk);
            @(negedge clk);
            if(i%NUM_THREAD==0) begin
                if(!load_start_PD) begin
                    $display("Error! load_start_PD is not high... when initing at: %h", i);
                    error ++;
                end
            end
            if(data_out_PD !== i << 2) begin
                $display("Error! full read at: %h, expacting: %h, got: %h", i, i << 2, data_out_PD);
                error ++;
            end
            if(i == DEPTH-1) begin
                if(!load_done_PD) begin
                    $display("Error! load_done_PD is low after finished final patch at: %h", i);
                    error ++;
                end
            end
            if(i%NUM_THREAD==NUM_THREAD-1) begin
                $stop();
                @(posedge clk);
                @(negedge clk);
                if(!load_done_PD) begin
                    $display("Error! load_done_PD is low after finished patch at: %h", i);
                    error ++;
                end
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                @(negedge clk);
                patch_out_done_MC = 1;
                @(posedge clk);
                @(negedge clk);
                patch_out_done_MC = 0;
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