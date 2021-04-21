module FloatPU (
  clk, rst, en,
  mode,
  a,
  b,
  done,
  result);
  
  parameter ADD_LATENCY = 5,
            MUL_LATENCY = 5,
            DIV_LATENCY = 27;
  
  input clk, rst, en;
  input [1:0] mode;
  input [31:0] a, b;
  
  output done;
  output [31:0] result;
  
  logic done_in, done_reg;
  
  logic Adder_en, Multiplier_en, Divider_en;
  
  logic [4:0] counter, counter_in;
  
  logic [31:0] Divider_result, Adder_result, Multiplier_result, result_in, result_reg;
  
  typedef enum reg [1:0] {ADDSUB, MUL, DIV, IDLE} state_t;
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
    Adder_en = 1'b0;
    Multiplier_en = 1'b0;
    Divider_en = 1'b0;
    done_in = 1'b0;
    counter_in = '0;
    result_in = result;
    nxt_state = IDLE;
    case(state)
      ADDSUB: 
        begin
          if (counter == ADD_LATENCY) begin
            done_in = 1'b1;
            result_in = Adder_result;
          end
          else begin
            counter_in = counter + 1'b1;
            Adder_en = 1'b1;
            nxt_state = ADDSUB;
          end
        end
      MUL: 
        begin
          if (counter == MUL_LATENCY) begin
            done_in = 1'b1;
            result_in = Multiplier_result;
          end
          else begin
            counter_in = counter + 1'b1;
            Multiplier_en = 1'b1;
            nxt_state = MUL;
          end
        end
      DIV: 
        begin
          if (counter == DIV_LATENCY) begin
            done_in = 1'b1;
            result_in = Divider_result;
          end
          else begin
            counter_in = counter + 1'b1;
            Divider_en = 1'b1;
            nxt_state = DIV;
          end
        end
      default: 
          if (en) begin
            if (mode[1] == 1'b0) begin
              Adder_en = 1'b1;
              nxt_state = ADDSUB;
            end
            else if (mode == 2'b10) begin
              Multiplier_en = 1'b1;
              nxt_state = MUL;
            end
            else begin
              Divider_en = 1'b1;
              nxt_state = DIV;
            end
          end
    endcase
  end
  
  Float_Add Adder (
		.clk    (clk),               //   input,   width = 1,    clk.clk
		.areset (Adder_rst),         //   input,   width = 1, areset.reset
		.en     (Adder_en),          //   input,   width = 1,     en.en
		.a      (a),                 //   input,  width = 32,      a.a
		.b      (b),                 //   input,  width = 32,      b.b
		.q      (Adder_result),      //  output,  width = 32,      q.q
		.opSel  (mode[0])            //   input,   width = 1,  opSel.opSel
	);

	Float_Mul Multiplier (
		.clk    (clk),                    //   input,   width = 1,    clk.clk
		.areset (rst),         //   input,   width = 1, areset.reset
		.en     (Multiplier_en),          //   input,   width = 1,     en.en
		.a      (a),                      //   input,  width = 32,      a.a
		.b      (b),                      //   input,  width = 32,      b.b
		.q      (Multiplier_result)       //  output,  width = 32,      q.q
	);

	Float_Div Divider (
		.clk    (clk),                 //   input,   width = 1,    clk.clk
		.areset (rst),         //   input,   width = 1, areset.reset
		.en     (Divider_en),          //   input,   width = 1,     en.en
		.a      (a),                   //   input,  width = 32,      a.a
		.b      (b),                   //   input,  width = 32,      b.b
		.q      (Divider_result)       //  output,  width = 32,      q.q
	);

  assign done = done_reg;
  assign result = result_reg;
  
endmodule