module StageIII(
  clk, rst, StageIII_done, Controller_capture, StageIII_capture,
  det_in, det_out,
  upre_in, upre_out,
  vpre_in, vpre_out,
  tpre_in, tpre_out,
  norm_in, norm_out,
  sid_in, sid_out
  );
  
  input clk, rst, Controller_capture, StageIII_done;
  input [31:0] sid_in;
  input [31:0] det_in, upre_in, vpre_in, tpre_in;
  input [95:0] norm_in;
  
  output StageIII_capture;
  output [31:0] sid_out;
  output [31:0] det_out, upre_out, vpre_out, tpre_out;
  output [95:0] norm_out;
  
  typedef enum reg [1:0] {DONE, CAP, LOAD, IDLE} state_t;
  state_t state, nxt_state;
  
  logic ld, StageIII_capture_in;
  logic [31:0] sid_reg;
  logic [31:0] det_reg, upre_reg, vpre_reg, tpre_reg;
  logic [95:0] norm_reg;
  
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= CAP;
    else 
      state <= nxt_state;
  end
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      sid_reg <= '0;
      det_reg <= '0;
      upre_reg <= '0;
      vpre_reg <= '0;
      tpre_reg <= '0;
      norm_reg <= '0;
    end
    else if (ld) begin
      sid_reg <= sid_in;
      det_reg <= det_in;
      upre_reg <= upre_in;
      vpre_reg <= vpre_in;
      tpre_reg <= tpre_in;
      norm_reg <= norm_in;
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
          else
            nxt_state = CAP;
        end
      DONE: 
        begin
          if (Controller_capture) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else 
            nxt_state = DONE;
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
  assign sid_out = sid_reg;
  assign det_out = det_reg;
  assign upre_out = upre_reg;
  assign vpre_out = vpre_reg;
  assign tpre_out = tpre_reg;
  assign norm_out = norm_reg;
  
endmodule