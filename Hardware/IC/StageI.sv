module StageI(
  clk, rst, StageI_done, StageII_capture, StageI_capture,
  v0v1_in, v0v1_out,
  v0v2_in, v0v2_out,
  dir_in, dir_out,
  tvec_in, tvec_out,
  sid_in, sid_out
  );

  input clk, rst, StageII_capture, StageI_done;
  input [31:0] sid_in;
  input [95:0] v0v1_in, v0v2_in, dir_in, tvec_in;
  
  output StageI_capture;
  output [31:0] sid_out;
  output [95:0] v0v1_out, v0v2_out, dir_out, tvec_out;
  
  typedef enum reg [1:0] {DONE, CAP, LOAD, IDLE} state_t;
  state_t state, nxt_state;
  
  logic ld, StageI_capture_in;
  logic [31:0] sid_reg;
  logic [95:0] v0v1_reg, v0v2_reg, dir_reg, tvec_reg;
  
  
  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= CAP;
    else 
      state <= nxt_state;
  end
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      sid_reg <= '0;
      v0v1_reg <= '0;
      v0v2_reg <= '0;
      dir_reg <= '0;
      tvec_reg <= '0;
    end
    else if (ld) begin
      sid_reg <= sid_in;
      v0v1_reg <= v0v1_in;
      v0v2_reg <= v0v2_in;
      dir_reg <= dir_in;
      tvec_reg <= tvec_in;
    end
  end

  always_comb begin
    ld = 1'b0;
    StageI_capture_in = 1'b0;
    nxt_state = IDLE;
    case(state)
      LOAD: 
        begin
          StageI_capture_in = 1'b1;
          nxt_state = IDLE;
        end
      CAP: 
        begin
          if (StageI_done) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else
            nxt_state = CAP;
        end
      DONE: 
        begin
          if (StageII_capture) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end 
          else 
            nxt_state = DONE;
        end
      default: 
        begin
          if (StageII_capture && StageI_done) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else if (StageII_capture)
            nxt_state = CAP;
          else if (StageI_done)
            nxt_state = DONE;
        end
    endcase
  end
  
  assign StageI_capture = StageI_capture_in;
  assign sid_out = sid_reg;
  assign v0v1_out = v0v1_reg;
  assign v0v2_out = v0v2_reg;
  assign dir_out = dir_reg;
  assign tvec_out = tvec_reg;
  
endmodule