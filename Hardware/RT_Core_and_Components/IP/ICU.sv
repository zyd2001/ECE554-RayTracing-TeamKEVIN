///////////////////////////////
// Integer compute unit encoding
// 00: Add
// 01: Sub
// 10: Multiply
// 11: Divide
//
// Flag encoding
// Zero bit, sign bit
// 0x: output is 0
// 10: positive
// 11: negative
//
// Author: Kevin Ding
// Last modify: 5/4
///////////////////////////////


module ICU (
    op1_in, op2_in, out, operation, flag, clk, en, done, rst_n
);
  parameter ADD_LATENCY = 3,
            MUL_LATENCY = 8,
            DIV_LATENCY = 40;

  input clk, en, rst_n;
  input [31:0] op1_in, op2_in;
  input [1:0] operation;
  output logic [31:0] out;
  output logic [1:0] flag;
  output logic done;

  logic Adder_en, Multiplier_en, Divider_en;
  logic [4:0] counter, counter_in;
  logic [31:0] Multiplier_result, Divider_result, Adder_b;
  logic [63:0] Adder_result;
  
  assign Adder_en = en & (!operation[1]);
  assign Multiplier_en = en & operation[1] & (!operation[0]);
  assign Divider_en = en & operation[1] & operation[0];
  
  assign Adder_b = operation[0] ? (~op2_in + 1'b1) : op2_in;
  
  typedef enum reg [1:0] {ADDSUB, MUL, DIV, IDLE} state_t;
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
    out = '0;
    done = 1'b0;
    counter_in = '0;
    nxt_state = IDLE;
    case(state)
      DIV: 
        begin
          if (counter == DIV_LATENCY) begin
            out = Divider_result;
            done = 1'b1;
          end
          else begin
            counter_in = counter + 1'b1;
            nxt_state = DIV;
          end
        end
      MUL: 
        begin
          if (counter == MUL_LATENCY) begin
            out = Multiplier_result;
            done = 1'b1;
          end
          else begin
            counter_in = counter + 1'b1;
            nxt_state = MUL;
          end
        end
      ADDSUB: 
        begin
          if (counter == ADD_LATENCY) begin
            out = Adder_result;
            done = 1'b1;
          end
          else begin
            counter_in = counter + 1'b1;
            nxt_state = ADDSUB;
          end
        end
      default: 
        begin
          if (Adder_en)
            nxt_state = ADDSUB;
          else if (Multiplier_en)
            nxt_state = MUL;
          else if (Divider_en)
            nxt_state = DIV;
        end
    endcase
  end
  
  Fix_Add Adder (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.rst    (!rst_n),             //   input,   width = 1,    rst.reset
		.en     (Adder_en),           //   input,   width = 1,     en.en
		.a0     (op1_in),             //   input,  width = 32,     a0.a0
		.a1     (Adder_b),            //   input,  width = 32,     a1.a1
		.result (Adder_result)        //  output,  width = 33, result.result
	);

	Fix_Mul Multiplier (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.rst    (!rst_n),             //   input,   width = 1,    rst.reset
		.en     (Multiplier_en),      //   input,   width = 1,     en.en
		.a      (op1_in),             //   input,  width = 32,      a.a
		.b      (op2_in),             //   input,  width = 32,      b.b
		.result (Multiplier_result)   //  output,  width = 64, result.result
	);

	Fix_Div Divider (
		.clk         (clk),           //   input,   width = 1,         clk.clk
		.rst         (!rst_n),        //   input,   width = 1,         rst.reset
		.en          (Divider_en),    //   input,   width = 1,          en.en
		.numerator   (op1_in),        //   input,  width = 32,   numerator.numerator
		.denominator (op2_in),        //   input,  width = 32, denominator.denominator
		.result      (Divider_result) //  output,  width = 32,      result.result
	);

  always_comb begin 
    if (out == 0)
      flag[1] = 0;
    else 
      flag[1] = 1;
    flag[0] = out[31];      
  end
  
endmodule