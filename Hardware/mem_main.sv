module mem_main(clk, rst_n, we_RT, addr_RT, data_RT_in, addr_MC, re_MC,
                data_RT_out, rdy_RT, data_MC_out, rdy_MC);

  parameter NUM_RT = 4;
  parameter NUM_BANK = 256;
  parameter NUM_THREAD = 64;

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

  wire [3:0] thread_hit[NUM_THREAD-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: hit_thread
      for (j = 0; j < NUM_CORE; j = j + 1) begin: port
        assign thread_hit[i][j] = i == addr_RT[j][17:14];
      end
    end
  endgenerate

  wire we_bank[NUM_BANK-1:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: thread
      assign we_bank[i*4+3:i*4] = 4{|(thread_hit[i][3:0] & we_RT[3:0])};
    end
  endgenerate

  wire [11:0] thread_address[NUM_THREAD-1:0][3:0];
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: hit_port_thread
      assign port_hit[i] = addr_RT[3:2] == 2'b00 ? 4'b0000
                        : addr_RT[3:2] == 2'b01 ? ;
    end
  endgenerate

  wire [11:0] addr_bank[NUM_BANK-1:0];
  wire [31:0] din_bank[NUM_BANK-1:0], dout_bank[NUM_BANK-1:0];;
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: addr_thread
      for (j = 0; j < 4; j = j + 1) begin: addr_bank
        assign addr_bank[i*4] = thread_hit[i][0] ? (addr_RT[]);
      end
    end
  endgenerate




  genvar a;
  generate
    for (a = 0; a < NUM_BANK; a = a + 1) begin: main_memory
      ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank[a]),
            .din(din_bank[a]),.addr(addr_bank[a]), .dout(dout_bank[a]));
  endgenerate

endmodule
