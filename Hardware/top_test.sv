`include "platform_if.vh"
`include "afu_json_info.vh"
module top_test(clk, rst, rx, tx);
    
    input clk, rst;
    input  t_if_ccip_Rx rx;
    output t_if_ccip_Tx tx;

    logic Converter_mode;
    logic Fix_start, Float_start, Converter_start;
    logic [2:0] Fix_mode, Float_mode;
    logic [31:0] Fix_a, Fix_b, Float_a, Float_b, Converter_in;

    logic Fix_done, Float_done, Converter_done;
    logic [31:0] Float_result, Converter_out;
    logic [63:0] Fix_result;
    
    logic Fix_done_reg, Float_done_reg, Converter_done_reg;
    logic [31:0] Float_result_reg, Converter_out_reg;
    logic [63:0] Fix_result_reg;
    
    logic done_signals;
    logic [63:0] buffer_reg, buffer_reg_in, FaC_reg;

    ALU iDUT(
    .clk(clk), .rst(rst),
    .Fix_mode(Fix_mode), .Fix_a(Fix_a), .Fix_b(Fix_b), .Fix_result(Fix_result), .Fix_start(Fix_start), .Fix_done(Fix_done),
    .Float_mode(Float_mode), .Float_a(Float_a), .Float_b(Float_b), .Float_result(Float_result), .Float_start(Float_start), .Float_done(Float_done),
    .Converter_mode(Converter_mode), .Converter_in(Converter_in), .Converter_out(Converter_out), .Converter_start(Converter_start), .Converter_done(Converter_done));
  
    always_ff@(posedge clk or posedge rst) begin
      if (rst) begin
        Converter_mode <= '0;
        Fix_start <= '0;
        Float_start <= '0;
        Converter_start <= '0;
        Fix_mode <= '0;
        Float_mode <= '0;
        Fix_a <= '0;
        Fix_b <= '0;
        Float_a <= '0;
        Float_b <= '0;
        Converter_in <= '0;
      end
      else begin
        Converter_mode <= rx.c0.data[0];
        Fix_start <= rx.c0.data[1];
        Float_start <= rx.c0.data[2];
        Converter_start <= rx.c0.data[3];
        Fix_mode <= rx.c0.data[6:4];
        Float_mode <= rx.c0.data[9:7];
        Fix_a <= [31:0];
        Fix_b <= [63:32];
        Float_a <= [95:64];
        Float_b <= [127:96];
        Converter_in <= [159:128];
      end
    end
    
    always_ff@(posedge clk or posedge rst) begin
      if (rst) begin
        Fix_done_reg <= '0;
        Float_done_reg <= '0;
        Converter_done_reg <= '0;
        Float_result_reg <= '0;
        Converter_out_reg <= '0;
        Fix_result_reg <= '0;
      end
      else begin
        Fix_done_reg <= Fix_done;
        Float_done_reg <= Float_done;
        Converter_done_reg <= Converter_done;
        Float_result_reg <= Float_result;
        Converter_out_reg <= Converter_out;
        Fix_result_reg <= Fix_result;
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
    
    assign done_signals = Fix_done_reg & Float_done_reg & Converter_done_reg;
    assign FaC_reg = {Float_result_reg, Converter_out_reg}
    assign buffer_reg_in = Fix_result_reg | FaC_reg | done_signals;
    
    assign tx.c2.data = buffer_reg;

endmodule