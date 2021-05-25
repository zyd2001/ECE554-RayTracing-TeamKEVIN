module fti (in_in, out, clk, en, done, rst_n, rst);

  parameter LATENCY = 2;

  input clk, en, rst_n, rst;
  input [31:0] in_in;
  output logic signed [31:0] out; 
  output logic done;
  
  logic enable;
  logic [2:0] counter, counter_in;
  
  typedef enum reg {COUNT, IDLE} state_t;
  state_t state, nxt_state;
  
  always_ff@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      counter <= '0;
      state <= IDLE;
    end
    else begin
      counter <= counter_in;
      state <= nxt_state;
    end
  end
  
  always_comb begin
    counter_in = '0;
    done = 1'b0;
    enable = 1'b0;
    nxt_state = IDLE;
    case(state)
      COUNT: 
        begin
          if (counter == LATENCY)
            done = 1'b1;
          else begin
            counter_in = counter + 1'b1;
            nxt_state = COUNT;
            enable = 1'b1;
          end
        end
      default: 
          if (en) begin
            nxt_state = COUNT;
            enable = 1'b1;
          end
    endcase
  end

  logic signed [31:0] out_temp;
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      out <= '0;
    else 
      out <= out_temp;
  end
  
  FtoI F2I (
		.clk    (clk),       //   input,   width = 1,    clk.clk
		.areset (rst),    //   input,   width = 1, areset.reset
		.en     (1'h1),    //   input,   width = 1,     en.en
		.a      (in_in),     //   input,  width = 32,      a.a
		.q      (out_temp)        //  output,  width = 32,      q.q
	);
  
endmodule