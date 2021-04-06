module mem_main(clk, rst_n, we_RT, addr_RT, data_RT_in, addr_MC, re_MC,
                data_RT_out, rdy_RT, data_MC_out, rdy_MC);

  parameter NUM_RT = 4;
  parameter NUM_THREAD = 64;
  parameter NUM_BANK_PTHREAD = 4;

  input clk, rst_n;

  input we_RT[NUM_RT-1:0];
  input [31:0] addr_RT[NUM_RT-1:0];
  input [127:0] data_RT_in[NUM_RT-1:0];

  input re_MC;
  input [31:0] addr_MC;


  output rdy_RT[NUM_RT-1:0];
  output [127:0] data_RT_out[NUM_RT-1:0];

  output rdy_MC;
  output [127:0] data_MC_out;

  // reg [11:0] addr_bank[255:0];
  genvar i, j, k;
  // indicate if a group is hit with an input port address
  wire [3:0] thread_hit[NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: hit_thread
      for (j = 0; j < NUM_CORE; j = j + 1) begin: port
        assign thread_hit[i][j] = (i == addr_RT[j][17:14]);
      end
    end
  endgenerate
  // write enable signal
  wire we_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: thread
      assign we_bank[i*4+3:i*4] = 4{|(thread_hit[i][3:0] & we_RT[3:0])};
    end
  endgenerate
  // address and data for each group
  wire [11:0] group_address[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  wire [31:0] group_data[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: address_group
      assign group_address[0][i] = thread_hit[0] ? addr_RT[0][13:2] :
                                   thread_hit[1] ? addr_RT[1][13:2] :
                                   thread_hit[2] ? addr_RT[2][13:2] : addr_RT[3][13:2];
      assign group_address[3:1][i] = group_address[2:0][i] + 4;
      for(j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin: data_group 
        assign group_data[j][i] = thread_hit[0] ? data_RT_in[0][j*32+31:j*32] :
                                  thread_hit[1] ? data_RT_in[1][j*32+31:j*32] :
                                  thread_hit[2] ? data_RT_in[2][j*32+31:j*32] : data_RT_in[3][j*32+31:j*32];
      end
    end
  endgenerate
  // 4 to 4 mapping logic from group_address and group_data to din_bank and addr_bank
  wire [31:0] din_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0], dout_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0];;
  wire [11:0] addr_bank[NUM_BANK_PTHREAD*NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: hit_port_thread
      //
    end
  endgenerate

  genvar a;
  generate
    for (a = 0; a < NUM_BANK_PTHREAD*NUM_THREAD; a = a + 1) begin: main_memory
      ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank[a]),
            .din(din_bank[a]),.addr(addr_bank[a]), .dout(dout_bank[a]));
  endgenerate

endmodule
