module mem_triangle_full_tb();

    parameter NUM_TRIANGLE = 512;
    localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
    localparam DATA_DEPTH = BIT_TRIANGLE + 4; // num*4 size, add 2 bits zero padding for 4 byte address
    localparam BIT_ADDR = BIT_TRIANGLE + 2;
    localparam TESTS = 1;
    /*
        Input
    */
    logic clk, rst_n;
    // IC
    logic re_IC;
    logic [BIT_TRIANGLE-1:0] triangle_id, index_x, index_y, index_z;
    // MC
    logic [127:0] data_MC; // (vertex0, vertex1, vertex2, tid) or (x, y, z, flag)
    logic we_MC;
    /*
        Output
    */
    // IC
    logic rdy_IC;
    logic [127:0] vertex1_IC, vertex2_IC, vertex0_IC;
    logic [31:0] tid_IC;
    // MC
    logic rdy_MC;

    mem_triangle #(NUM_TRIANGLE) mem(clk, rst_n, re_IC, triangle_id, data_MC, we_MC, rdy_MC,
                rdy_IC, vertex0_IC, vertex1_IC, vertex2_IC, tid_IC);

    always #1 clk = ~clk;

    logic [127:0] indexstore [BIT_TRIANGLE-1:0];
    logic busy;
    int error = 0;
    int test_count = 0;
    int vertex0 = 0;
    int vertex1 = 0;
    int vertex2 = 0;
    int tid = 0;
    initial begin
        for(int test = 0; test < TESTS; test++) begin
            $display("Test %d starting... ", test);
            clk = 1;
            rst_n = 1;
            re_IC = 0;
            triangle_id = 0;
            data_MC = 0;
            we_MC = 0;
            busy = 0;
            index_x = 0;
            index_y = 0;
            index_z = 0;

            // reset
            @(posedge clk) begin end
            rst_n = 1'b0; // active low reset
            @(posedge clk) begin end
            rst_n = 1'b1; // reset finished
            @(posedge clk) begin end
            
            // write mc index
            for (triangle_id = 0, triangle_id < 512, triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    index_x = $urandom;
                    index_y = $urandom;
                    index_z = $urandom;
                    data_MC = {{index_x, 4'h0}, {index_y, 4'h1}, {index_z, 4'h2}, {triangle_id, 4'h3}};
                    indexstore[triangle_id] = data_MC;
                    we_MC = 1;
                end
                @(posedge clk);
                if(we_MC) begin
                    we_MC = 0;
                end
                if(rdy_MC) begin
                    busy = 0;
                end
            end
            data_MC = 0;
            we_MC = 1;
            @(posedge clk);
            we_MC = 0;
            // write mc vertex
            for (int i = 0; i < 2048; i++) begin
                if(!busy) begin
                    busy = 1;
                    data_MC = {(i << 4), (i << 4) + 1, (i << 4) + 2, (i << 4) + 3};
                    we_MC = 1;
                end
                @(posedge clk);
                if(we_MC) begin
                    we_MC = 0;
                end
                if(rdy_MC) begin
                    busy = 0;
                end
            end
            data_MC = 0;
            we_MC = 1;
            @(posedge clk);
            we_MC = 0;
            busy = 0;
            // ic speed read
            for(triangle_id = 0; triangle_id < 200; triangle_id++)
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(rdy_IC) begin
                    test_count++;
                    index0 = indexstore[triangle_id][127:96] >> 4;
                    index1 = indexstore[triangle_id][95:64] >> 4;
                    index2 = indexstore[triangle_id][63:32] >> 4;
                    tid = indexstore[triangle_id][31:0] >> 4;
                    if(vertex0_IC !== {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(index1 << 4), (index1 << 4) + 1, (index1 << 4) + 2, (index1 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index1 << 4), (index1 << 4) + 1, (index1 << 4) + 2, (index1 << 4) + 3}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(index2 << 4), (index2 << 4) + 1, (index2 << 4) + 2, (index2 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}, vertex2_IC); 
                        error ++;
                    end
                    if(tid_IC !== tid) begin
                        $display("Error! At triangle: %d, tid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, tid, tid_IC); 
                        error ++;
                    end
                    if(error != 0) begin
                        $stop();
                    end
                    busy = 0;
                end
            end
            // ic mid read
            for(triangle_id = 150; triangle_id < 350; triangle_id++)
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(rdy_IC) begin
                    test_count++;
                    index0 = indexstore[triangle_id][127:96] >> 4;
                    index1 = indexstore[triangle_id][95:64] >> 4;
                    index2 = indexstore[triangle_id][63:32] >> 4;
                    tid = indexstore[triangle_id][31:0] >> 4;
                    if(vertex0_IC !== {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(index1 << 4), (index1 << 4) + 1, (index1 << 4) + 2, (index1 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index1 << 4), (index1 << 4) + 1, (index1 << 4) + 2, (index1 << 4) + 3}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(index2 << 4), (index2 << 4) + 1, (index2 << 4) + 2, (index2 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}, vertex2_IC); 
                        error ++;
                    end
                    if(tid_IC !== tid) begin
                        $display("Error! At triangle: %d, tid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, tid, tid_IC); 
                        error ++;
                    end
                    if(error != 0) begin
                        $stop();
                    end
                    busy = 0;
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                end
            end
            // ic slow read
            for(triangle_id = 300; triangle_id < 512; triangle_id++)
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(rdy_IC) begin
                    test_count++;
                    index0 = indexstore[triangle_id][127:96] >> 4;
                    index1 = indexstore[triangle_id][95:64] >> 4;
                    index2 = indexstore[triangle_id][63:32] >> 4;
                    tid = indexstore[triangle_id][31:0] >> 4;
                    if(vertex0_IC !== {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(index1 << 4), (index1 << 4) + 1, (index1 << 4) + 2, (index1 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index1 << 4), (index1 << 4) + 1, (index1 << 4) + 2, (index1 << 4) + 3}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(index2 << 4), (index2 << 4) + 1, (index2 << 4) + 2, (index2 << 4) + 3}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(index0 << 4), (index0 << 4) + 1, (index0 << 4) + 2, (index0 << 4) + 3}, vertex2_IC); 
                        error ++;
                    end
                    if(tid_IC !== tid) begin
                        $display("Error! At triangle: %d, tid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, tid, tid_IC); 
                        error ++;
                    end
                    if(error != 0) begin
                        $stop();
                    end
                    busy = 0;
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
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