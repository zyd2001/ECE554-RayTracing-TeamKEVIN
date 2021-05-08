module IC_v3(
  clk, rst,
  Core_ID, thread_id_in, thread_id_out, IntersectionPoint,
  sid_in, sid_out, dir, orig, norm, IC_Mem_Rdy, Context_Switch_PD,
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
  
  output IC_Mem_Rdy, Context_Switch_PD;
  output [BIT_THREAD-1:0] thread_id_out;
  output [31:0] sid_out;
  output [95:0] norm, IntersectionPoint;
  // Tri Mem
  input Mem_Rdy, Mem_NotValid;
  input [95:0] v1, v2, v0;
  input [31:0] sid_in;
  
  output Mem_En;
  output unsigned [BIT_TRIANGLE-1:0] triangle_id;
  
  typedef enum reg [1:0] {FTCH, WAIT, BUSY, IDLE} state_t;
  state_t state, nxt_state;
  
  logic Fetch, ld, ld_init, ld_better, better, better_g, better_l, done, cnt, clear, Context_Switch_PD_in, hit, result_clear;
  logic [BIT_THREAD-1:0] thread_id_reg;
  logic [95:0] v2_out, v1_out, v0_out;
  logic [95:0] orig_reg, dir_reg;
  logic [95:0] IntersectionPoint_better, norm_better, Intersection_Point_in, norm_in;
  logic [31:0] sid_Tri_out, sid_Calc_out, sid_better, t_in, t_better;
  logic [5:0] counter;
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst) begin
      thread_id_reg <= '0;
      orig_reg <= '0;
      dir_reg <= '0;
    end
    else if (ld) begin
      thread_id_reg <= thread_id_in;
      orig_reg <= orig;
      dir_reg <= dir;
    end
  end
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst) begin
      sid_better <= '0;
      IntersectionPoint_better <= '0;
      norm_better <= '0;
      t_better <= '0;
    end
    else if (result_clear) begin
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
    if (rst|clear)
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
  
  assign done = (counter == 6'd50);
  
  always_comb begin
    Fetch = 1'b0;
    clear = 1'b0;
    ld = 1'b0;
    ld_better = 1'b0;
    ld_init = 1'b0;
    cnt = 1'b0;
    Context_Switch_PD_in = 1'b0;
    result_clear = 1'b0;
    nxt_state = IDLE;
    case(state)
      FTCH: 
        begin
          if (Mem_NotValid) begin
            Context_Switch_PD_in = 1'b1;
          end
          else if (Mem_Rdy) begin
            cnt = 1'b1;
            nxt_state = BUSY;
          end
          else
            nxt_state = FTCH;
        end 
      BUSY:
        begin
          if (done) begin
            Fetch = 1'b1;
            clear = 1'b1;
            nxt_state = FTCH;
            if (hit & better)
              ld_better = 1'b1;
          end
          else begin
            cnt = 1'b1;
            nxt_state = BUSY;
          end
        end
      WAIT:
        begin
          if (Mem_NotValid)
            Context_Switch_PD_in = 1'b1;
          else if (done & hit & better_g) begin
            ld_init = 1'b1;
            Fetch = 1'b1;
            clear = 1'b1;
            nxt_state = FTCH;
          end
          else if (done) begin
            Fetch = 1'b1;
            clear = 1'b1;
            nxt_state = WAIT;
          end
          else begin
            nxt_state = WAIT;
            cnt = 1'b1;
          end
        end
      default: 
        begin
          if (Core_ID) begin
            result_clear = 1'b1;
            Fetch = 1'b1;
            ld = 1'b1;
            clear = 1'b1;
            nxt_state = WAIT;
          end
        end
    endcase
  end
  
  Calculation_v3 Calc (
    .clk(clk), .rst(rst), 
    .v0(v0_out), .v1(v1_out), .v2(v2_out), .orig(orig_reg), .dir(dir_reg), .sid_in(sid_Tri_out),
    .sid_out(sid_Calc_out), .Intersection_Point(Intersection_Point_in), .norm(norm_in), .t(t_in), .hit(hit)
  );
  
  TriManager_v3 TriMnger (
    .clk(clk), .rst(rst),
    .Mem_Rdy(Mem_Rdy), .Fetch(Fetch),
    .v1_in(v1), .v1_out(v1_out),
    .v2_in(v2), .v2_out(v2_out),
    .v0_in(v0), .v0_out(v0_out),
    .sid_in(sid_in), .sid_out(sid_Tri_out),
    .Mem_NotValid(Mem_NotValid), .Mem_En(Mem_En),
    .triangle_id(triangle_id)
  );
  
  Float_Less btr (
		.clk    (clk),        //   input,   width = 1,    clk.clk
		.areset (rst),        //   input,   width = 1, areset.reset
		.a      (t_in),       //   input,  width = 32,      a.a
		.b      (t_better),   //   input,  width = 32,      b.b
		.q      (better_l)      //  output,   width = 1,      q.q
	);

      Float_Grtr ggg (
		.clk    (clk),        //   input,   width = 1,    clk.clk
		.areset (rst),        //   input,   width = 1, areset.reset
		.a      (t_in),       //   input,  width = 32,      a.a
		.b      (32'b0),   //   input,  width = 32,      b.b
		.q      (better_g)      //  output,   width = 1,      q.q
	);
    assign better = better_l & better_g;
  
  assign Context_Switch_PD = Context_Switch_PD_in;
  assign thread_id_out = thread_id_reg;
  assign sid_out = sid_better;
  assign norm = norm_better;
  assign IntersectionPoint = IntersectionPoint_better;
  assign IC_Mem_Rdy = ld;
  
endmodule