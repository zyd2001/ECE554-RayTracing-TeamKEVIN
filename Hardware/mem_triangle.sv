module mem_triangle(clk, rst_n, re_IC, triangle_id, data_MC, we_MC, rdy_MC,
                rdy_IC, vertex0_IC, vertex1_IC, vertex2_IC, tid_IC);

    parameter NUM_TRIANGLE = 512;
    localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
    localparam DATA_DEPTH = BIT_TRIANGLE + 2; // num*4 size

    /*
        Input
    */
    input clk, rst_n;
    // IC
    input re_IC;
    input [BIT_TRIANGLE-1:0] triangle_id;
    // MC
    input [127:0] data_MC; // (vertex0, vertex1, vertex2, tid) or (x, y, z, flag)
    input we_MC;
    /*
        Output
    */
    // IC
    output logic rdy_IC;
    output [127:0] vertex1_IC, vertex2_IC, vertex0_IC;
    output [31:0] tid_IC;
    // MC
    output logic rdy_MC;

    // Generate variable
    genvar i, j;

    enum {idle, mc_wr_index, mc_wr_vertex, rd_0, rd_1, rd_2, rd_tid, rd_done} state, next;

    // input buffer signal for index wr
    logic [127:0] mc_data;
    logic [2:0] index_cnt_reg, index_cnt;
    logic [DATA_DEPTH-1:0] mc_addr_cnt_reg, mc_addr_cnt;
    // memory signal
    logic we_vertex, we_index;
    logic [31:0] index_data_in;
    logic [DATA_DEPTH-1:0] index_addr_in;
    logic [31:0] index_data_out;
    logic [DATA_DEPTH-1:0] vertex_addr_in;
    logic [31:0] vertex_data_out[2:0];
    // output buffer signal
    logic [127:0] vertices [2:0];
    logic [31:0] tid;
    logic vertices_buff_en[2:0];
    logic tid_buff_en;
    // prefetch logic
    logic can_prefetch_reg, can_prefetch;
    logic is_prefetching_reg, is_prefetching;
    logic prefetch_match, out_prefetched_data;
    logic [BIT_TRIANGLE-1:0]prefetch_triangle_id_reg, prefetch_triangle_id;
    // state machine
    logic start_mc_write;
    assign start_mc_write = (we_MC && (state != mc_wr_vertex) && (state != mc_wr_index));
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            state <= idle;
            mc_addr_cnt_reg <= '0;
        end
        else begin
            state <= start_mc_write ? mc_wr_index : next;
            mc_addr_cnt_reg <= start_mc_write ? '0 : mc_addr_cnt;
        end
    end
    always_comb begin
        next = state;
        we_index = 1'b0;
        we_vertex = 1'b0;
        rdy_MC = 1'b0;
        rdy_IC = 1'b0;
        index_cnt = index_cnt_reg;
        mc_addr_cnt = mc_addr_cnt_reg;
        index_data_in = mc_data[31:0];
        index_addr_in = {triangle_id, 2'b0};
        vertex_addr_in = index_data_out[DATA_DEPTH-1:0];
        is_prefetching = is_prefetching_reg;
        can_prefetch = can_prefetch_reg;
        prefetch_triangle_id = prefetch_triangle_id_reg;
        vertices_buff_en[0] = 1'b0;
        vertices_buff_en[1] = 1'b0;
        vertices_buff_en[2] = 1'b0;
        tid_buff_en = 1'b0;
        out_prefetched_data = 1'b0;
        case (state)
            mc_wr_index: begin
                // zero id: switch
                if(~(|data_MC[127:96])) begin
                    mc_addr_cnt = '0;
                    next = mc_wr_vertex;
                    rdy_MC = 1'b1;
                end
                else begin
                    index_cnt = index_cnt_reg + 1;
                    index_addr_in = mc_addr_cnt_reg;
                    if(index_cnt_reg == 0) begin
                        we_index = 1'b1;
                        mc_addr_cnt = mc_addr_cnt_reg + 1;
                        index_data_in = mc_data[31:0];
                    end 
                    else if (index_cnt_reg == 1) begin
                        we_index = 1'b1;
                        mc_addr_cnt = mc_addr_cnt_reg + 1;
                        index_data_in = mc_data[63:32];
                    end 
                    else if (index_cnt_reg == 2) begin
                        we_index = 1'b1;
                        mc_addr_cnt = mc_addr_cnt_reg + 1;
                        index_data_in = mc_data[95:64];
                    end 
                    else if (index_cnt_reg == 3) begin
                        mc_addr_cnt = mc_addr_cnt_reg + 1;
                        // en_MC should arrive this cycle and clear counter
                        rdy_MC = 1'b1;
                        we_index = 1'b1;
                        index_data_in = mc_data[127:96];
                    end
                end
            end
            mc_wr_vertex: begin 
                if(we_MC) begin
                    // zero id: end
                    if(~(|data_MC[127:96])) begin
                        next = idle;
                    end
                    else begin
                        vertex_addr_in = mc_addr_cnt_reg;
                        mc_addr_cnt = mc_addr_cnt_reg + 1;  
                        we_vertex = 1'b1;
                        rdy_MC = 1'b1;
                    end                    
                end
            end
            rd_0: begin
                // re_ic interrupt prefetching
                if(re_IC && is_prefetching_reg) begin
                    prefetch_triangle_id = triangle_id;
                end
                // prefetching only
                else if(is_prefetching_reg) begin
                    index_addr_in = {prefetch_triangle_id_reg, 2'b0};
                end
                // re_ic only is default
                next = rd_1;
            end
            rd_1: begin
                // if prefetching a wrong triangle, restart
                if(re_IC && is_prefetching_reg && !prefetch_match) begin
                    next = rd_0;
                    prefetch_triangle_id = triangle_id;
                end
                // else read 1
                else begin
                    next = rd_2;
                    index_addr_in = {prefetch_triangle_id_reg, 2'b1};
                end
            end
            rd_2: begin
                // if prefetching a wrong triangle, restart
                if(re_IC && is_prefetching_reg && !prefetch_match) begin
                    next = rd_0;
                    prefetch_triangle_id = triangle_id;
                end
                // else read 2
                else begin
                    next = rd_tid;
                    index_addr_in = {prefetch_triangle_id_reg, 2'b10};
                    // write 0 to buffer
                    vertices_buff_en[0] = 1'b1;
                end
            end
            rd_tid: begin
                // if prefetching a wrong triangle, restart
                if(re_IC && is_prefetching_reg && !prefetch_match) begin
                    next = rd_0;
                    prefetch_triangle_id = triangle_id;
                end
                // else read tid
                else begin
                    next = rd_done;
                    index_addr_in = {prefetch_triangle_id_reg, 2'b11};
                    // write 1 to buffer
                    vertices_buff_en[1] = 1'b1;
                end
            end
            rd_done: begin
                // if prefetching a wrong triangle, restart
                if(re_IC && is_prefetching_reg && !prefetch_match) begin
                    next = rd_0;
                    prefetch_triangle_id = triangle_id;
                end
                else begin
                    next = idle;
                    // write tid to buffer
                    tid_buff_en = 1'b1;
                    // write 2 to buffer
                    vertices_buff_en[2] = 1'b1;
                    if(is_prefetching_reg) begin
                        can_prefetch = 1'b0;
                        is_prefetching = 1'b0;
                    end
                    else begin
                        rdy_IC = 1'b1;
                    end
                end
            end
            default: begin
                // prefetched, output right away and start prefetching
                if(re_IC && prefetch_match && !can_prefetch_reg) begin
                    rdy_IC = 1'b1;
                    out_prefetched_data = 1'b1;
                    is_prefetching = 1'b1;
                    prefetch_triangle_id = prefetch_triangle_id_reg + 1;
                    next = rd_0;
                end
                // prefetch did not match, start fetching
                else if(re_IC  && !prefetch_match) begin
                    can_prefetch = 1'b1;
                    is_prefetching = 1'b0;
                    prefetch_triangle_id = triangle_id;
                    next = rd_0;
                end
                // not reading, start prefetching if able
                else if (!re_IC  && can_prefetch_reg) begin
                    is_prefetching = 1'b1;
                    prefetch_triangle_id = prefetch_triangle_id_reg + 1;
                    next = rd_0;
                end
                // else stay in idle by default
            end
        endcase
    end
    // input logic
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            mc_data <= '0;
            index_cnt_reg <= '0;
        end
        else begin
            mc_data <= we_MC ? data_MC : mc_data;
            index_cnt_reg <= we_MC ? '0 : index_cnt;
        end
    end
    // prefetch logic
    assign prefetch_match = prefetch_triangle_id_reg == triangle_id;
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            can_prefetch_reg <= '0;
            is_prefetching_reg <= '0;
            prefetch_triangle_id_reg <= '0;
        end
        else begin
            can_prefetch_reg <= can_prefetch;
            is_prefetching_reg <= (re_IC && is_prefetching_reg) ? 1'b0 : is_prefetching;
            prefetch_triangle_id_reg <= prefetch_triangle_id;
        end
    end
    // mem modules
    single_port_ram #(.ADDR_WIDTH(DATA_DEPTH), .DATA_WIDTH(32)) index (.clk(clk), .we(we_index),
                    .data(index_data_in), .addr(index_addr_in), .q(index_data_out));
    // i = 3: x, i = 2: y, i = 1: z
    generate
        for (i = 1; i < 4; i = i + 1) begin: triangle_memory_xyz
            single_port_ram #(.ADDR_WIDTH(DATA_DEPTH), .DATA_WIDTH(32)) data (.clk(clk), .we(we_vertex),
                            .data(data_MC[31+i*32:i*32]), .addr(vertex_addr_in), .q(vertex_data_out[i-1]));
        end
    endgenerate
    // output logic
    generate
        for(i = 0; i < 3; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if(!rst_n) begin
                    vertices[i] <= '0;
                end
                else if(vertices_buff_en[i])begin
                    vertices[i] <= {vertex_data_out[2], vertex_data_out[1], vertex_data_out[0]};
                end
                else begin
                    vertices[i] <= vertices[i];
                end
            end
        end
    endgenerate
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            tid <= '0;
        end
        else if(tid_buff_en)begin
            tid <= index_data_out;
        end
        else begin
            tid <= tid;
        end
    end
    assign vertex0_IC = vertices[0];
    assign vertex1_IC = vertices[1];
    assign vertex2_IC = out_prefetched_data ? vertices[2] : {vertex_data_out[2], vertex_data_out[1], vertex_data_out[0]};
    assign tid_IC = out_prefetched_data ? tid : index_data_out;
endmodule