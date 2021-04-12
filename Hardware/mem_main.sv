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
  wire [11:0] address[NUM_THREAD-1:0];
  reg [11:0] group_address[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  reg [31:0] group_data_in[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  wire [31:0] group_data_out[NUM_BANK_PTHREAD][NUM_THREAD-1:0];
  generate
	for (i = 0; i < NUM_THREAD; i = i + 1) begin
		assign address[i] = re_MC ? addr_MC :
									  thread_hit[i][0] ? addr_RT[0][13:2] :
                                   thread_hit[i][1] ? addr_RT[1][13:2] :
                                   thread_hit[i][2] ? addr_RT[2][13:2] : addr_RT[3][13:2];
	end
  endgenerate
  
  generate
    for (i = 0; i < NUM_THREAD; i = i + 1) begin: address_group
		always_ff @(posedge clk, negedge rst_n) begin
			if (!rst_n) begin
				group_address[0][i] <= 12'b0;
				group_address[1][i] <= 12'b0;
				group_address[2][i] <= 12'b0;
				group_address[3][i] <= 12'b0;
			end
			else begin
				group_address[0][i] <= address[i];
				group_address[1][i] <= address[i] + 12'h4;
				group_address[2][i] <= address[i] + 12'h8;
				group_address[3][i] <= address[i] + 12'hC;
			end
		end
    end
  endgenerate
  generate
	for (i = 0; i < NUM_THREAD; i = i + 1) begin
		for (j = 0; j < NUM_BANK_PTHREAD; j = j + 1) begin
			always_ff @(posedge clk, negedge rst_n) begin
				if(!rst_n) 
					group_data_in[j][i] <= 32'b0;
				else begin
					group_data_in[j][i] <= thread_hit[i][0] ? data_RT_in[0][j*32+31:j*32] :
                                     thread_hit[i][1] ? data_RT_in[1][j*32+31:j*32] :
                                     thread_hit[i][2] ? data_RT_in[2][j*32+31:j*32] : data_RT_in[3][j*32+31:j*32];
				end
			end
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

  logic [31:0] din_bank_real[NUM_BANK-1:0];
  logic [11:0] addr_bank_real[NUM_BANK-1:0];
  generate
    for (i = 0; i < NUM_BANK; i = i + 1) begin: memory_input
      always_ff @(posedge clk, negedge rst_n ) begin 
        if (!rst_n)
          din_bank_real[i] <= 32'b0;
        else 
          din_bank_real[i] <= din_bank[i];
      end

      always_ff @(posedge clk, negedge rst_n ) begin 
        if (!rst_n)
          addr_bank_real[i] <= 12'b0;
        else 
          addr_bank_real[i] <= addr_bank[i];
      end
    end 
  endgenerate
  

  genvar a;
  generate
    for (a = 0; a < NUM_BANK; a = a + 1) begin: main_memory
      single_port_ram #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) bank(.clk(clk), .we(we_bank[a]),
            .data(din_bank_real[a]),.addr(addr_bank_real[a]), .q(dout_bank[a]));
    end
  endgenerate

endmodule
