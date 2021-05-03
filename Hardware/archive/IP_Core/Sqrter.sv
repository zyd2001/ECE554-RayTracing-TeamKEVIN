module Sqrter (
  clk, rst, en, start,
  in,
  done,
  out);
  
  parameter LATENCY = 19;
  
  input clk, rst, en, start;
  input [31:0] in;
  
  output done;
  output [31:0] out;
  
  logic done_in, done_reg;
  logic [4:0] counter, counter_in;
  
  logic [31:0] Sqrt_out, result_in, result_reg;
  
  typedef enum reg {COUNT, IDLE} state_t;
  state_t state, nxt_state;
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst) begin
      counter <= '0;
      state <= IDLE;
      done_reg <= '0;
      result_reg <= '0;
    end
    else begin
      counter <= counter_in;
      state <= nxt_state;
      done_reg <= done_in;
      result_reg <= result_in;
    end
  end
  
  always_comb begin
    counter_in = '0;
    done_in = 1'b0;
    result_in = result_reg;
    nxt_state = IDLE;
    case(state)
      COUNT: 
        begin
          if (counter == LATENCY) begin
            result_in = Sqrt_out;
            done_in = 1'b1;
          end
          else begin
            counter_in = counter + 1'b1;
            nxt_state = COUNT;
          end
        end
      default: 
          if (en && start)
            nxt_state = COUNT;
    endcase
  end

  Float_Sqrt Sqrt (
		.clk    (clk),         //   input,   width = 1,    clk.clk
		.areset (rst),         //   input,   width = 1, areset.reset
		.en     (en),          //   input,   width = 1,     en.en
		.a      (in),          //   input,  width = 32,      a.a
		.q      (Sqrt_out)          //  output,  width = 32,      q.q
	);

  assign done = done_reg;
  assign out = result_reg;
  
endmodule 