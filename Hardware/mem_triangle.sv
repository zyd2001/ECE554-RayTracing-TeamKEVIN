module mem_triangle(clk, rst_n, re_IC, triangle_id, data_MC, we_MC,
                rdy_IC, vertex0_IC, vertex1_IC, vertex2_IC, tid_IC);

    parameter NUM_TRIANGLE = 512;
    localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
    localparam DATA_DEPTH = BIT_TRIANGLE + 4; // num*4 size, add 2 bits zero padding for 4 byte address

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
    output rdy_IC;
    output [127:0] vertex1_IC, vertex2_IC, vertex0_IC;
    output [31:0] tid_IC;

    // Generate variable
    genvar i, j;

    enum {idle, rd_0, rd_1, rd_2, rd_tid, pre_fetch_0, pre_fetch_1, pre_fetch_2, pre_fetch_tid} state, next;

    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            state <= idle;
        end 
        else begin
            state <= next;
        end
    end

    // memory signal
    logic we_vertex, we_index;
    logic [31:0] index_data_in;
    logic [DATA_DEPTH-1:0] index_addr_in;
    logic [DATA_DEPTH-1:0] vertex_addr_in;
    logic [31:0] vertex_data_out[2:0];
    // buffer signal
    logic [127:0] vertices [2:0];
    logic [31:0] tid;
    logic vertices_en[2:0]
    logic tid_en;
    // prefetch logic
    logic prefetch, prefetch_match;
    logic [BIT_TRIANGLE-1:0]last_triangle_id;
    always_comb begin
        next = idle;
        we_vertex = 1'b0;
        we_index = 1'b0;
        case (state)
            rd_0: begin
                
            end
            rd_1: begin
                assign index_addr_in = prefetch ? (last_triangle_id + 1) : triangle_id;
            end
            rd_2: begin
                
            end
            rd_tid: begin
                
            end
            pre_fetch_0: begin
                
            end
            pre_fetch_1: begin
                
            end
            pre_fetch_2: begin
                
            end
            pre_fetch_tid: begin
                
            end
            default: begin
                
            end
        endcase
    end
    // prefetch logic
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            last_triangle_id <= '0;
        end
        else if(re_IC)begin
            last_triangle_id <= triangle_id;
        end
        else begin
            last_triangle_id <= last_triangle_id;
        end
    end
    // mem modules
    single_port_ram #(.ADDR_WIDTH(DATA_DEPTH), .DATA_WIDTH(32)) index (.clk(clk), .we(we_index),
                    .data(index_data_in), .addr(index_addr_in), .q(vertex_addr_in);
    // i = 3: x, i = 2: y, i = 1: z
    generate
        for (i = 1; i < 4; i = i + 1) begin: triangle_memory_xyz
            single_port_ram #(.ADDR_WIDTH(DATA_DEPTH), .DATA_WIDTH(32)) data (.clk(clk), .we(we_vertex),
                            .data(data_MC[31+i*32:i*32]), .addr(vertex_addr_in), .q(vertex_data_out[i]));
        end
    endgenerate
    // output logic
    generate
        for(i = 0; i < 3; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if(!rst_n) begin
                    vertices[i] <= '0;
                end
                else if(vertices_en[i])begin
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
        else if(tid_en)begin
            tid <= index_data_out;
        end
        else begin
            tid <= tid;
        end
    end
    assign vertex0_IC = vertices[0];
    assign vertex1_IC = vertices[1];
    assign vertex2_IC = prefetch_match ? vertices[2] : {vertex_data_out[2], vertex_data_out[1], vertex_data_out[0]};
    assign tid_IC = tid;
endmodule