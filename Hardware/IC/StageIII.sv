module StageIII(
  clk, rst, StageIII_done, Controller_capture, StageIII_capture,
  det_in, det_out,
  upre_in, upre_out,
  vpre_in, vpre_out,
  tpre_in, tpre_out,
  thread_id_in, thread_id_out,
  triangle_id_in, triangle_id_out,
  sid_in, sid_out
  );
  
  parameter NUM_TRIANGLE = 512;
  parameter NUM_THREAD = 32;
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  
  input clk, rst, Controller_capture, StageIII_done;
  input [BIT_TRIANGLE-1:0] triangle_id_in;
  input [BIT_THREAD-1:0] thread_id_in;
  input [31:0] sid_in;
  input [31:0] det_in, upre_in, vpre_in, tpre_in;
  
  output StageIII_capture;
  output [BIT_TRIANGLE-1:0] triangle_id_out;
  output [BIT_THREAD-1:0] thread_id_out;
  output [31:0] sid_out;
  output [31:0] det_out, upre_out, vpre_out, tpre_out;
  
  typedef enum reg [1:0] {DONE, CAP, LOAD, IDLE} state_t;
  state_t state, nxt_state;
  
  logic ld, StageIII_capture_in;
  logic [BIT_TRIANGLE-1:0] triangle_id_reg;
  logic [BIT_THREAD-1:0] thread_id_reg;
  logic [31:0] sid_reg;
  logic [31:0] det_reg, upre_reg, vpre_reg, tpre_reg;
  
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= IDLE;
    else 
      state <= nxt_state;
  end
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      triangle_id_reg <= '0;
      thread_id_reg <= '0;
      sid_reg <= '0;
      det_reg <= '0;
      upre_reg <= '0;
      vpre_reg <= '0;
      tpre_reg <= '0;
    end
    else if (ld) begin
      triangle_id_reg <= triangle_id_in;
      thread_id_reg <= thread_id_in;
      sid_reg <= sid_in;
      det_reg <= det_in;
      upre_reg <= upre_in;
      vpre_reg <= vpre_in;
      tpre_reg <= tpre_in;
    end
  end

  always_comb begin
    ld = 1'b0;
    StageIII_capture_in = 1'b0;
    nxt_state = IDLE;
    case(state)
      LOAD: 
        begin
          StageIII_capture_in = 1'b1;
          nxt_state = IDLE;
        end
      CAP: 
        begin
          if (StageIII_done) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
        end
      DONE: 
        begin
          if (Controller_capture) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
        end
      default: 
        begin
          if (Controller_capture && StageIII_done) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else if (Controller_capture)
            nxt_state = CAP;
          else if (StageIII_done)
            nxt_state = DONE;
        end
    endcase
  end
  
  assign StageIII_capture = StageIII_capture_in;
  assign triangle_id_out = triangle_id_reg;
  assign thread_id_out = thread_id_reg;
  assign sid_out = sid_reg;
  assign det_out = det_reg;
  assign upre_out = upre_reg;
  assign vpre_out = vpre_reg;
  assign tpre_out = tpre_reg;
  
endmodule