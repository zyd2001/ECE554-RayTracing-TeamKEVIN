///////////////////////////////
// Floating point compute unit encoding
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


module FPU (
    op1_in, op2_in, out, operation, flag, clk, en, done, rst_n
  );
  
  parameter ADD_LATENCY = 5,
            MUL_LATENCY = 5,
            DIV_LATENCY = 27;

  input clk, en, rst_n;
  input [31:0] op1_in, op2_in;
  input [1:0] operation;
  output logic [31:0] out;
  output logic [1:0] flag;
  output logic done;

  logic Adder_en, Multiplier_en, Divider_en;
  logic [4:0] counter, counter_in;
  logic [31:0] Adder_result, Multiplier_result, Divider_result;
  
  assign Adder_en = en & (!operation[1]);
  assign Multiplier_en = en & operation[1] & (!operation[0]);
  assign Divider_en = en & operation[1] & operation[0];
  
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
  
  Float_Add Adder (
		.clk    (clk),               //   input,   width = 1,    clk.clk
		.areset (!rst_n),            //   input,   width = 1, areset.reset
		.en     (Adder_en),          //   input,   width = 1,     en.en
		.a      (op1_in),            //   input,  width = 32,      a.a
		.b      (op2_in),            //   input,  width = 32,      b.b
		.q      (Adder_result),      //  output,  width = 32,      q.q
		.opSel  (!operation[0])      //   input,   width = 1,  opSel.opSel
	);

	Float_Mul Multiplier (
		.clk    (clk),               //   input,   width = 1,    clk.clk
		.areset (!rst_n),            //   input,   width = 1, areset.reset
		.en     (Multiplier_en),     //   input,   width = 1,     en.en
		.a      (op1_in),            //   input,  width = 32,      a.a
		.b      (op2_in),            //   input,  width = 32,      b.b
		.q      (Multiplier_result)  //  output,  width = 32,      q.q
	);

	Float_Div Divider (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.areset (!rst_n),             //   input,   width = 1, areset.reset
		.en     (Divider_en),         //   input,   width = 1,     en.en
		.a      (op1_in),             //   input,  width = 32,      a.a
		.b      (op2_in),             //   input,  width = 32,      b.b
		.q      (Divider_result)      //  output,  width = 32,      q.q
	);

  always_comb begin 
    if (out == 0)
      flag[1] = 0;
    else 
      flag[1] = 1;
    flag[0] = out[31];      
  end


endmodule