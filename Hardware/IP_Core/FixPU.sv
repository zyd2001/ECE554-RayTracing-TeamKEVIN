module FixPU (
  clk, rst, en, start,
  mode,
  a,
  b,
  done,
  result);
  
  parameter ADD_LATENCY = 3,
            MUL_LATENCY = 8,
            DIV_LATENCY = 40;
            
  input clk, rst, en, start;
  input [1:0] mode;
  input [31:0] a, b;
  
  output done;
  output [63:0] result;
  
  logic done_in;
  
  logic Adder_en, Multiplier_en, Divider_en, done_reg;
  
  logic [5:0] counter, counter_in;
  
  logic [31:0] Adder_b;
  
  logic [31:0] Divider_result_in;
  logic [32:0] Adder_result_in;
  logic [63:0] Multiplier_result_in;
  logic [63:0] result_in, result_reg;
  
  logic [63:0] Adder_result, Multiplier_result, Divider_result;
  
  typedef enum reg [1:0] {ADDSUB, MUL, DIV, IDLE} state_t;
  state_t state, nxt_state;
  
  assign Adder_b = mode[0] ? (~b + 1) : b;
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      Adder_result <= '0;
      Multiplier_result <= '0;
      Divider_result <= '0;
    end
    else begin
      Adder_result <= {31'h0, Adder_result_in};
      Multiplier_result <= Multiplier_result_in;
      Divider_result <= {32'h0, Divider_result_in};
    end
  end  
  
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
    result_in = result_reg;
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
          if (en && start) begin
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
  
  Fix_Add Adder (
		.clk    (clk),          //   input,   width = 1,    clk.clk
		.rst    (rst),    //   input,   width = 1,    rst.reset
		.en     (Adder_en),     //   input,   width = 1,     en.en
		.a0     (a),            //   input,  width = 32,     a0.a0
		.a1     (Adder_b),      //   input,  width = 32,     a1.a1
		.result (Adder_result_in)  //  output,  width = 33, result.result
	);

	Fix_Mul Multiplier (
		.clk    (clk),               //   input,   width = 1,    clk.clk
		.rst    (rst),    //   input,   width = 1,    rst.reset
		.en     (Multiplier_en),     //   input,   width = 1,     en.en
		.a      (a),                 //   input,  width = 32,      a.a
		.b      (b),                 //   input,  width = 32,      b.b
		.result (Multiplier_result_in)  //  output,  width = 64, result.result
	);

	Fix_Div Divider (
		.clk         (clk),                 //   input,   width = 1,         clk.clk
		.rst         (rst),         //   input,   width = 1,         rst.reset
		.en          (Divider_en),          //   input,   width = 1,          en.en
		.numerator   (a),                   //   input,  width = 32,   numerator.numerator
		.denominator (b),                   //   input,  width = 32, denominator.denominator
		.result      (Divider_result_in)       //  output,  width = 32,      result.result
	);
  
  assign done = done_reg;
  assign result = result_reg;
  
endmodule