module ICMemManager(
  clk, rst,
  Core_ID, IC_Done,
  thread_id_IC_in, thread_id_Mem_in,
  thread_id_out,
  orig_in, orig_out,
  dir_in, dir_out,
  IntersectionPoint_in, IntersectionPoint_out,
  sid_in, sid_out,
  norm_in, norm_out,
  IC_Mem_Rdy);

  parameter NUM_THREAD = 32;
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  
  input clk, rst;
  input Core_ID, IC_Done;
  input [BIT_THREAD-1:0] thread_id_IC_in, thread_id_Mem_in;
  input [95:0] orig_in, dir_in, norm_in, IntersectionPoint_in;
  input [31:0] sid_in;

  output IC_Mem_Rdy;
  output [BIT_THREAD-1:0] thread_id_out;
  output [95:0] orig_out, dir_out, norm_out, IntersectionPoint_out;
  output [31:0] sid_out;

  typedef enum reg {BUSY, IDLE} state_t;
  state_t state, nxt_state;
  
  logic ld_in, ld_out, IC_Mem_Rdy_in, IC_Mem_Rdy_reg;
  logic [BIT_THREAD-1:0] thread_id_reg;
  logic [95:0] orig_reg, dir_reg, norm_reg, IntersectionPoint_reg;
  logic [31:0] sid_reg;
 
  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= IDLE;
    else 
      state <= nxt_state;
  end
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      IntersectionPoint_reg <= '0;
      sid_reg <= '0;
      orig_reg <= '0;
      dir_reg <= '0;
      norm_reg <= '0;
      thread_id_reg <= '0;
      IC_Mem_Rdy_reg <= '0;
    end
    else if (ld_in) begin
      orig_reg <= orig_in;
      dir_reg <= dir_in;
      thread_id_reg <= thread_id_Mem_in;
    end
    else if (ld_out) begin
      IntersectionPoint_reg <= IntersectionPoint_in;
      sid_reg <= sid_in;
      thread_id_reg <= thread_id_IC_in;
      IC_Mem_Rdy_reg <= IC_Mem_Rdy_in;
    end
  end

  always_comb begin
    IC_Mem_Rdy_in = 1'b0;
    ld_in = 1'b0;
    ld_out = 1'b0;
    nxt_state = IDLE;
    case(state)
      BUSY: 
        begin
          if (IC_Done) begin
            ld_out = 1'b1;
            IC_Mem_Rdy_in = 1'b1;
            nxt_state = IDLE;
          end
          else
            nxt_state = BUSY;
        end
      default: 
        begin
          if (Core_ID) begin
            ld_in = 1'b1;
            nxt_state = BUSY;
          end
        end
    endcase
  end  

  assign IC_Mem_Rdy = IC_Mem_Rdy_reg;
  assign thread_id_out = thread_id_reg;
  assign orig_out = orig_reg;
  assign dir_out = dir_reg;
  assign IntersectionPoint_out = IntersectionPoint_reg;
  assign norm_out = norm_reg;
  assign sid_out = sid_reg;

endmodule
