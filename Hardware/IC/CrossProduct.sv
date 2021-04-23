module CrossProduct(
  clk, rst, start,
  vector1, 
  vector2,
  done,
  result);
  
  parameter ADD_LATENCY = 3,
            MUL_LATENCY = 2;
  
  input clk, rst;
  input start;
  input [95:0] vector1, vector2;
  
  output done;
  output [95:0] result;
  
  logic done_in, Mul_en, Add_en;
  logic [2:0] counter, counter_in;
  
  logic [31:0] Mul1_1_out, Mul1_2_out,
               Mul2_1_out, Mul2_2_out,
               Mul3_1_out, Mul3_2_out;
  
  
  typedef enum reg {COUNT, IDLE} state_t;
  state_t state, nxt_state;
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst) begin
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
    done_in = 1'b0;
    Mul_en = 1'b0;
    Add_en = 1'b0;
    nxt_state = IDLE;
    case(state)
      COUNT: 
        begin
          if (counter == ADD_LATENCY + MUL_LATENCY)
            done_in = 1'b1;
          else begin
            Mul_en = 1'b1;
            Add_en = 1'b1;
            counter_in = counter + 1'b1;
            nxt_state = COUNT;
          end
        end
      default:
        begin
          if (start) begin
            Mul_en = 1'b1;
            Add_en = 1'b1;
            nxt_state = COUNT;
          end
        end
    endcase
  end

  Float_Mul Mul1_1 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Mul_en),           //   input,   width = 1,     en.en
		.a      (vector1[63:32]),   //   input,  width = 32,      a.a
		.b      (vector2[95:64]),   //   input,  width = 32,      b.b
		.q      (Mul1_1_out)        //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul1_2 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Mul_en),           //   input,   width = 1,     en.en
		.a      (vector1[95:64]),   //   input,  width = 32,      a.a
		.b      (vector2[63:32]),   //   input,  width = 32,      b.b
		.q      (Mul1_2_out)        //  output,  width = 32,      q.q
	);
  
  Float_Add Add1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Add_en),           //   input,   width = 1,     en.en
		.a      (Mul1_1_out),       //   input,  width = 32,      a.a
		.b      (Mul1_2_out),       //   input,  width = 32,      b.b
		.q      (result[31:0]),     //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);

  Float_Mul Mul2_1 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Mul_en),           //   input,   width = 1,     en.en
		.a      (vector1[95:64]),   //   input,  width = 32,      a.a
		.b      (vector2[31:0]),    //   input,  width = 32,      b.b
		.q      (Mul2_1_out)        //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2_2 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Mul_en),           //   input,   width = 1,     en.en
		.a      (vector1[31:0]),    //   input,  width = 32,      a.a
		.b      (vector2[95:64]),   //   input,  width = 32,      b.b
		.q      (Mul2_2_out)        //  output,  width = 32,      q.q
	);
  
  Float_Add Add2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Add_en),           //   input,   width = 1,     en.en
		.a      (Mul2_1_out),       //   input,  width = 32,      a.a
		.b      (Mul2_2_out),       //   input,  width = 32,      b.b
		.q      (result[63:32]),    //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
    Float_Mul Mul3_1 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Mul_en),           //   input,   width = 1,     en.en
		.a      (vector1[31:0]),    //   input,  width = 32,      a.a
		.b      (vector2[63:32]),   //   input,  width = 32,      b.b
		.q      (Mul3_1_out)        //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3_2 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Mul_en),           //   input,   width = 1,     en.en
		.a      (vector1[63:32]),   //   input,  width = 32,      a.a
		.b      (vector2[31:0]),    //   input,  width = 32,      b.b
		.q      (Mul3_2_out)        //  output,  width = 32,      q.q
	);
  
  Float_Add Add3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (Add_en),           //   input,   width = 1,     en.en
		.a      (Mul3_1_out),       //   input,  width = 32,      a.a
		.b      (Mul3_2_out),       //   input,  width = 32,      b.b
		.q      (result[95:64]),    //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);

  assign done = done_in;
  
endmodule