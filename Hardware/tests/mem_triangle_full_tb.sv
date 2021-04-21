module mem_triangle_full_tb();

    parameter NUM_TRIANGLE = 512;
    localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
    localparam DATA_DEPTH = BIT_TRIANGLE + 4; // num*4 size, add 2 bits zero padding for 4 byte address
    localparam ADDR_BIT = BIT_TRIANGLE + 2;

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

    mem_triangle #(NUM_TRIANGLE) mem(clk, rst_n, re_IC, triangle_id, data_MC, we_MC, rdy_MC,
                rdy_IC, vertex0_IC, vertex1_IC, vertex2_IC, tid_IC);
endmodule