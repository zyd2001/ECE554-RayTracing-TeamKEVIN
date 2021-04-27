module TriManager(
  clk, rst,
  Mem_Rdy, Fetch, clear,
  v1_in, v1_out,
  v2_in, v2_out,
  v0_in, v0_out,
  sid_in, sid_out,
  Mem_NotValid, Mem_En,
  triangle_id,
  Tri_Rdy);

  parameter NUM_TRIANGLE = 512;
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
  
  input clk, rst;
  input Mem_Rdy, Fetch, clear;
  input [95:0] v1_in, v2_in, v0_in;
  input [31:0] sid_in;
  input Mem_NotValid;

  output Mem_En, Tri_Rdy;
  output [95:0] v1_out, v2_out, v0_out;
  output [31:0] sid_out;
  output unsigned [BIT_TRIANGLE-1:0] triangle_id;

  typedef enum reg [1:0] {READY, CAP, LOAD, IDLE} state_t;
  state_t state, nxt_state;
  
  logic ld, bypass, ldBuff, Tri_Rdy_in, Mem_En_in;
  logic [95:0] v1_reg, v2_reg, v0_reg;
  logic [31:0] sid_reg;
  logic [95:0] v1_buff, v2_buff, v0_buff;
  logic [31:0] sid_buff;
  logic unsigned [BIT_TRIANGLE-1:0] triangle_id_reg;

  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      state <= IDLE;
    else 
      state <= nxt_state;
  end
  
  always@(posedge clk or posedge rst) begin
    if (rst|clear) begin
      v1_reg <= '0;
      v2_reg <= '0;
      v0_reg <= '0;
      sid_reg <= '0;
      v1_buff <= '0;
      v2_buff <= '0;
      v0_buff <= '0;
      sid_buff <= '0;
      triangle_id_reg <= '0;
    end
    else if (bypass) begin
      v1_reg <= v1_in;
      v2_reg <= v2_in;
      v0_reg <= v0_in;
      sid_reg <= sid_in;
      triangle_id_reg <= triangle_id_reg + 1'b1;
    end
    else if (ld) begin
      v1_reg <= v1_buff;
      v2_reg <= v2_buff;
      v0_reg <= v0_buff;
      sid_reg <= sid_buff;
    end
    else if (ldBuff) begin
      v1_buff <= v1_in;
      v2_buff <= v2_in;
      v0_buff <= v0_in;
      sid_buff <= sid_in;
      triangle_id_reg <= triangle_id_reg + 1'b1;
    end
  end

  always_comb begin
    Mem_En_in = 1'b0;
    ld = 1'b0;
    bypass = 1'b0;
    ldBuff = 1'b0;
    Tri_Rdy_in = 1'b0;
    nxt_state = IDLE;
    case(state)
      LOAD: 
        begin
          Tri_Rdy_in = 1'b1;
          nxt_state = IDLE;
        end
      CAP: 
        begin
          if (Mem_Rdy) begin
            bypass = 1'b1;
            nxt_state = LOAD;
          end
          else begin
            nxt_state = CAP;
            if (!Mem_NotValid)
              Mem_En_in = 1'b1;  
          end
        end
      READY: 
        begin
          if (Fetch) begin
            ld = 1'b1;
            nxt_state = LOAD;
          end
          else 
            nxt_state = READY;
        end
      default: 
        begin
          if (Fetch && Mem_Rdy) begin
            bypass = 1'b1;
            nxt_state = LOAD;
          end
          else if (Fetch)
            nxt_state = CAP;
          else if (Mem_Rdy) begin
            ldBuff = 1'b1;
            nxt_state = READY;
          end
        end
    endcase
  end  

  assign Mem_En = Mem_En_in;
  assign Tri_Rdy = Tri_Rdy_in;
  assign triangle_id = triangle_id_reg;
  assign v1_out = v1_reg;
  assign v2_out = v2_reg;
  assign v0_out = v2_reg;
  assign sid_out = sid_reg;

endmodule
