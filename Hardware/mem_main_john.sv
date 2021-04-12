module mem_main_john(clk, rst_n, we_RT, addr_RT, data_RT_in, addr_MC, re_MC,
                data_RT_out, rdy_RT, data_MC_out, rdy_MC);

    parameter NUM_RT = 4;
    parameter NUM_THREAD = 64;
    parameter NUM_BANK_PTHREAD = 4;
    parameter NUM_BANK = NUM_THREAD * NUM_BANK_PTHREAD;

    input clk, rst_n;

    input we_RT[NUM_RT-1:0];
    input [31:0] addr_RT[NUM_RT-1:0];
    input [127:0] data_RT_in[NUM_RT-1:0];

    input re_MC;
    input [31:0] addr_MC; //


    output rdy_RT[NUM_RT-1:0];//
    output [127:0] data_RT_out[NUM_RT-1:0];

    output rdy_MC;//
    output [127:0] data_MC_out;

    genvar i, j;

    logic we_bank[NUM_THREAD-1:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n)
                    we_bank[i] <= 1'b0;
                else begin
                    we_bank[i] <= (addr_RT[0][21:16] == i) 
                               || (addr_RT[1][21:16] == i) 
                               || (addr_RT[2][21:16] == i) 
                               || (addr_RT[3][21:16] == i); 
                end
            end
        end
    endgenerate

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
                    addr_bank_0[i][0] <= addr_RT[i][3:2] == 2'h0 ? addr_RT[i][13:2]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h0 ? (addr_RT[i][13:2] + 12'h1)
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h0 ? (addr_RT[i][13:2] + 12'h2)
                                        : (addr_RT[i][13:2] + 12'h3);
                    addr_bank_0[i][1] <= addr_RT[i][3:2] == 2'h1 ? addr_RT[i][13:2]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h1 ? (addr_RT[i][13:2] + 12'h1)
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h1 ? (addr_RT[i][13:2] + 12'h2)
                                        : (addr_RT[i][13:2] + 12'h3);      
                    addr_bank_0[i][2] <= addr_RT[i][3:2] == 2'h2 ? addr_RT[i][13:2]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h2 ? (addr_RT[i][13:2] + 12'h1)
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h2 ? (addr_RT[i][13:2] + 12'h2)
                                        : (addr_RT[i][13:2] + 12'h3);
                    addr_bank_0[i][3] <= addr_RT[i][3:2] == 2'h3 ? addr_RT[i][13:2]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h3 ? (addr_RT[i][13:2] + 12'h1)
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h3 ? (addr_RT[i][13:2] + 12'h2)
                                        : (addr_RT[i][13:2] + 12'h3);
					end
            end
        end
    endgenerate 

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
                    data_bank_0[i][0] <= addr_RT[i][3:2] == 2'h0 ? data_RT_in[i][31:0]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h0 ? data_RT_in[i][63:32]
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h0 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
                    data_bank_0[i][1] <= addr_RT[i][3:2] == 2'h1 ? data_RT_in[i][31:0]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h1 ? data_RT_in[i][63:32]
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h1 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];      
                    data_bank_0[i][2] <= addr_RT[i][3:2] == 2'h2 ? data_RT_in[i][31:0]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h2 ? data_RT_in[i][63:32]
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h2 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
                    data_bank_0[i][3] <= addr_RT[i][3:2] == 2'h3 ? data_RT_in[i][31:0]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h3 ? data_RT_in[i][63:32]
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h3 ? data_RT_in[i][95:64]
                                        : data_RT_in[i][127:96];
					end
				end
        end
    endgenerate 

    logic [11:0] addr_bank[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
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

    logic [31:0] data_bank[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
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

    logic [31:0] q_bank[NUM_THREAD-1:0][3:0];
    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign data_RT_out[i][31:0] = addr_RT[i][3:2] == 2'h0 ? q_bank[addr_RT[i][21:16]][0]
                                        : addr_RT[i][3:2] == 2'h1 ? q_bank[addr_RT[i][21:16]][1]
                                        : addr_RT[i][3:2] == 2'h2 ? q_bank[addr_RT[i][21:16]][2]
                                        : q_bank[addr_RT[i][21:16]][3];
            
            assign data_RT_out[i][63:32] = (addr_RT[i][3:2] + 2'h1) == 2'h0 ? q_bank[addr_RT[i][21:16]][0]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h1 ? q_bank[addr_RT[i][21:16]][1]
                                        : (addr_RT[i][3:2] + 2'h1) == 2'h2 ? q_bank[addr_RT[i][21:16]][2]
                                        : q_bank[addr_RT[i][21:16]][3];

            assign data_RT_out[i][95:64] = (addr_RT[i][3:2] + 2'h2) == 2'h0 ? q_bank[addr_RT[i][21:16]][0]
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h1 ? q_bank[addr_RT[i][21:16]][1]
                                        : (addr_RT[i][3:2] + 2'h2) == 2'h2 ? q_bank[addr_RT[i][21:16]][2]
                                        : q_bank[addr_RT[i][21:16]][3];
                                        
            assign data_RT_out[i][127:96] = (addr_RT[i][3:2] + 2'h3) == 2'h0 ? q_bank[addr_RT[i][21:16]][0]
                                        : (addr_RT[i][3:2] + 2'h3) == 2'h1 ? q_bank[addr_RT[i][21:16]][1]
                                        : (addr_RT[i][3:2] + 2'h3) == 2'h2 ? q_bank[addr_RT[i][21:16]][2]
                                        : q_bank[addr_RT[i][21:16]][3];
            
        end
    endgenerate

    generate
        for (i = 0; i < NUM_THREAD; i = i + 1) begin: main_memory_thread
            for (j = 0; j < 4; j = j + 1) begin: main_memory_bank
                single_port_ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank[i]),
                .data(data_bank[i][j]),.addr(addr_bank[i][j]), .q(q_bank[i][j]));
            end
        end
    endgenerate

endmodule 
