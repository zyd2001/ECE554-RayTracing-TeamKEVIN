module mem_main(clk, rst_n, we_RT, addr_RT, data_RT_in, addr_MC, re_MC,
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

  // reg [11:0] addr_bank[255:0];
  genvar i, j, k;
  // indicate if a group is hit with an input port address
  wire [3:0] thread_hit[NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: hit_thread
      for (j = 0; j < NUM_RT; j = j + 1) begin: port
        assign thread_hit[i][j] = (i == addr_RT[j][21:16]);
      end
    end
  endgenerate
  // write enable signal
  wire we_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: thread
      assign we_bank[i*4+3:i*4] = '{4{|(thread_hit[i] & {we_RT[3],we_RT[2],we_RT[1],we_RT[0]})}};
    end
  endgenerate
  // address and data for each group
  wire [11:0] group_address[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  wire [31:0] group_data_in[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  wire [31:0] group_data_out[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: address_group
      assign group_address[0][i] = re_MC ? addr_MC :
                                   thread_hit[i][0] ? addr_RT[0][13:2] :
                                   thread_hit[i][1] ? addr_RT[1][13:2] :
                                   thread_hit[i][2] ? addr_RT[2][13:2] : addr_RT[3][13:2];
      assign group_address[1][i] = group_address[0][i] + 4;
      assign group_address[2][i] = group_address[1][i] + 4;
      assign group_address[3][i] = group_address[2][i] + 4;
      for(j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin: data_group 
        assign group_data_in[j][i] = thread_hit[i][0] ? data_RT_in[0][j*32+31:j*32] :
                                     thread_hit[i][1] ? data_RT_in[1][j*32+31:j*32] :
                                     thread_hit[i][2] ? data_RT_in[2][j*32+31:j*32] : data_RT_in[3][j*32+31:j*32];
      end
    end
  endgenerate
  // output map
  logic [31:0] din_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0], dout_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0];;
  logic [11:0] addr_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0];
  assign data_RT_out[0] = {dout_bank[4*addr_RT[0][21:16]],dout_bank[4*addr_RT[0][21:16]+1],
                           dout_bank[4*addr_RT[0][21:16]+2],dout_bank[4*addr_RT[0][21:16]+3]};
  assign data_RT_out[1] = {dout_bank[4*addr_RT[1][21:16]],dout_bank[4*addr_RT[1][21:16]+1],
                           dout_bank[4*addr_RT[1][21:16]+2],dout_bank[4*addr_RT[1][21:16]+3]};
  assign data_RT_out[2] = {dout_bank[4*addr_RT[2][21:16]],dout_bank[4*addr_RT[2][21:16]+1],
                           dout_bank[4*addr_RT[2][21:16]+2],dout_bank[4*addr_RT[2][21:16]+3]};
  assign data_RT_out[3] = {dout_bank[4*addr_RT[3][21:16]],dout_bank[4*addr_RT[3][21:16]+1],
                           dout_bank[4*addr_RT[3][21:16]+2],dout_bank[4*addr_RT[3][21:16]+3]};
  
  // 4 to 4 mapping logic from group_address and group_data_in to din_bank and addr_bank
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: hit_port_thread
      always_comb begin
        case(group_address[0][i][3:2])
          2'b00: begin
            din_bank[i*NUM_BANK_PTHREAD] = group_data_in[0][i];
            din_bank[i*NUM_BANK_PTHREAD+1] = group_data_in[1][i];
            din_bank[i*NUM_BANK_PTHREAD+2] = group_data_in[2][i];
            din_bank[i*NUM_BANK_PTHREAD+3] = group_data_in[3][i];
            addr_bank[i*NUM_BANK_PTHREAD] = group_address[0][i];
            addr_bank[i*NUM_BANK_PTHREAD+1] = group_address[1][i];
            addr_bank[i*NUM_BANK_PTHREAD+2] = group_address[2][i];
            addr_bank[i*NUM_BANK_PTHREAD+3] = group_address[3][i];
          end
          2'b01: begin
            din_bank[i*NUM_BANK_PTHREAD+1] = group_data_in[0][i];
            din_bank[i*NUM_BANK_PTHREAD+2] = group_data_in[1][i];
            din_bank[i*NUM_BANK_PTHREAD+3] = group_data_in[2][i];
            din_bank[i*NUM_BANK_PTHREAD] = group_data_in[3][i];
            addr_bank[i*NUM_BANK_PTHREAD+1] = group_address[0][i];
            addr_bank[i*NUM_BANK_PTHREAD+2] = group_address[1][i];
            addr_bank[i*NUM_BANK_PTHREAD+3] = group_address[2][i];
            addr_bank[i*NUM_BANK_PTHREAD] = group_address[3][i];
          end
          2'b10: begin
            din_bank[i*NUM_BANK_PTHREAD+2] = group_data_in[0][i];
            din_bank[i*NUM_BANK_PTHREAD+3] = group_data_in[1][i];
            din_bank[i*NUM_BANK_PTHREAD] = group_data_in[2][i];
            din_bank[i*NUM_BANK_PTHREAD+1] = group_data_in[3][i];
            addr_bank[i*NUM_BANK_PTHREAD+2] = group_address[0][i];
            addr_bank[i*NUM_BANK_PTHREAD+3] = group_address[1][i];
            addr_bank[i*NUM_BANK_PTHREAD] = group_address[2][i];
            addr_bank[i*NUM_BANK_PTHREAD+1] = group_address[3][i];
          end
          2'b11: begin
            din_bank[i*NUM_BANK_PTHREAD+3] = group_data_in[0][i];
            din_bank[i*NUM_BANK_PTHREAD] = group_data_in[1][i];
            din_bank[i*NUM_BANK_PTHREAD+1] = group_data_in[2][i];
            din_bank[i*NUM_BANK_PTHREAD+2] = group_data_in[3][i];
            addr_bank[i*NUM_BANK_PTHREAD+3] = group_address[0][i];
            addr_bank[i*NUM_BANK_PTHREAD] = group_address[1][i];
            addr_bank[i*NUM_BANK_PTHREAD+1] = group_address[2][i];
            addr_bank[i*NUM_BANK_PTHREAD+2] = group_address[3][i];
          end
        endcase
      end
    end
  endgenerate

  genvar a;
  generate
    for (a = 0; a < NUM_BANK; a = a + 1) begin: main_memory
      single_port_ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank[a]),
            .data(din_bank[a]),.addr(addr_bank[a]), .q(dout_bank[a]));
    end
  endgenerate
/*
  reg [31:0] din_0[3:0];
  reg [31:0] din_1;
  always_ff @( posedge clk, negedge rst_n ) begin 
    if (!rst_n) begin
      din_0[0] <= 32'b0;
      din_0[1] <= 32'b0;
      din_0[2] <= 32'b0;
      din_0[3] <= 32'b0;
    end
    else begin
      din_0[0] <= data_RT_in[0][31:0] & data_RT_in[0][63:32] & data_RT_in[0][95:64] & data_RT_in[0][127:96];
      din_0[1] <= data_RT_in[1][31:0] & data_RT_in[1][63:32] & data_RT_in[1][95:64] & data_RT_in[1][127:96];
      din_0[2] <= data_RT_in[2][31:0] & data_RT_in[2][63:32] & data_RT_in[2][95:64] & data_RT_in[2][127:96];
      din_0[3] <= data_RT_in[3][31:0] & data_RT_in[3][63:32] & data_RT_in[3][95:64] & data_RT_in[3][127:96];
    end
  end

  always_ff @( posedge clk, negedge rst_n ) begin 
    if (!rst_n)
      din_1 <= 32'b0;
    else 
      din_1 <= din_0[0] & din_0[1] & din_0[2] & din_0[3];
  end

  reg [11:0] addr_0;
  always_ff @( posedge clk, negedge rst_n ) begin 
    if (!rst_n)
      addr_0 <= 12'b0;
    else begin 
      addr_0 <= addr_RT[0][11:0] & addr_RT[1][11:0] & addr_RT[2][11:0] & addr_RT[3][11:0];
    end
  end

  wire [31:0] dout[255:0];
  reg [31:0] dout_0[255:0];
  reg [127:0] dout_1[63:0];
  reg [127:0] dout_2[3:0];

  genvar y;
  generate
    for (y = 0; y < 256; y = y + 1) begin: out_loop_0
      always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
          dout_0[y] <= 32'b0;
        else 
          dout_0[y] <= dout[y];
      end
    end
  endgenerate

  genvar x;
  generate
    for (x = 0; x < 64; x = x + 1 ) begin: out_loop_1
      always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
          dout_1[x] <= 128'b0;
        else 
          dout_1[x] <= {dout_0[x*4],dout_0[x*4+1],dout_0[x*4+2],dout_0[x*4+3]};
      end
    end
  endgenerate 

  generate
    for (x = 0; x < 4; x = x + 1) begin: out_loop_2
      always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) 
          dout_2[x] <= 128'b0;
        else begin
          dout_2[x] <= dout_1[x*16+0] & dout_1[x*16+1] & dout_1[x*16+2] + dout_1[x*16+3] & dout_1[x*16+4] & dout_1[x*16+5]
                    &  dout_1[x*16+6] & dout_1[x*16+7] & dout_1[x*16+8] + dout_1[x*16+9] & dout_1[x*16+10] & dout_1[x*16+11]
                    &  dout_1[x*16+12] & dout_1[x*16+13] & dout_1[x*16+14] & dout_1[x*16+15];
        end
      end
    end
  endgenerate

  assign data_RT_out[0] = dout_2[0];
  assign data_RT_out[1] = dout_2[1];
  assign data_RT_out[2] = dout_2[2];
  assign data_RT_out[3] = dout_2[3];

  genvar a;
  generate
    for (a = 0; a < 256; a = a + 1) begin: main_memory
      //ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_RT[0]| we_RT[1]| we_RT[2] | we_RT[3]),
      //      .din(din_1),.addr(addr_0), .dout(dout[a]));
		simple_dual_port_ram_single_clock #(.DATA_WIDTH(32),.ADDR_WIDTH(12)) bank(.clk(clk)
		,.we(we_RT[0]| we_RT[1]| we_RT[2] | we_RT[3]),.data(din_1),.read_addr(addr_0),.write_addr(~addr_0),
		.q(dout[a]));
    end
  endgenerate
*/
endmodule
