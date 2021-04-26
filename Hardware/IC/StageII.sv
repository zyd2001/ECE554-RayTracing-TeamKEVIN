module StageII(
  clk, rst, StageII_done, StageIII_capture, StageII_capture,
  v0v1_in, v0v1_out,
  v0v2_in, v0v2_out,
  dir_in, dir_out,
  tvec_in, tvec_out,
  pvec_in, pvec_out,
  qvec_in, qvec_out,
  norm_in, norm_out,
  thread_id_in, thread_id_out,
  triangle_id_in, triangle_id_out,
  sid_in, sid_out
  );
  
  parameter NUM_TRIANGLE = 512;
  parameter NUM_THREAD = 32;
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  
  input clk, rst, StageIII_capture, StageII_done;
  input [BIT_TRIANGLE-1:0] triangle_id_in;
  input [BIT_THREAD-1:0] thread_id_in;
  input [31:0] sid_in;
  input [95:0] v0v1_in, v0v2_in, dir_in, tvec_in, pvec_in, qvec_in, norm_in;
  
  output StageII_capture;
  output [BIT_TRIANGLE-1:0] triangle_id_out;
  output [BIT_THREAD-1:0] thread_id_out;
  output [31:0] sid_out;
  output [95:0] v0v1_out, v0v2_out, dir_out, tvec_out, pvec_out, qvec_out, norm_out;
  
  typedef enum reg [1:0] {DONE, CAP, LOAD, IDLE} state_t;
  state_t state, nxt_state;
  
  logic ld, StageII_capture_in;
  logic [BIT_TRIANGLE-1:0] triangle_id_reg;
  logic [BIT_THREAD-1:0] thread_id_reg;
  logic [31:0] sid_reg;
  logic [95:0] v0v1_reg, v0v2_reg, dir_reg, tvec_reg, pvec_reg, qvec_reg, norm_reg;
  
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= CAP;
    else 
      state <= nxt_state;
  end
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      triangle_id_reg <= '0;
      thread_id_reg <= '0;
      sid_reg <= '0;
      v0v1_reg <= '0;
      v0v2_reg <= '0;
      dir_reg <= '0;
      tvec_reg <= '0;
      pvec_reg <= '0;
      qvec_reg <= '0;
      norm_reg <= '0;
    end
    else if (ld) begin
      triangle_id_reg <= triangle_id_in;
      thread_id_reg <= thread_id_in;
      sid_reg <= sid_in;
      v0v1_reg <= v0v1_in;
      v0v2_reg <= v0v2_in;
      dir_reg <= dir_in;
      tvec_reg <= tvec_in;
      pvec_reg <= pvec_in;
      qvec_reg <= qvec_in;
      norm_reg <= norm_in;
    end
  end

  always_comb begin
    ld = 1'b0;
    StageII_capture_in = 1'b0;
    nxt_state = IDLE;
    case(state)
      LOAD: 
        begin
          StageII_capture_in = 1'b1;
          nxt_state = IDLE;
        end
      CAP: 
        begin
          if (StageII_done) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else
            nxt_state = CAP;
        end
      DONE: 
        begin
          if (StageIII_capture) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else 
            nxt_state = DONE;
        end
      default: 
        begin
          if (StageIII_capture && StageII_done) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else if (StageIII_capture)
            nxt_state = CAP;
          else if (StageII_done)
            nxt_state = DONE;
        end
    endcase
  end
  
  assign StageII_capture = StageII_capture_in;
  assign triangle_id_out = triangle_id_reg;
  assign thread_id_out = thread_id_reg;
  assign sid_out = sid_reg;
  assign v0v1_out = v0v1_reg;
  assign v0v2_out = v0v2_reg;
  assign dir_out = dir_reg;
  assign tvec_out = tvec_reg;
  assign pvec_out = pvec_reg;
  assign qvec_out = qvec_reg;
  assign norm_out = norm_reg;
  
endmodule