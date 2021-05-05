module ContactPoint(
  clk, rst, start,
  t, orig, dir, 
  done,
  result);
  
  parameter ADD_LATENCY = 3,
            MUL_LATENCY = 2;
  
  input clk, rst;
  input start;
  input [31:0] t;
  input [95:0] orig, dir;
  
  output done;
  output [95:0] result;
  
  logic done_in, Mul_en, Add_en;
  logic [3:0] counter, counter_in;
  
  logic [31:0] Mul1_out, Mul2_out, Mul3_out;
  
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

  Float_Mul Mul1 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (Mul_en),          //   input,   width = 1,     en.en
		.a      (t),   //   input,  width = 32,      a.a
		.b      (dir[31:0]),   //   input,  width = 32,      b.b
		.q      (Mul1_out)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (Mul_en),          //   input,   width = 1,     en.en
		.a      (t),  //   input,  width = 32,      a.a
		.b      (dir[63:32]),  //   input,  width = 32,      b.b
		.q      (Mul2_out)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (Mul_en),          //   input,   width = 1,     en.en
		.a      (t),  //   input,  width = 32,      a.a
		.b      (dir[95:64]),  //   input,  width = 32,      b.b
		.q      (Mul3_out)         //  output,  width = 32,      q.q
	);

  Float_Add Add1 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (Add_en),          //   input,   width = 1,     en.en
		.a      (Mul1_out),        //   input,  width = 32,      a.a
		.b      (orig[31:0]),        //   input,  width = 32,      b.b
		.q      (result[31:0]),        //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);

  Float_Add Add2 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (Add_en),          //   input,   width = 1,     en.en
		.a      (Mul2_out),        //   input,  width = 32,      a.a
		.b      (orig[63:32]),        //   input,  width = 32,      b.b
		.q      (result[63:32]),          //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Add3 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (Add_en),          //   input,   width = 1,     en.en
		.a      (Mul3_out),        //   input,  width = 32,      a.a
		.b      (orig[95:64]),        //   input,  width = 32,      b.b
		.q      (result[95:64]),          //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);
  
  assign done = done_in;
  
endmodule