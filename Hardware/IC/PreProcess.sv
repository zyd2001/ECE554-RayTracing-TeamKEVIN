module PreProcess(
  clk, rst, start,
  v0,
  v1,
  v2,
  orig,
  done,
  v0v2,
  v0v1,
  tvec);
  
  parameter LATENCY = 3;
  
  input clk, rst;
  input start;
  input [95:0] v0, v1, v2, orig;
  
  output done;
  output [95:0] v0v2, v0v1, tvec;
  
  logic done_in, en;
  logic [2:0] counter, counter_in;  
  
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
    en = 1'b0;
    nxt_state = IDLE;
    case(state)
      COUNT: 
        begin
          if (counter == LATENCY)
            done_in = 1'b1;
          else begin
            en = 1'b1;
            counter_in = counter + 1'b1;
            nxt_state = COUNT;
          end
        end
      default: 
          if (start) begin
            en = 1'b1;
            nxt_state = COUNT;
          end
    endcase
  end
  // v0v1
  Float_Add Addv0v1_1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (v1[31:0]),         //   input,  width = 32,      a.a
		.b      (v0[31:0]),         //   input,  width = 32,      b.b
		.q      (v0v1[31:0]),       //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v1_2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (v1[63:32]),        //   input,  width = 32,      a.a
		.b      (v0[63:32]),        //   input,  width = 32,      b.b
		.q      (v0v1[63:32]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v1_3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (v1[95:64]),        //   input,  width = 32,      a.a
		.b      (v0[95:64]),        //   input,  width = 32,      b.b
		.q      (v0v1[95:64]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  // v0v2
  Float_Add Addv0v2_1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (v2[31:0]),         //   input,  width = 32,      a.a
		.b      (v0[31:0]),         //   input,  width = 32,      b.b
		.q      (v0v2[31:0]),       //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v2_2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (v2[63:32]),        //   input,  width = 32,      a.a
		.b      (v0[63:32]),        //   input,  width = 32,      b.b
		.q      (v0v2[63:32]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v2_3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (v2[95:64]),        //   input,  width = 32,      a.a
		.b      (v0[95:64]),        //   input,  width = 32,      b.b
		.q      (v0v2[95:64]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  // tvec
  Float_Add Addtvec_1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (orig[31:0]),       //   input,  width = 32,      a.a
		.b      (v0[31:0]),         //   input,  width = 32,      b.b
		.q      (tvec[31:0]),       //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addtvec_2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (orig[63:32]),      //   input,  width = 32,      a.a
		.b      (v0[63:32]),        //   input,  width = 32,      b.b
		.q      (tvec[63:32]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addtvec_3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (en),               //   input,   width = 1,     en.en
		.a      (orig[95:64]),      //   input,  width = 32,      a.a
		.b      (v0[95:64]),        //   input,  width = 32,      b.b
		.q      (tvec[95:64]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  assign done = done_in;
  
endmodule