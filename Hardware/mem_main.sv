module mem_main(clk, rst_n, we, re, addr, data_in,
                data_out, rd_rdy);

    parameter NUM_RT = 4;
    parameter NUM_THREAD = 32;
    parameter NUM_BANK_PTHREAD = 4;
    localparam NUM_BANK = NUM_THREAD * NUM_BANK_PTHREAD;
    localparam BIT_THREAD = $clog2(NUM_THREAD);

    /*
        Input
    */
    input clk, rst_n;
    //RT
    input we[NUM_RT-1:0];
    input re[NUM_RT-1:0];
    input [31:0] addr[NUM_RT-1:0];
    input [127:0] data_in[NUM_RT-1:0];

    /*
        Output
    */
    //RT
    output reg rd_rdy[NUM_RT-1:0];
    output [127:0] data_out[NUM_RT-1:0];

    // Generate variable
    genvar i, j;

    //Read Ready per RT pipeline
    //Pipeline 0-3
    logic rd_rdy_0[NUM_RT-1:0], rd_rdy_1[NUM_RT-1:0], rd_rdy_2[NUM_RT-1:0], rd_rdy_3[NUM_RT-1:0];
    // logic rd_rdy_3[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) begin
                    rd_rdy_0[i] <= 1'b0;
                    rd_rdy_1[i] <= 1'b0;
                    rd_rdy_2[i] <= 1'b0;
                    rd_rdy_3[i] <= 1'b0;
                    rd_rdy[i] <= 1'b0;
                end
                else begin
                    rd_rdy_0[i] <= re[i];
                    rd_rdy_1[i] <= rd_rdy_0[i];
                    rd_rdy_2[i] <= rd_rdy_1[i];
                    rd_rdy_3[i] <= rd_rdy_2[i];
                    rd_rdy[i] <= rd_rdy_3[i];
                end
            end
        end
    endgenerate

    //Write Enable (we) per bank pipeline
    //Pipeline 0
    logic we_bank_0[NUM_THREAD-1:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n)
                    we_bank_0[i] <= 1'b0;
                else begin
                    we_bank_0[i] <= ((addr[0][BIT_THREAD+15:16] == i) && we[0])
                                 || ((addr[1][BIT_THREAD+15:16] == i) && we[1])
                                 || ((addr[2][BIT_THREAD+15:16] == i) && we[2])
                                 || ((addr[3][BIT_THREAD+15:16] == i) && we[3]);
                end
            end
        end
    endgenerate
    //Pipeline 1
    logic we_bank_1[NUM_THREAD-1:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n)
                    we_bank_1[i] <= 1'b0;
                else
                    we_bank_1[i] <= we_bank_0[i];
            end
        end
    endgenerate

    //RAM Addr Calculate for each bank
    //Pipeline 0
    logic [5:0] thread_id_pre[NUM_RT-1:0];
    logic [13:0] addr_RT_pre[NUM_RT-1:0][3:0];
    logic [1:0] bank_id_pre[NUM_RT-1:0][3:0];
    logic [11:0] addr_pre[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign thread_id_pre[i] = addr[i][BIT_THREAD+15:16];

            assign addr_RT_pre[i][0] = addr[i][15:2];
            assign addr_RT_pre[i][1] = addr[i][15:2] + 14'h1;
            assign addr_RT_pre[i][2] = addr[i][15:2] + 14'h2;
            assign addr_RT_pre[i][3] = addr[i][15:2] + 14'h3;
            for (j = 0; j < 4; j = j + 1) begin
                assign bank_id_pre[i][j] = addr_RT_pre[i][j][1:0];
                assign addr_pre[i][j] = addr_RT_pre[i][j][13:2];
            end
        end
    endgenerate

    //Thread ID
    //Pipeline 0-2
    logic [BIT_THREAD-1:0] thread_id_0[NUM_RT-1:0], thread_id_1[NUM_RT-1:0]
                        , thread_id_2[NUM_RT-1:0], thread_id_3[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) begin
                    thread_id_0[i] <= '0;
                    thread_id_1[i] <= '0;
                    thread_id_2[i] <= '0;
                    thread_id_3[i] <= '0;
                end
                else begin
                    thread_id_0[i] <= thread_id_pre[i];
                    thread_id_1[i] <= thread_id_0[i];
                    thread_id_2[i] <= thread_id_1[i];
                    thread_id_3[i] <= thread_id_2[i];
                end
            end
        end
    endgenerate

    //Bank ID
    //Pipeline 0-3
    logic [1:0] bank_id_0[NUM_RT-1:0][3:0], bank_id_1[NUM_RT-1:0][3:0], 
            bank_id_2[NUM_RT-1:0][3:0], bank_id_3[NUM_RT-1:0][3:0], bank_id_4[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n) begin
                        bank_id_0[i][j] <= 2'b0;
                        bank_id_1[i][j] <= 2'b0;
                        bank_id_2[i][j] <= 2'b0;
                        bank_id_3[i][j] <= 2'b0;
                        bank_id_4[i][j] <= 2'b0;
                    end
                    else begin
                        bank_id_0[i][j] <= bank_id_pre[i][j];
                        bank_id_1[i][j] <= bank_id_0[i][j];
                        bank_id_2[i][j] <= bank_id_1[i][j];
                        bank_id_3[i][j] <= bank_id_2[i][j];
                        bank_id_4[i][j] <= bank_id_3[i][j];
                    end
                end
            end
        end
    endgenerate

    //RAM Address Pipeline
    //Pipeline 0
    logic [11:0] addr_bank_0[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) begin
                    addr_bank_0[i][0] <= 12'b0;
                    addr_bank_0[i][1] <= 12'b0;
                    addr_bank_0[i][2] <= 12'b0;
                    addr_bank_0[i][3] <= 12'b0;
				end
                else begin
                    addr_bank_0[i][0] <= bank_id_pre[i][0] == 2'h0 ? addr_pre[i][0]
                                        : bank_id_pre[i][1]  == 2'h0 ? addr_pre[i][1]
                                        : bank_id_pre[i][2]  == 2'h0 ? addr_pre[i][2]
                                        : addr_pre[i][3];
                    addr_bank_0[i][1] <= bank_id_pre[i][0] == 2'h1 ? addr_pre[i][0]
                                        : bank_id_pre[i][1]  == 2'h1 ? addr_pre[i][1]
                                        : bank_id_pre[i][2]  == 2'h1 ? addr_pre[i][2]
                                        : addr_pre[i][3];
                    addr_bank_0[i][2] <= bank_id_pre[i][0] == 2'h2 ? addr_pre[i][0]
                                        : bank_id_pre[i][1]  == 2'h2 ? addr_pre[i][1]
                                        : bank_id_pre[i][2]  == 2'h2 ? addr_pre[i][2]
                                        : addr_pre[i][3];
                    addr_bank_0[i][3] <= bank_id_pre[i][0] == 2'h3 ? addr_pre[i][0]
                                        : bank_id_pre[i][1]  == 2'h3 ? addr_pre[i][1]
                                        : bank_id_pre[i][2]  == 2'h3 ? addr_pre[i][2]
                                        : addr_pre[i][3];
				end
            end
        end
    endgenerate
    //Pipeline 1
    logic [11:0] addr_bank_1[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n)
                        addr_bank_1[i][j] <= 12'b0;
                    else begin
                        addr_bank_1[i][j] <= (i == thread_id_0[0]) ? addr_bank_0[0][j]
                                            : (i == thread_id_0[1]) ? addr_bank_0[1][j]
                                            : (i == thread_id_0[2]) ? addr_bank_0[2][j]
                                            : addr_bank_0[3][j];
                    end
                end
            end
        end
    endgenerate

    //RAM Data Pipeline
    //Pipeline 0
    logic [32:0] data_bank_0[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) begin
                    data_bank_0[i][0] <= 32'b0;
                    data_bank_0[i][1] <= 32'b0;
                    data_bank_0[i][2] <= 32'b0;
                    data_bank_0[i][3] <= 32'b0;
				end
                else begin
                    data_bank_0[i][0] <= bank_id_pre[i][0] == 2'h0 ? data_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h0 ? data_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h0 ? data_in[i][95:64]
                                        : data_in[i][127:96];
                    data_bank_0[i][1] <= bank_id_pre[i][0] == 2'h1 ? data_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h1 ? data_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h1 ? data_in[i][95:64]
                                        : data_in[i][127:96];
                    data_bank_0[i][2] <= bank_id_pre[i][0] == 2'h2 ? data_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h2 ? data_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h2 ? data_in[i][95:64]
                                        : data_in[i][127:96];
                    data_bank_0[i][3] <= bank_id_pre[i][0] == 2'h3 ? data_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h3 ? data_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h3 ? data_in[i][95:64]
                                        : data_in[i][127:96];
                end
            end
        end
    endgenerate

    //Pipeline 1
    logic [31:0] data_bank_1[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n)
                        data_bank_1[i][j] <= 32'b0;
                    else begin
                        data_bank_1[i][j] <= (i == thread_id_0[0]) ? data_bank_0[0][j]
                                            : (i == thread_id_0[1]) ? data_bank_0[1][j]
                                            : (i == thread_id_0[2]) ? data_bank_0[2][j]
                                            : data_bank_0[3][j];
                    end
                end
            end
        end
    endgenerate

    //RAM
    //Pipeline 2
    logic [31:0] q_bank_2[NUM_THREAD-1:0][3:0];
    logic re_MC_reg;
    logic re_MC_clr;
    logic re_MC_en;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) 
            re_MC_reg <=1'b0;
        else if (re_MC_clr)
            re_MC_reg <= 1'b0;
        else if (re_MC_en)
            re_MC_reg <= 1'b1;
    end
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin: main_memory_thread
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin: main_memory_bank
                single_port_ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank_1[i]),
                .data(data_bank_1[i][j]),.addr(addr_bank_1[i][j]), .q(q_bank_2[i][j]));
            end
        end
    endgenerate

    logic [127:0] q_compact_2[NUM_THREAD-1:0];
    logic [127:0] q_mux_2[7:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            assign q_compact_2[i] = {q_bank_2[i][3],q_bank_2[i][2],q_bank_2[i][1],q_bank_2[i][0]};
        end
        for (j = 0; j < 8; j = j + 1) begin
            assign q_mux_2[j] = {q_compact_2[j*4+3], q_compact_2[j*4+2], q_compact_2[j*4+1], q_compact_2[j*4]};
        end
    endgenerate 

    //Read output pipeline
    //Pipeline 3
    logic [127:0] data_out_3[NUM_RT-1:0][7:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n ) begin 
                if (!rst_n) begin
                    data_out_3[i][0] <= 128'h0;    
                    data_out_3[i][1] <= 128'h0;
                    data_out_3[i][2] <= 128'h0;
                    data_out_3[i][3] <= 128'h0;
                    data_out_3[i][4] <= 128'h0;
                    data_out_3[i][5] <= 128'h0;
                    data_out_3[i][6] <= 128'h0;
                    data_out_3[i][7] <= 128'h0;
                end
                else begin
                    data_out_3[i][0] <= q_mux_2[0][thread_id_2[i][1:0]];
                    data_out_3[i][1] <= q_mux_2[1][thread_id_2[i][1:0]];
                    data_out_3[i][2] <= q_mux_2[2][thread_id_2[i][1:0]];
                    data_out_3[i][3] <= q_mux_2[3][thread_id_2[i][1:0]];
                    data_out_3[i][4] <= q_mux_2[4][thread_id_2[i][1:0]];
                    data_out_3[i][5] <= q_mux_2[5][thread_id_2[i][1:0]];
                    data_out_3[i][6] <= q_mux_2[6][thread_id_2[i][1:0]];
                    data_out_3[i][7] <= q_mux_2[7][thread_id_2[i][1:0]];
                end
            end
        end
    endgenerate

    //Pipeline 4
    logic [127:0] data_out_4[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n ) begin
                if (!rst_n)
                    data_out_4[i] <= 128'h0;
                else
                    data_out_4[i] <= data_out_3[i][thread_id_3[i][4:2]];
            end
        end
    endgenerate    

    //Pipeline 5
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign data_out[i][31:0] = bank_id_4[i][0] == 2'h0 ? data_out_4[i][31:0]
                                        : bank_id_4[i][0] == 2'h1 ? data_out_4[i][63:32]
                                        : bank_id_4[i][0] == 2'h2 ? data_out_4[i][95:64]
                                        : data_out_4[i][127:96];

            assign data_out[i][63:32] = bank_id_4[i][1] == 2'h0 ? data_out_4[i][31:0]
                                        : bank_id_4[i][1] == 2'h1 ? data_out_4[i][63:32]
                                        : bank_id_4[i][1] == 2'h2 ? data_out_4[i][95:64]
                                        : data_out_4[i][127:96];

            assign data_out[i][95:64] = bank_id_4[i][2] == 2'h0 ? data_out_4[i][31:0]
                                        : bank_id_4[i][2] == 2'h1 ? data_out_4[i][63:32]
                                        : bank_id_4[i][2] == 2'h2 ? data_out_4[i][95:64]
                                        : data_out_4[i][127:96];

            assign data_out[i][127:96] = bank_id_4[i][3] == 2'h0 ? data_out_4[i][31:0]
                                        : bank_id_4[i][3] == 2'h1 ? data_out_4[i][63:32]
                                        : bank_id_4[i][3] == 2'h2 ? data_out_4[i][95:64]
                                        : data_out_4[i][127:96];

        end
    endgenerate
endmodule
