module mem_triangle_full_tb();

    parameter NUM_TRIANGLE = 512;
    localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
    localparam DATA_DEPTH = BIT_TRIANGLE + 2; // num*4 size
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
    int busy;
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
            $display("Writing index from MC...");
            for (triangle_id = 0; triangle_id < 512; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    index_x = $urandom;
                    index_y = $urandom;
                    index_z = $urandom;
                    data_MC = {{{(32-DATA_DEPTH){1'b0}}, index_x, 2'h3}, {{(32-DATA_DEPTH){1'b0}}, index_y, 2'h2}, 
                                {{(32-DATA_DEPTH){1'b0}}, index_z, 2'h1}, {{(32-DATA_DEPTH){1'b0}}, triangle_id, 2'h0}};
                    if(triangle_id % 64 == 0) begin
                        $display("Currently writing x: %h, y: %h, z: %h, id: %h, data: %h", index_x, index_y, index_z, triangle_id, data_MC);
                    end
                    indexstore[triangle_id] = data_MC;
                    we_MC = 1;
                end
                @(posedge clk);
                if(we_MC) begin
                    we_MC = 0;
                end
                @(posedge rdy_MC);
                busy = 0;
                if(&triangle_id) begin
                    data_MC = 0;
                    we_MC = 1;
                    busy = 1;
                    break;
                end
            end
            // write mc vertex
            $display("Writing vertex from MC...");
            for (int i = -1; i < 2048; i++) begin
                if(!busy) begin
                    busy = 1;
                    data_MC = {(i << 4)+3, (i << 4)+2, (i << 4)+1, (i << 4)};
                    if(i % 256 == 0) begin
                        $display("Currently writing vertex: %h, data: %h", i, data_MC);
                    end
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
            $display("Start IC speed read...");
            for(triangle_id = 0; triangle_id < 200; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(re_IC) begin
                    re_IC = 0;
                end
                if(rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][127:96];
                    vertex1 = indexstore[triangle_id][95:64];
                    vertex2 = indexstore[triangle_id][63:32];
                    tid = indexstore[triangle_id][31:0];
                    if(vertex0_IC !== {(vertex0)+3, (vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0), (vertex0) + 1, (vertex0) + 2, (vertex0) + 3}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+3, (vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex1), (vertex1) + 1, (vertex1) + 2, (vertex1) + 3}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+3, (vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0), (vertex0) + 1, (vertex0) + 2, (vertex0) + 3}, vertex2_IC); 
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
            $display("Start IC mid read...");
            for(triangle_id = 150; triangle_id < 350; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(re_IC) begin
                    re_IC = 0;
                end
                if(rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][127:96];
                    vertex1 = indexstore[triangle_id][95:64];
                    vertex2 = indexstore[triangle_id][63:32];
                    tid = indexstore[triangle_id][31:0];
                    if(vertex0_IC !== {(vertex0)+3, (vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0), (vertex0) + 1, (vertex0) + 2, (vertex0) + 3}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+3, (vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex1), (vertex1) + 1, (vertex1) + 2, (vertex1) + 3}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+3, (vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0), (vertex0) + 1, (vertex0) + 2, (vertex0) + 3}, vertex2_IC); 
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
            $display("Start IC slow read...");
            for(triangle_id = 300; triangle_id < 512; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(re_IC) begin
                    re_IC = 0;
                end
                if(rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][127:96];
                    vertex1 = indexstore[triangle_id][95:64];
                    vertex2 = indexstore[triangle_id][63:32];
                    tid = indexstore[triangle_id][31:0];
                    if(vertex0_IC !== {(vertex0)+3, (vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0), (vertex0) + 1, (vertex0) + 2, (vertex0) + 3}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+3, (vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex1), (vertex1) + 1, (vertex1) + 2, (vertex1) + 3}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+3, (vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0), (vertex0) + 1, (vertex0) + 2, (vertex0) + 3}, vertex2_IC); 
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
                    if(&triangle_id) begin
                        break;
                    end
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