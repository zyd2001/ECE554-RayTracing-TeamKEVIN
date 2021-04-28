module IC(
  clk, rst,
  Core_ID, thread_id_in, thread_id_out, IntersectionPoint,
  sid_in, sid_out, dir, orig, norm, IC_Mem_Rdy,
  Mem_Rdy, v1, v2, v0, Mem_NotValid, triangle_id, Mem_En
  );

  parameter NUM_THREAD = 32;
  parameter NUM_TRIANGLE = 512;
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);

  input clk, rst;
  // IC Mem
  input Core_ID;
  input [BIT_THREAD-1:0] thread_id_in;
  input [95:0] orig, dir;
  
  output IC_Mem_Rdy;
  output [BIT_THREAD-1:0] thread_id_out;
  output [31:0] sid_out;
  output [95:0] norm, IntersectionPoint;
  // Tri Mem
  input Mem_Rdy, Mem_NotValid;
  input [95:0] v1, v2, v0;
  input [31:0] sid_in;
  
  output Mem_En;
  output unsigned [BIT_TRIANGLE-1:0] triangle_id;
  
  typedef enum reg [1:0] {BUSY, FTCH, WAIT, IDLE} state_t;
  state_t state, nxt_state;
  
  logic Fetch, Tri_Rdy, ld, ld_init, ld_better, better, clear_cntr, done, cnt, IC_Mem_Rdy_in, clear;
  logic [95:0] IntersectionPoint_better, norm_better, Intersection_Point_in, norm_in;
  logic [31:0] sid_Tri_out, sid_Calc_out, sid_better, t_in, t_better;
  logic [5:0] counter;
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst) begin
      sid_better <= '0;
      IntersectionPoint_better <= '0;
      norm_better <= '0;
      t_better <= '0;
    end
    else if (ld_better|ld_init) begin
      sid_better <= sid_Calc_out;
      IntersectionPoint_better <= Intersection_Point_in;
      norm_better <= norm_in;
      t_better <= t_in;
    end
  end
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst|clear_cntr)
      counter <= '0;
    else if (cnt) 
      counter <= counter + 1'b1;
  end
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= IDLE;
    else 
      state <= nxt_state;
  end
  
  assign done = (counter == 6'd47);
  
  always_comb begin
    Fetch = 1'b0;
    clear = 1'b0;
    ld = 1'b0;
    ld_init = 1'b0;
    ld_better = 1'b0;
    cnt = 1'b0;
    IC_Mem_Rdy_in = 1'b0;
    clear_cntr = 1'b0;
    nxt_state = IDLE;
    case(state)
      BUSY:
        begin
          if (done) begin
            clear_cntr = 1'b1;
            if (sid_Calc_out == '0) begin
              IC_Mem_Rdy_in = 1'b1;
            end
            else if (better) begin
              ld_better = 1'b1;
              Fetch = 1'b1;
              nxt_state = FTCH;
            end
          end
          else begin
            cnt = 1'b1;
            nxt_state = BUSY;
          end
        end
      FTCH: 
        begin
          if (Tri_Rdy) begin
            cnt = 1'b1;
            nxt_state = BUSY;
          end
          else
            nxt_state = FTCH;
        end
      WAIT:
        begin
          if (done) begin
            ld_init = 1'b1;
            nxt_state = FTCH;
          end
          else 
            nxt_state = WAIT;
        end
      default: 
        begin
          if (Core_ID) begin
            Fetch = 1'b1;
            ld = 1'b1;
            clear = 1'b1;
            nxt_state = WAIT;
          end
        end
    endcase
  end
  
  Calculation Calc (
    .clk(clk), .rst(rst), 
    .v0(v0_out), .v1(v1_out), .v2(v2_out), .orig(orig), .dir(dir), .sid_in(sid_Tri_out),
    .sid_out(sid_Calc_out), .Intersection_Point(Intersection_Point_in), .norm_out(norm_in), .t(t_in)
  );
  
  TriManager_v2 TriMnger (
    .clk(clk), .rst(rst),
    .Mem_Rdy(Mem_Rdy), .Fetch(Fetch), .clear(clear),
    .v1_in(v1_in), .v1_out(v1_out),
    .v2_in(v2_in), .v2_out(v2_out),
    .v0_in(v0_in), .v0_out(v0_out),
    .sid_in(sid_in), .sid_out(sid_Tri_out),
    .Mem_NotValid(Mem_NotValid), .Mem_En(Mem_En),
    .triangle_id(triangle_id),
    .Tri_Rdy(Tri_Rdy)
  );
  
  Float_Less btr (
		.clk    (clk),    //   input,   width = 1,    clk.clk
		.areset (rst), //   input,   width = 1, areset.reset
		.a      (t_better),      //   input,  width = 32,      a.a
		.b      (t_in),      //   input,  width = 32,      b.b
		.q      (better)       //  output,   width = 1,      q.q
	);
  
  assign IC_Mem_Rdy = IC_Mem_Rdy_in;
  
endmodule