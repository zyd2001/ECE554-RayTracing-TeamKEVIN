module mem_main(clk, rst_n, we_RT, re_RT, addr_RT, data_RT_in, addr_MC, re_MC,
                data_RT_out, rdy_RT, data_MC_out, rdy_MC);

    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    localparam NUM_BANK = NUM_THREAD * NUM_BANK_PTHREAD;
    localparam CYCLE_TO_FINISH_W = 1;
    localparam CYCLE_TO_FINISH_R = 4;
    localparam FIN_COUNTER_BIT_W = $clog2(CYCLE_TO_FINISH_W+1);
    localparam FIN_COUNTER_BIT_R = $clog2(CYCLE_TO_FINISH_R+1);

    input clk, rst_n;

    input we_RT[NUM_RT-1:0];
    input re_RT[NUM_RT-1:0];
    input [31:0] addr_RT[NUM_RT-1:0];
    input [127:0] data_RT_in[NUM_RT-1:0];

    input re_MC;
    input [31:0] addr_MC; //


    output reg rdy_RT[NUM_RT-1:0];
    output [127:0] data_RT_out[NUM_RT-1:0];

    output reg rdy_MC;
    output [127:0] data_MC_out;

    genvar i, j;
    //Memory IO logic

    //Write Enable (we) pipeline
    //Cycle 0
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
    //Cycle 1
    logic we_bank[NUM_THREAD-1:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) 
                    we_bank[i] <= 1'b0;
                else 
                    we_bank[i] <= we_bank_0[i];
            end
        end
    endgenerate

    //RAM Addr Calculate for each bank
    //Cycle 0
    logic [13:0] addr_pre[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign addr_pre[i][0] = addr_RT[i][15:2];
            assign addr_pre[i][1] = addr_RT[i][15:2] + 14'h1;
            assign addr_pre[i][2] = addr_RT[i][15:2] + 14'h2;
            assign addr_pre[i][3] = addr_RT[i][15:2] + 14'h3;
        end
    endgenerate

    //RAM Address Pipeline
    //Cycle 0
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
                    addr_bank_0[i][0] <= addr_pre[i][0][1:0] == 2'h0 ? addr_pre[i][0][13:2]
                                        : addr_pre[i][1][1:0]  == 2'h0 ? addr_pre[i][1][13:2]
                                        : addr_pre[i][2][1:0]  == 2'h0 ? addr_pre[i][2][13:2]
                                        : addr_pre[i][3][13:2];
                    addr_bank_0[i][1] <= addr_pre[i][0][1:0] == 2'h1 ? addr_pre[i][0][13:2]
                                        : addr_pre[i][1][1:0]  == 2'h1 ? addr_pre[i][1][13:2]
                                        : addr_pre[i][2][1:0]  == 2'h1 ? addr_pre[i][2][13:2]
                                        : addr_pre[i][3][13:2];      
                    addr_bank_0[i][2] <= addr_pre[i][0][1:0] == 2'h2 ? addr_pre[i][0][13:2]
                                        : addr_pre[i][1][1:0]  == 2'h2 ? addr_pre[i][1][13:2]
                                        : addr_pre[i][2][1:0]  == 2'h2 ? addr_pre[i][2][13:2]
                                        : addr_pre[i][3][13:2];
                    addr_bank_0[i][3] <= addr_pre[i][0][1:0] == 2'h3 ? addr_pre[i][0][13:2]
                                        : addr_pre[i][1][1:0]  == 2'h3 ? addr_pre[i][1][13:2]
                                        : addr_pre[i][2][1:0]  == 2'h3 ? addr_pre[i][2][13:2]
                                        : addr_pre[i][3][13:2];
				end
            end
        end
    endgenerate 
    //Cycle 1
    logic [11:0] addr_bank[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n) 
                        addr_bank[i][j] <= 12'b0;
                    else begin
                        addr_bank[i][j] <= (i == addr_RT[0][21:16]) ? addr_bank_0[0][j]
                                    : (i == addr_RT[1][21:16]) ? addr_bank_0[1][j]
                                    : (i == addr_RT[2][21:16]) ? addr_bank_0[2][j] 
                                    : addr_bank_0[3][j];
                    end
                end 
            end
        end
    endgenerate

    //RAM Data Pipeline
    //Cycle 0
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
                    data_bank_0[i][0] <= addr_pre[i][0][1:0] == 2'h0 ? data_RT_in[i][31:0]
                                        : addr_pre[i][1][1:0] == 2'h0 ? data_RT_in[i][63:32]
                                        : addr_pre[i][2][1:0] == 2'h0 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
                    data_bank_0[i][1] <= addr_pre[i][0][1:0] == 2'h1 ? data_RT_in[i][31:0]
                                        : addr_pre[i][1][1:0] == 2'h1 ? data_RT_in[i][63:32]
                                        : addr_pre[i][2][1:0] == 2'h1 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];      
                    data_bank_0[i][2] <= addr_pre[i][0][1:0] == 2'h2 ? data_RT_in[i][31:0]
                                        : addr_pre[i][1][1:0] == 2'h2 ? data_RT_in[i][63:32]
                                        : addr_pre[i][2][1:0] == 2'h2 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
                    data_bank_0[i][3] <= addr_pre[i][0][1:0] == 2'h3 ? data_RT_in[i][31:0]
                                        : addr_pre[i][1][1:0] == 2'h3 ? data_RT_in[i][63:32]
                                        : addr_pre[i][2][1:0] == 2'h3 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
				end
			end
        end
    endgenerate 
    //Cycle 1
    logic [31:0] data_bank[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n) 
                        data_bank[i][j] <= 32'b0;
                    else begin
                        data_bank[i][j] <= (i == addr_RT[0][21:16]) ? data_bank_0[0][j]
                                    : (i == addr_RT[1][21:16]) ? data_bank_0[1][j]
                                    : (i == addr_RT[2][21:16]) ? data_bank_0[2][j] 
                                    : data_bank_0[3][j];
                    end
                end
            end
        end
    endgenerate

    //RAM
    //Cycle 2
    logic [31:0] q_bank[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin: main_memory_thread
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin: main_memory_bank
                single_port_ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank[i]),
                .data(data_bank[i][j]),.addr(addr_bank[i][j]), .q(q_bank[i][j]));
            end
        end
    endgenerate

    //Read output pipeline
    //Cycle 3
    logic [31:0] data_RT_out_0[NUM_RT-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin
                always_ff @(posedge clk, negedge rst_n) begin
                    if (!rst_n) 
                        data_RT_out_0[i][j] <= 32'b0;
                    else  
                        data_RT_out_0[i][j] <= q_bank[addr_RT[i][21:16]][j];
                end
            end   
        end
    endgenerate 
    //Cycle 4
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign data_RT_out[i][31:0] = addr_pre[i][0][1:0] == 2'h0 ? data_RT_out_0[i][0]
                                        : addr_pre[i][0][1:0] == 2'h1 ? data_RT_out_0[i][1]
                                        : addr_pre[i][0][1:0] == 2'h2 ? data_RT_out_0[i][2]
                                        : data_RT_out_0[i][3];
            
            assign data_RT_out[i][63:32] = addr_pre[i][1][1:0] == 2'h0 ? data_RT_out_0[i][0]
                                        : addr_pre[i][1][1:0] == 2'h1 ? data_RT_out_0[i][1]
                                        : addr_pre[i][1][1:0] == 2'h2 ? data_RT_out_0[i][2]
                                        : data_RT_out_0[i][3];

            assign data_RT_out[i][95:64] = addr_pre[i][2][1:0] == 2'h0 ? data_RT_out_0[i][0]
                                        : addr_pre[i][2][1:0] == 2'h1 ? data_RT_out_0[i][1]
                                        : addr_pre[i][2][1:0] == 2'h2 ? data_RT_out_0[i][2]
                                        : data_RT_out_0[i][3];
                                        
            assign data_RT_out[i][127:96] = addr_pre[i][3][1:0] == 2'h0 ? data_RT_out_0[i][0]
                                        : addr_pre[i][3][1:0] == 2'h1 ? data_RT_out_0[i][1]
                                        : addr_pre[i][3][1:0] == 2'h2 ? data_RT_out_0[i][2]
                                        : data_RT_out_0[i][3];
            
        end
    endgenerate


    /*
        Control Unit for RT Read and Write
    */
    // Read Counter for each RT
    logic cnt_wr_clr[NUM_RT-1:0];
    logic cnt_wr_inc[NUM_RT-1:0];
    logic [FIN_COUNTER_BIT_W-1:0] cnt_wr[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n ) begin
                if (!rst_n)
                    cnt_wr[i] <= {(FIN_COUNTER_BIT_W){1'b0}};
                else if (cnt_wr_clr[i])
                    cnt_wr[i] <= {(FIN_COUNTER_BIT_W){1'b0}};
                else if (cnt_wr_inc[i])
                    cnt_wr[i] <= cnt_wr[i] + {{(FIN_COUNTER_BIT_W-1){1'b0}}, 1'b1};
            end
        end
    endgenerate
    // Write Counter for each RT
    logic cnt_rd_clr[NUM_RT-1:0];
    logic cnt_rd_inc[NUM_RT-1:0];
    logic [FIN_COUNTER_BIT_R-1:0] cnt_rd[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n ) begin
                if (!rst_n)
                    cnt_rd[i] <= {(FIN_COUNTER_BIT_R){1'b0}};
                else if (cnt_rd_clr[i])
                    cnt_rd[i] <= {(FIN_COUNTER_BIT_R){1'b0}};
                else if (cnt_rd_inc[i])
                    cnt_rd[i] <= cnt_rd[i] + {{(FIN_COUNTER_BIT_R-1){1'b0}}, 1'b1};
            end
        end
    endgenerate
    
    // State Machine for each RT
    typedef enum reg [1:0] {IDLE, READ, WRITE} state_t;
    state_t state[NUM_RT-1:0], nxt_state[NUM_RT-1:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n ) begin 
                if (!rst_n)
                    state[i] <= IDLE;
                else 
                    state[i] <= nxt_state[i];
            end
            always_comb begin 
                nxt_state[i] = IDLE;
                cnt_wr_clr[i] = 1'b0;
                cnt_wr_inc[i] = 1'b0;
                cnt_rd_clr[i] = 1'b0;
                cnt_rd_inc[i] = 1'b0;
                rdy_RT[i] = 1'b0;
                case(state[i])
                    IDLE: begin
                        if (re_RT[i]) begin
                            nxt_state[i] = READ;
                            cnt_rd_inc[i] = 1'b1;
                        end
                        else if (we_RT[i]) begin
                            nxt_state[i] = WRITE;
                            cnt_wr_inc[i] = 1'b1;
                        end
                    end
                    READ: begin
                        if (cnt_rd[i] == CYCLE_TO_FINISH_R) begin
                            cnt_rd_clr[i] = 1'b1;
                            rdy_RT[i] = 1'b1;
                        end
                        else begin
                            nxt_state[i] = READ;
                            cnt_rd_inc[i] = 1'b1;
                        end
                    end
                    default: begin
                        if (cnt_wr[i] == CYCLE_TO_FINISH_W) begin
                            cnt_wr_clr[i] = 1'b1;
                            rdy_RT[i] = 1'b1;
                        end
                        else begin
                           nxt_state[i] = WRITE;
                           cnt_wr_inc[i] = 1'b1; 
                        end
                    end
                endcase
            end
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
