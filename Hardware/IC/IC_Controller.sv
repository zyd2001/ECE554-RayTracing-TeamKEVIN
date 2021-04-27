module IC_Controller(
  clk, rst, StageI_capture, Controller_capture,
  Core_ID, thread_id_Mem_in, sid_IC_in, orig_in, dir_in, norm_in,
  IC_Mem_Rdy, thread_id_out, orig_out, dir_out, norm_out, IntersectionPoint_out, sid_IC_out,
  Mem_Rdy, v1_in, v2_in, v0_in, sid_Mem_in, Mem_NotValid,
  Mem_En, v1_out, v2_out, v0_out, sid_Mem_out, triangle_id, Tri_Rdy,
  u, v, t, det, trace_done);
  
  parameter NUM_THREAD = 32;
  parameter NUM_TRIANGLE = 512;
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
  
  input clk, rst, StageI_capture;
  // ICMemManager
  input Core_ID;
  input [BIT_THREAD-1:0] thread_id_Mem_in;
  input [31:0] sid_IC_in;
  input [95:0] orig_in, dir_in, norm_in;

  output IC_Mem_Rdy;
  output [BIT_THREAD-1:0] thread_id_out;
  output [95:0] orig_out, dir_out, norm_out, IntersectionPoint_out;
  output [31:0] sid_IC_out;
  // TriManager
  input Mem_Rdy;
  input [95:0] v1_in, v2_in, v0_in;
  input [31:0] sid_Mem_in;
  input Mem_NotValid;

  output Mem_En, Tri_Rdy;
  output [95:0] v1_out, v2_out, v0_out;
  output [31:0] sid_Mem_out;
  output unsigned [BIT_TRIANGLE-1:0] triangle_id;
  // Result 
  input trace_done;
  input [31:0] u, v, t, det;
  output Controller_capture;
  
  typedef enum reg [1:0] {DTCT, HIT, IDLE} state_t;
  state_t state, nxt_state;
  
  // logic
  logic ld, Fetch, CD_done, CP_done, Cmpr_out, CD_start, CP_start, CD_out, IC_Done, Controller_capture_in;
  logic [31:0] t_best, sid_best;
  logic [95:0] IntersectionPoint_in, orig, dir, norm_best, IntersectionPoint_best;
  
    always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= IDLE;
    else 
      state <= nxt_state;
  end
  
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      t_best <= '0;
      sid_best <= '0;
      norm_best <= '0;
      IntersectionPoint_best <= '0;
    end
    else if (ld) begin
      t_best <= t;
      sid_best <= sid_IC_in;
      norm_best <= norm_in;
      IntersectionPoint_best <= IntersectionPoint_in;
    end
  end
 
  assign Fetch = StageI_capture | Core_ID;
  assign Controller_capture = CD_done && CD_out;
  
  always_comb begin
    IC_Done = 1'b0;
    CP_start = 1'b0;
    ld = 1'b0;
    CD_start = 1'b0;
    Controller_capture_in = 1'b0;
    nxt_state = IDLE;
    case(state)
      HIT: 
        begin
          if (CP_done) begin
            Controller_capture_in = 1'b1;
            ld = 1'b1;
          end
          else
            nxt_state = HIT;
        end
      DTCT: 
        begin
          if (CD_done && CD_out && Cmpr_out) begin
            CP_start = 1'b1;
            nxt_state = HIT;
          end
          else if (CD_done)
            Controller_capture_in = 1'b1;
          else 
            nxt_state = DTCT;
        end
      default: 
        begin
          if (sid_IC_in == '0) 
            IC_Done = 1'b1;
          else if (trace_done) begin
            CD_start = 1'b1;
            nxt_state = DTCT;
          end
        end
    endcase
  end
  
  ICMemManager ICMemMng (
    .clk(clk), .rst(rst),
    .Core_ID(Core_ID), .IC_Done(IC_Done),
    .thread_id_Mem_in(thread_id_Mem_in),
    .thread_id_out(thread_id_out),
    .orig_in(orig_in), .orig_out(orig),
    .dir_in(dir_in), .dir_out(dir),
    .IntersectionPoint_in(IntersectionPoint_in), .IntersectionPoint_out(IntersectionPoint_out),
    .sid_in(sid_IC_in), .sid_out(sid_IC_out),
    .norm_in(norm_in), .norm_out(norm_out),
    .IC_Mem_Rdy(IC_Mem_Rdy)
  );
  
  TriManager TriMng (
    .clk(clk), .rst(rst),
    .Mem_Rdy(Mem_Rdy), .Fetch(Fetch), .clear(IC_Mem_Rdy),
    .v1_in(v1_in), .v1_out(v1_out),
    .v2_in(v2_in), .v2_out(v2_out),
    .v0_in(v0_in), .v0_out(v0_out),
    .sid_in(sid_Mem_in), .sid_out(sid_Mem_out),
    .Mem_NotValid(Mem_NotValid), .Mem_En(Mem_En),
    .triangle_id(triangle_id),
    .Tri_Rdy(Tri_Rdy)
  );

  ContactDetect CD (
    .clk(clk), .rst(rst), .start(CD_start),
    .u(u), .v(v), .det(det), 
    .done(CD_done),
    .result(CD_out)
  );

  ContactPoint CP (
    .clk(clk), .rst(rst), .start(CP_start), 
    .t(t), .orig(orig), .dir(dir), 
    .done(CP_done),
    .result(IntersectionPoint_in)
  );
  
  Float_Less Cmpr (
		.clk    (clk),          //   input,   width = 1,    clk.clk
		.areset (rst),          //   input,   width = 1, areset.reset
		.a      (t),            //   input,  width = 32,      a.a
		.b      (t_best),       //   input,  width = 32,      b.b
		.q      (Cmpr_out)      //  output,   width = 1,      q.q
	);
  
  assign Controller_capture = Controller_capture_in;
  assign orig_out = orig;
  assign dir_out = dir;
  
endmodule