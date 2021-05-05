module ContactDetect(
  clk, rst, start,
  u, v, det, 
  done,
  result);
  
  parameter KEPSILON = 32'h0x322bcc77;   //1e-8
  localparam POSITIVEONE = 32'h0x3f800000; // 1
  
  parameter ADD_LATENCY = 3,
            CMPR_LATENCY = 2;
  
  input clk, rst;
  input start;
  input [31:0] u, v, det;
  
  output done;
  output result;
  
  logic done_in, en;
  logic [3:0] counter, counter_in;
  
  logic Less1_out, Less2_out, Less3_out, Greater1_out, Greater2_out;
  logic [31:0] Add_out;
  
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
          if (counter == ADD_LATENCY + CMPR_LATENCY)
            done_in = 1'b1;
          else begin
            en = 1'b1;
            counter_in = counter + 1'b1;
            nxt_state = COUNT;
          end
        end
      default: 
        begin
          if (start) begin
            en = 1'b1;
            nxt_state = COUNT;
          end
        end
    endcase
  end

  Float_Add Add (
    .clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.en     (en),             //   input,   width = 1,     en.en
		.a      (u),              //   input,  width = 32,      a.a
		.b      (v),              //   input,  width = 32,      b.b
		.q      (Add_out),        //  output,  width = 32,      q.q
		.opSel  (1'b1)            //   input,   width = 1,  opSel.opSel
	);

	Float_Less Less1 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.a      (u),              //   input,  width = 32,      a.a
		.b      ('0),             //   input,  width = 32,      b.b
		.q      (Less1_out)       //  output,   width = 1,      q.q
	);

	Float_Less Less2 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.a      (v),              //   input,  width = 32,      a.a
		.b      ('0),             //   input,  width = 32,      b.b
		.q      (Less2_out)       //  output,   width = 1,      q.q
	);

	Float_Less Less3 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.a      (det),            //   input,  width = 32,      a.a
		.b      (KEPSILON),       //   input,  width = 32,      b.b
		.q      (Less3_out)       //  output,   width = 1,      q.q
	);

	Float_Grtr Greater1 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.a      (u),              //   input,  width = 32,      a.a
		.b      (POSITIVEONE),    //   input,  width = 32,      b.b
		.q      (Greater1_out)    //  output,   width = 1,      q.q
	);
  
  Float_Grtr Greater2 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.a      (Add_out),        //   input,  width = 32,      a.a
		.b      (POSITIVEONE),    //   input,  width = 32,      b.b
		.q      (Greater2_out)    //  output,   width = 1,      q.q
	);
  
  assign done = done_in;
  assign result = ~(Less1_out | Less2_out | Less3_out | Greater1_out | Greater2_out);
  
endmodule