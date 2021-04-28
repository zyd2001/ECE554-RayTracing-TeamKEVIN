module CPv2_tb();

    localparam pixel_max_size = 481 * 600;
    parameter NUM_THREAD = 32;
    /*
        Input
    */
    logic clk, rst_n;

    always #1 clk = ~clk;
    
    /*
        input
    */
    // MC
    logic init_mem_fin_MC;
    logic patch_out_done_MC;
    logic [31:0] pixel_size_MC;
    /*
        output
    */
    // PD
    logic load_start_PD;
    logic load_done_PD;
    logic [31:0] pixel_id_PD;
    CP #(NUM_THREAD) cp(clk, rst_n, init_mem_fin_MC, patch_out_done_MC, pixel_size_MC,
        load_start_PD, load_done_PD, pixel_id_PD);
    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        init_mem_fin_MC = 0;
        patch_out_done_MC = 0;
        pixel_size_MC = 0;
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end
        for(int i = 1; i < 11; i++) begin
            init_mem_fin_MC = 1;
            pixel_size_MC = (pixel_max_size/10) * i;
            $display("Test %d starting ... with %d pixels", i, pixel_size_MC);
            for(int j = 0; j < pixel_size_MC; j++) begin
                @(negedge clk);
                if(j%NUM_THREAD == 0) begin
                    if(!load_start_PD) begin
                        $display("Error! load_start_PD is not high... when initing at pixel: %d", j);
                        error ++;
                    end
                end
                if(pixel_id_PD !== j) begin
                    $display("Error! read at: %h, expacting: %h, got: %h", j, j, pixel_id_PD);
                        $stop;
                    error ++;
                end
                if(j%NUM_THREAD==NUM_THREAD-1) begin
                    @(posedge clk);
                    @(negedge clk);
                    if(!load_done_PD) begin
                        $display("Error! load_done_PD is low after finished patch at: %d", j);
                        error ++;
                    end
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(negedge clk);
                end
                @(posedge clk);
                patch_out_done_MC = 0;
                init_mem_fin_MC = 0;
                if(j%NUM_THREAD==NUM_THREAD-1) begin
                    patch_out_done_MC = 1;
                end
                else if(j == pixel_size_MC-1) begin
                    @(negedge clk);
                    if(!load_done_PD) begin
                        $display("Error! load_done_PD is low after finished final patch at: %d", j);
                        error ++;
                    end
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    patch_out_done_MC = 1;
                end
            end
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
        end
        if(error == 0) begin
            $display("All <%d> tests passed!!!", 10); 
        end
        else begin
            $display("In all <%d> tests, there are <%d> errors", 10, error);
        end
        $stop();
    end


endmodule