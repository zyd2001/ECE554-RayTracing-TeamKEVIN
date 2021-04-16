module mem_main(clk, rst_n, we_RT, re_RT, addr_RT, data_RT_in, re_MC,
                data_RT_out, rd_rdy_RT, wr_rdy_RT, data_MC_out, rdy_MC);

    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    localparam NUM_BANK = NUM_THREAD * NUM_BANK_PTHREAD;

    /*
        Input
    */
    input clk, rst_n;
    //RT
    input we_RT[NUM_RT-1:0];
    input re_RT[NUM_RT-1:0];
    input [31:0] addr_RT[NUM_RT-1:0];
    input [127:0] data_RT_in[NUM_RT-1:0];
    //MC
    input re_MC;

    /*
        Output
    */
    //RT
    output reg rd_rdy_RT[NUM_RT-1:0];
    output reg wr_rdy_RT[NUM_RT-1:0];
    output [127:0] data_RT_out[NUM_RT-1:0];
    //MC
    output reg rdy_MC;
    output [127:0] data_MC_out;


    // Generate variable
    genvar i, j;


    //Read Ready per RT pipeline
    //Pipeline 0-3
    logic rd_rdy_0[NUM_RT-1:0], rd_rdy_1[NUM_RT-1:0], rd_rdy_2[NUM_RT-1:0];
    // logic rd_rdy_3[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) begin
                    rd_rdy_0[i] <= 1'b0;
                    rd_rdy_1[i] <= 1'b0;
                    rd_rdy_2[i] <= 1'b0;
                    rd_rdy_RT[i] <= 1'b0;
                end
                else begin
                    rd_rdy_0[i] <= re_RT[i];
                    rd_rdy_1[i] <= rd_rdy_0[i];
                    rd_rdy_2[i] <= rd_rdy_1[i];
                    rd_rdy_RT[i] <= rd_rdy_2[i];
                end
            end
        end
    endgenerate

    //Write Ready per RT pipeline
    //Pipeline 0
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n)
                    wr_rdy_RT[i] <= 1'b0;
                else 
                    wr_rdy_RT[i] <= we_RT[i];
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
                    we_bank_0[i] <= ((addr_RT[0][21:16] == i) && we_RT[0])
                                 || ((addr_RT[1][21:16] == i) && we_RT[1])
                                 || ((addr_RT[2][21:16] == i) && we_RT[2])
                                 || ((addr_RT[3][21:16] == i) && we_RT[3]);
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
            assign thread_id_pre[i] = addr_RT[i][21:16];

            assign addr_RT_pre[i][0] = addr_RT[i][15:2];
            assign addr_RT_pre[i][1] = addr_RT[i][15:2] + 14'h1;
            assign addr_RT_pre[i][2] = addr_RT[i][15:2] + 14'h2;
            assign addr_RT_pre[i][3] = addr_RT[i][15:2] + 14'h3;
            for (j = 0; j < 4; j = j + 1) begin
                assign bank_id_pre[i][j] = addr_RT_pre[i][j][1:0];
                assign addr_pre[i][j] = addr_RT_pre[i][j][13:2];
            end
        end
    endgenerate

    //Thread ID
    //Pipeline 0-2
    logic [5:0] thread_id_0[NUM_RT-1:0], thread_id_1[NUM_RT-1:0], thread_id_2[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) begin
                    thread_id_0[i] <= 6'h0;
                    thread_id_1[i] <= 6'h0;
                    thread_id_2[i] <= 6'h0;
                end
                else begin
                    thread_id_0[i] <= thread_id_pre[i];
                    thread_id_1[i] <= thread_id_0[i];
                    thread_id_2[i] <= thread_id_1[i];
                end
            end
        end
    endgenerate

    //Bank ID
    //Pipeline 0-3
    logic [1:0] bank_id_0[NUM_RT-1:0][3:0], bank_id_1[NUM_RT-1:0][3:0]
            , bank_id_2[NUM_RT-1:0][3:0], bank_id_3[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n) begin
                        bank_id_0[i][j] <= 2'b0;
                        bank_id_1[i][j] <= 2'b0;
                        bank_id_2[i][j] <= 2'b0;
                        bank_id_3[i][j] <= 2'b0;
                    end
                    else begin
                        bank_id_0[i][j] <= bank_id_pre[i][j];
                        bank_id_1[i][j] <= bank_id_0[i][j];
                        bank_id_2[i][j] <= bank_id_1[i][j];
                        bank_id_3[i][j] <= bank_id_2[i][j];
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
                    data_bank_0[i][0] <= bank_id_pre[i][0] == 2'h0 ? data_RT_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h0 ? data_RT_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h0 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
                    data_bank_0[i][1] <= bank_id_pre[i][0] == 2'h1 ? data_RT_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h1 ? data_RT_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h1 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
                    data_bank_0[i][2] <= bank_id_pre[i][0] == 2'h2 ? data_RT_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h2 ? data_RT_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h2 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
                    data_bank_0[i][3] <= bank_id_pre[i][0] == 2'h3 ? data_RT_in[i][31:0]
                                        : bank_id_pre[i][1] == 2'h3 ? data_RT_in[i][63:32]
                                        : bank_id_pre[i][2] == 2'h3 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
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
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin: main_memory_thread
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin: main_memory_bank
                single_port_ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank_1[i]),
                .data(data_bank_1[i][j]),.addr(addr_bank_1[i][j]), .q(q_bank_2[i][j]));
            end
        end
    endgenerate

    //Read output pipeline
    //Pipeline 3
    logic [31:0] data_RT_out_3[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n)
                        data_RT_out_3[i][j] <= 32'b0;
                    else
                        data_RT_out_3[i][j] <= q_bank_2[thread_id_2[i]][j];
                end
            end
        end
    endgenerate
    //Pipeline 4
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign data_RT_out[i][31:0] = bank_id_3[i][0] == 2'h0 ? data_RT_out_3[i][0]
                                        : bank_id_3[i][0] == 2'h1 ? data_RT_out_3[i][1]
                                        : bank_id_3[i][0] == 2'h2 ? data_RT_out_3[i][2]
                                        : data_RT_out_3[i][3];

            assign data_RT_out[i][63:32] = bank_id_3[i][1] == 2'h0 ? data_RT_out_3[i][0]
                                        : bank_id_3[i][1] == 2'h1 ? data_RT_out_3[i][1]
                                        : bank_id_3[i][1] == 2'h2 ? data_RT_out_3[i][2]
                                        : data_RT_out_3[i][3];

            assign data_RT_out[i][95:64] = bank_id_3[i][2] == 2'h0 ? data_RT_out_3[i][0]
                                        : bank_id_3[i][2] == 2'h1 ? data_RT_out_3[i][1]
                                        : bank_id_3[i][2] == 2'h2 ? data_RT_out_3[i][2]
                                        : data_RT_out_3[i][3];

            assign data_RT_out[i][127:96] = bank_id_3[i][3] == 2'h0 ? data_RT_out_3[i][0]
                                        : bank_id_3[i][3] == 2'h1 ? data_RT_out_3[i][1]
                                        : bank_id_3[i][3] == 2'h2 ? data_RT_out_3[i][2]
                                        : data_RT_out_3[i][3];

        end
    endgenerate

    /*
        Control Unit for MC Read
    */
    // MC Counter
    logic cnt_mc_inc;
    logic cnt_mc_clr;
    logic [6:0] cnt_mc;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
            cnt_mc <= 7'b0;
        else if (cnt_mc_clr)
            cnt_mc <= 7'b0;
        else if (cnt_mc_inc)
            cnt_mc <= cnt_mc + 7'h1;
    end

    // State Machine for MC read
    typedef enum reg {INI, RD} state_mc_t;
    state_mc_t state_mc, nxt_state_mc;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
            state_mc <= INI;
        else
            state_mc <= nxt_state_mc;
    end
    always_comb begin
        nxt_state_mc = INI;
        cnt_mc_inc = 1'b0;
        cnt_mc_clr = 1'b0;
        rdy_MC = 1'b0;
        case(state_mc)
            INI: begin
                if (re_MC) begin
                    nxt_state_mc = RD;
                    cnt_mc_inc = 1'b1;
                end
            end
            default: begin
                if (cnt_mc[6] == 1'b1) begin
                    cnt_mc_clr = 1'b1;
                    rdy_MC = 1'b1;
                end
                else begin
                    nxt_state_mc = RD;
                    cnt_mc_inc = 1'b1;
                end

            end
        endcase
    end

endmodule
