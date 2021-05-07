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
// Last modify: 5/7
///////////////////////////////


module ICU (
    op1_in, op2_in, out, operation, flag, clk, en, done, rst_n, rst
);

  parameter LATENCY = 0;

  input clk, en, rst_n, rst;
  input [31:0] op1_in, op2_in;
  input [1:0] operation;
  output logic [63:0] out;
  output logic [1:0] flag;
  output logic done;

  logic Adder_en, Multiplier_en, Divider_en, Adder_enable, Multiplier_enable, Divider_enable;
  logic [5:0] counter, counter_in;
  logic [31:0] op1_reg, op2_reg;
  logic [31:0] Divider_result, Divider_result_reg, Adder_b;
  logic [32:0] Adder_result, Adder_result_reg;
  logic [63:0] Multiplier_result, Multiplier_result_reg;
  
  assign Adder_en = en & (!operation[1]);
  assign Multiplier_en = en & operation[1] & (!operation[0]);
  assign Divider_en = en & operation[1] & operation[0];
  
  assign Adder_b = operation[0] ? (~op2_in + 1'b1) : op2_in;
  
  typedef enum reg [1:0] {ADDSUB, MUL, DIV, IDLE} state_t;
  state_t state, nxt_state;
  
  always_ff@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      op1_reg <= '0;
      op2_reg <= '0;
    end
    else if (en) begin
      op1_reg <= op1_in;
      op2_reg <= op2_in;
    end
  end
  
  always_ff@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      counter <= '0;
      state <= IDLE;
      Divider_result_reg <= '0;
      Adder_result_reg <= '0;
      Multiplier_result_reg <= '0;
    end
    else begin
      counter <= counter_in;
      state <= nxt_state;
      Divider_result_reg <= Divider_result;
      Adder_result_reg <= Adder_result;
      Multiplier_result_reg <= Multiplier_result;
    end
  end
  
  always_comb begin
    out = '0;
    done = 1'b0;
    counter_in = '0;
    Adder_enable = 1'b0;
    Multiplier_enable = 1'b0;
    Divider_enable = 1'b0;
    nxt_state = IDLE;
    case(state)
      DIV: 
        begin
          if (counter == LATENCY) begin
            out = {{32{Divider_result[31]}}, Divider_result};
            done = 1'b1;
          end
          else begin
            counter_in = counter + 1'b1;
            nxt_state = DIV;
            Divider_enable = 1'b1;
          end
        end
      MUL: 
        begin
          if (counter == LATENCY) begin
            out = Multiplier_result;
            done = 1'b1;
          end
          else begin
            counter_in = counter + 1'b1;
            nxt_state = MUL;
            Multiplier_enable = 1'b1;
          end
        end
      ADDSUB: 
        begin
          if (counter == LATENCY) begin
            out = {{31{Adder_result[32]}}, Adder_result};
            done = 1'b1;
          end
          else begin
            counter_in = counter + 1'b1;
            nxt_state = ADDSUB;
            Adder_enable = 1'b1;
          end
        end
      default: 
        begin
          if (Adder_en) begin
            nxt_state = ADDSUB;
            Adder_enable = 1'b1;
          end
          else if (Multiplier_en) begin
            nxt_state = MUL;
            Multiplier_enable = 1'b1;
          end
          else if (Divider_en) begin
            nxt_state = DIV;
            Divider_enable = 1'b1;
          end
        end
    endcase
  end
  
  assign Adder_result = Adder_en ? (op1_reg + Adder_b) : Adder_result_reg;
  assign Multiplier_result = Multiplier_en ? (op1_reg * op2_reg) : Multiplier_result_reg;
  assign Divider_result = Divider_en ? (op1_reg / op2_reg) : Divider_result_reg;
  
  always_comb begin 
    if (out == 0)
      flag[1] = 0;
    else 
      flag[1] = 1;
    flag[0] = out[63];      
  end
  
endmodule