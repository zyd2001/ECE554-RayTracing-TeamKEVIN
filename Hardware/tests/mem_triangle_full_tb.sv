module mem_triangle_full_tb();

    parameter NUM_TRIANGLE = 512;
    localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
    localparam DATA_DEPTH = BIT_TRIANGLE + 2; // num*4 size
    localparam TESTS = 5;
    /*
        Input
    */
    logic clk, rst_n;
    // IC
    logic re_IC;
    logic [BIT_TRIANGLE-1:0] triangle_id, index_0, index_1, index_2;
    // MC
    logic [127:0] data_MC; // (vertex0, vertex1, vertex2, sid) or (x, y, z, flag)
    logic we_MC, done_MC;
    /*
        Output
    */
    // IC
    logic rdy_IC;
    logic [95:0] vertex1_IC, vertex2_IC, vertex0_IC;
    logic [31:0] sid_IC;
    logic not_valid_IC;
    // MC
    logic rdy_MC;

    mem_triangle #(NUM_TRIANGLE) mem(clk, rst_n, re_IC, triangle_id, data_MC, we_MC, done_MC, rdy_MC,
                rdy_IC, not_valid_IC, vertex0_IC, vertex1_IC, vertex2_IC, sid_IC);

    always #1 clk = ~clk;

    logic [127:0] indexstore [NUM_TRIANGLE-1:0];
    int busy;
    int error = 0;
    int test_count = 0;
    int vertex0 = 0;
    int vertex1 = 0;
    int vertex2 = 0;
    int sid = 0;
    initial begin
        clk = 1;
        rst_n = 1;
        re_IC = 0;
        triangle_id = 0;
        data_MC = 0;
        we_MC = 0;
        done_MC = 0;
        busy = 0;
        index_0 = 0;
        index_1 = 0;
        index_2 = 0;
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end
        
        for(int test = 0; test < TESTS; test++) begin
            $display("Test %d starting... ", test);
            re_IC = 0;
            triangle_id = 0;
            data_MC = 0;
            we_MC = 0;
            busy = 0;
            index_0 = 0;
            index_1 = 0;
            index_2 = 0;
            // write mc index
            $display("Writing index from MC...");
            for (triangle_id = 0; triangle_id < 512-test; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    index_0 = $urandom;
                    index_1 = $urandom;
                    index_2 = $urandom;
                    data_MC = {{{(32-DATA_DEPTH){1'b0}}, triangle_id, 2'h3}, {{(32-DATA_DEPTH){1'b0}}, index_2, 2'h2}, 
                                {{(32-DATA_DEPTH){1'b0}}, index_1, 2'h1}, {{(32-DATA_DEPTH){1'b0}}, index_0, 2'h0}};
                    if(triangle_id % 64 == 0) begin
                        $display("Currently writing 0: %h, 1: %h, 2: %h, id: %h, data: %h", {index_0,2'b0}, {index_1,2'b0}, {index_2,2'b0}, {triangle_id,2'b0}, data_MC);
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
                // @(posedge clk);
                // @(posedge clk);
                // @(posedge clk);
                // @(posedge clk);
                // @(posedge clk);
                // @(posedge clk);
                if(&triangle_id || triangle_id+1 == 512-test) begin
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
                    // @(posedge clk);
                    // @(posedge clk);
                    // @(posedge clk);
                    // @(posedge clk);
                    // @(posedge clk);
                    // @(posedge clk);
                end
            end
            data_MC = 0;
            we_MC = 1;
            @(posedge clk);
            we_MC = 0;
            busy = 0;


            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            done_MC = 1;
            @(posedge clk);
            done_MC = 0;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            // ic speed read
            $display("Start IC speed read...");
            for(triangle_id = 0; triangle_id < 400; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(re_IC) begin
                    re_IC = 0;
                end
                @(posedge rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][31:0]<<4;
                    vertex1 = indexstore[triangle_id][63:32]<<4;
                    vertex2 = indexstore[triangle_id][95:64]<<4;
                    sid = indexstore[triangle_id][127:96];
                    if(vertex0_IC !== {(vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0)+2, (vertex0)+1, (vertex0)}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 1, {(vertex1)+2, (vertex1)+1, (vertex1)}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 2, {(vertex2)+2, (vertex2)+1, (vertex2)}, vertex2_IC); 
                        error ++;
                    end
                    if(sid_IC !== sid) begin
                        $display("Error! At triangle: %d, sid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, sid, sid_IC); 
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
            for(triangle_id = 150; triangle_id < 300; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(re_IC) begin
                    re_IC = 0;
                end
                @(posedge rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][31:0]<<4;
                    vertex1 = indexstore[triangle_id][63:32]<<4;
                    vertex2 = indexstore[triangle_id][95:64]<<4;
                    sid = indexstore[triangle_id][127:96];
                    if(vertex0_IC !== {(vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0)+2, (vertex0)+1, (vertex0)}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 1, {(vertex1)+2, (vertex1)+1, (vertex1)}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 2, {(vertex2)+2, (vertex2)+1, (vertex2)}, vertex2_IC); 
                        error ++;
                    end
                    if(sid_IC !== sid) begin
                        $display("Error! At triangle: %d, sid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, sid, sid_IC); 
                        error ++;
                    end
                    if(error != 0) begin
                        $stop();
                    end
                    busy = 0;
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                end
            end
            
            // ic slow read
            $display("Start IC slow read...");
            for(triangle_id = 350; triangle_id < 500-test; triangle_id++) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][31:0]<<4;
                    vertex1 = indexstore[triangle_id][63:32]<<4;
                    vertex2 = indexstore[triangle_id][95:64]<<4;
                    sid = indexstore[triangle_id][127:96];
                    if(vertex0_IC !== {(vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0)+2, (vertex0)+1, (vertex0)}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 1, {(vertex1)+2, (vertex1)+1, (vertex1)}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 2, {(vertex2)+2, (vertex2)+1, (vertex2)}, vertex2_IC); 
                        error ++;
                    end
                    if(sid_IC !== sid) begin
                        $display("Error! At triangle: %d, sid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, sid, sid_IC); 
                        error ++;
                    end
                    if(error != 0) begin
                        $stop();
                    end
                    busy = 0;
                    re_IC = 0;
                    if(&triangle_id) begin
                        break;
                    end
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                end
            end
            // test with valid stop
            $display("Start IC speed read with valid stop...");
            for(triangle_id = 490-test; triangle_id < 512; ) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(re_IC) begin
                    re_IC = 0;
                end
                if(not_valid_IC) begin
                    busy = 0;
                    $display("Stoped at triangle: %d", triangle_id);
                    break;
                end
                
                if(rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][31:0]<<4;
                    vertex1 = indexstore[triangle_id][63:32]<<4;
                    vertex2 = indexstore[triangle_id][95:64]<<4;
                    sid = indexstore[triangle_id][127:96];
                    if(vertex0_IC !== {(vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0)+2, (vertex0)+1, (vertex0)}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 1, {(vertex1)+2, (vertex1)+1, (vertex1)}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 2, {(vertex2)+2, (vertex2)+1, (vertex2)}, vertex2_IC); 
                        error ++;
                    end
                    if(sid_IC !== sid) begin
                        $display("Error! At triangle: %d, sid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, sid, sid_IC);
                        error ++;
                    end
                    if(error != 0) begin
                        $stop();
                    end
                    busy = 0;
                    if(&triangle_id) begin
                        break;
                    end
                    triangle_id++;
                end
            end
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            // restart and check prefetch after invalid
            $display("Start IC restart speed read...");
            for(triangle_id = 0; triangle_id < 512;) begin
                if(!busy) begin
                    busy = 1;
                    re_IC = 1;
                end
                @(posedge clk);
                if(re_IC) begin
                    re_IC = 0;
                end
                if(not_valid_IC) begin
                    busy = 0;
                    $display("Stoped at triangle: %d", triangle_id);
                    break;
                end
                
                if(rdy_IC) begin
                    test_count++;
                    vertex0 = indexstore[triangle_id][31:0]<<4;
                    vertex1 = indexstore[triangle_id][63:32]<<4;
                    vertex2 = indexstore[triangle_id][95:64]<<4;
                    sid = indexstore[triangle_id][127:96];
                    if(vertex0_IC !== {(vertex0)+2, (vertex0)+1, (vertex0)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 0, {(vertex0)+2, (vertex0)+1, (vertex0)}, vertex0_IC); 
                        error ++;
                    end
                    if(vertex1_IC !== {(vertex1)+2, (vertex1)+1, (vertex1)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 1, {(vertex1)+2, (vertex1)+1, (vertex1)}, vertex1_IC); 
                        error ++;
                    end
                    if(vertex2_IC !== {(vertex2)+2, (vertex2)+1, (vertex2)}) begin
                        $display("Error! At triangle: %d, vertex: %d, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, 2, {(vertex2)+2, (vertex2)+1, (vertex2)}, vertex2_IC); 
                        error ++;
                    end
                    if(sid_IC !== sid) begin
                        $display("Error! At triangle: %d, sid error, data expecting: 0x%h, data got: 0x%h", 
                                triangle_id, sid, sid_IC);
                        error ++;
                    end
                    if(error != 0) begin
                        $stop();
                    end
                    busy = 0;
                    if(&triangle_id) begin
                        break;
                    end
                    triangle_id++;
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