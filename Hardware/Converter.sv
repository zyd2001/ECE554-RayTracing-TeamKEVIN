module Converter (
  clk, rst, en,
  mode,
  data_in,
  done,
  data_out);

  parameter F2I_LATENCY = 5;
            I2F_LATENCY = 9;

  input clk, rst, en;
  input mode;
  input [31:0] data_in;
  
  output done;
  output [31:0] data_out;

  logic FtoI_en, ItoF_en;
  
  logic [3:0] counter, counter_in;
  
  logic [31:0] FtoI_out, ItoF_out, data_out_in;
  
  typedef enum [1:0] reg {F2I, I2F, IDLE} state_t;
  state_t state, nxt_state;
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst) begin
      counter <= '0;
      state <= IDLE;
      done <= '0;
      data_out <= '0;
    end
    else begin
      counter <= counter_in;
      state <= nxt_state;
      done <= done_in;
      data_out <= data_out_in;
    end
  end

  always_comb begin
    FtoI_en = 1'b0;
    ItoF_en = 1'b0;
    done_in = 1'b0;
    counter_in = '0;
    data_out_in = data_out;
    nxt_state = IDLE;
    case(state)
      F2I: 
        begin
          if (counter == F2I_LATENCY) begin
            done_in = 1'b1;
            data_out_in = FtoI_out;
          end
          else begin
            counter_in = counter + 1'b1;
            FtoI_en = 1'b1;
            nxt_state = F2I;
          end
        end
      I2F: 
        begin
          if (counter == I2F_LATENCY) begin
            done_in = 1'b1;
            data_out_in = I2F_LATENCY;
          end
          else begin
            counter_in = counter + 1'b1;
            ItoF_en = 1'b1;
            nxt_state = I2F;
          end
        end
      default: 
          if (en) begin
            if (mode == 1'b0) begin
              FtoI_en = 1'b1;
              nxt_state = F2I;
            end
            else begin
              ItoF_en = 1'b1;
              nxt_state = I2F;
            end
          end
    endcase
  end
  
	FtoI F2I (
		.clk    (clk),          //   input,   width = 1,    clk.clk
		.areset (rst),     //   input,   width = 1, areset.reset
		.en     (FtoI_en),      //   input,   width = 1,     en.en
		.a      (data_in),      //   input,  width = 32,      a.a
		.q      (FtoI_out)      //  output,  width = 32,      q.q
	);

	ItoF I2F (
		.clk    (clk),          //   input,   width = 1,    clk.clk
		.areset (rst),     //   input,   width = 1, areset.reset
		.en     (ItoF_en),      //   input,   width = 1,     en.en
		.a      (data_in),      //   input,  width = 32,      a.a
		.q      (ItoF_out)      //  output,  width = 32,      q.q
	);

endmodule