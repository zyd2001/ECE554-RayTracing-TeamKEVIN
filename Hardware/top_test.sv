`include "platform_if.vh"
`include "afu_json_info.vh"
module top_test(clk, rst, rx, tx);
    
    input clk, rst;
    input  t_if_ccip_Rx rx;
    output t_if_ccip_Tx tx;

    parameter NUM_THREAD = 32;
    parameter NUM_TRIANGLE = 512;
    localparam BIT_THREAD = $clog2(NUM_THREAD);
    localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);

    // IC Mem
    logic Core_ID;
    logic [BIT_THREAD-1:0] thread_id_in;
    logic [95:0] orig, dir;
    
    logic IC_Mem_Rdy;
    logic [BIT_THREAD-1:0] thread_id_out;
    logic [31:0] sid_out;
    logic [95:0] norm, IntersectionPoint;
    // Tri Mem
    logic Mem_Rdy, Mem_NotValid;
    logic [95:0] v1, v2, v0;
    logic [31:0] sid_in;
    
    logic Mem_En;
    logic unsigned [BIT_TRIANGLE-1:0] triangle_id;

    // Regs
    logic IC_Mem_Rdy_reg;
    logic [BIT_THREAD-1:0] thread_id_out_reg;
    logic [31:0] sid_out_reg;
    logic [95:0] norm_reg, IntersectionPoint_reg;
    
    logic Mem_En_reg;
    logic unsigned [BIT_TRIANGLE-1:0] triangle_id_reg;
    
    logic [63:0] buffer_reg, done_signals_buff, result_buff, norm_buff, inter_buff;
    
    IC_v3 iDUT(
      .clk(clk), .rst(rst),
      .Core_ID(Core_ID), .thread_id_in(thread_id_in), .thread_id_out(thread_id_out), .IntersectionPoint(IntersectionPoint),
      .sid_in(sid_in), .sid_out(sid_out), .dir(dir), .orig(orig), .norm(norm), .IC_Mem_Rdy(IC_Mem_Rdy),
      .Mem_Rdy(Mem_Rdy), .v1(v1), .v2(v2), .v0(v0), .Mem_NotValid(Mem_NotValid), .triangle_id(triangle_id), .Mem_En(Mem_En)
    );
  
    always_ff@(posedge clk or posedge rst) begin
      if (rst) begin
        Core_ID <= '0;
        thread_id_in <= '0;
        orig <= '0;
        dir <= '0;
        Mem_Rdy <= '0;
        Mem_NotValid <= '0;
        v1 <= '0;
        v2 <= '0;
        v0 <= '0;
        sid_in <= '0;
      end
      else begin
        Core_ID <= rx.c0.data[0];
        thread_id_in <= rx.c0.data[31:0];
        orig <= rx.c0.data[95:0];
        dir <= rx.c0.data[191:96];
        Mem_Rdy <= rx.c0.data[1];
        Mem_NotValid <= rx.c0.data[2];
        v1 <= rx.c0.data[31:0];
        v2 <= rx.c0.data[63:32];
        v0 <= rx.c0.data[95:64];
        sid_in <= rx.c0.data[127:96];
      end
    end
    
    always_ff@(posedge clk or posedge rst) begin
      if (rst) begin
        IC_Mem_Rdy_reg <= '0;
        thread_id_out_reg <= '0;
        sid_out_reg <= '0;
        norm_reg <= '0;
        IntersectionPoint_reg <= '0;
        Mem_En_reg <= '0;
        triangle_id_reg <= '0;
      end
      else begin
        IC_Mem_Rdy_reg <= IC_Mem_Rdy;
        thread_id_out_reg <= thread_id_out;
        sid_out_reg <= sid_out;
        norm_reg <= norm;
        IntersectionPoint_reg <= IntersectionPoint;
        Mem_En_reg <= Mem_En;
        triangle_id_reg <= triangle_id;
      end
    end
    
    always_ff@(posedge clk or posedge rst) begin
      if (rst) begin
        buffer_reg <= '0;
      end
      else begin
        buffer_reg <= buffer_reg_in;
      end
    end
    
    assign done_signals_buff = IC_Mem_Rdy_reg & Mem_En_reg;
    assign result_buff = {18'h0, sid_out_reg, thread_id_out_reg, triangle_id_reg};
    assign norm_buff = norm_reg[63:0] | norm_reg[95:32];
    assign inter_buff = IntersectionPoint_reg[63:0] | IntersectionPoint_reg[95:32];
    
    assign buffer_reg_in = done_signals_buff & result_buff & norm_buff & inter_buff;
    
    
    assign tx.c2.data = buffer_reg;

endmodule
