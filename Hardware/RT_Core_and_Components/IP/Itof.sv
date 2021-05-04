module itf (in_in, out, clk, en, done, rst_n);

  parameter LATENCY = 9;

  input clk, en, rst_n;
  input [31:0] in_in;
  output logic signed [31:0] out; 
  output logic done;
  
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
    nxt_state = IDLE;
    case(state)
      COUNT: 
        begin
          if (counter == LATENCY)
            done = 1'b1;
          else begin
            counter_in = counter + 1'b1;
            nxt_state = COUNT;
          end
        end
      default: 
          if (en)
            nxt_state = COUNT;
    endcase
  end
  
  ItoF ItF (
		.clk    (clk),        //   input,   width = 1,    clk.clk
		.areset (!rst_n),     //   input,   width = 1, areset.reset
		.en     (en),         //   input,   width = 1,     en.en
		.a      (in_in),      //   input,  width = 32,      a.a
		.q      (out)         //  output,  width = 32,      q.q
	);
  
endmodule