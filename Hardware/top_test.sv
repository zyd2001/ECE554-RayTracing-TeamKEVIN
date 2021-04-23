`include "platform_if.vh"
`include "afu_json_info.vh"
module top_test(clk, rst, rx, tx);
    
    input clk, rst;
    input  t_if_ccip_Rx rx;
    output t_if_ccip_Tx tx;

    logic Converter_mode, Fix_en, Float_en, Converter_en, Sqrt_en;
    logic [1:0] Fix_mode, Float_mode;
    logic [31:0] Fix_a, Fix_b, Float_a, Float_b, Converter_in, Sqrt_in;

    logic Fix_done, Float_done, Converter_done, Sqrt_done;
    logic [31:0] Float_result, Converter_out, Sqrt_out;
    logic [63:0] Fix_result;
    
    logic Fix_done_reg, Float_done_reg, Converter_done_reg, Sqrt_done_reg;
    logic [31:0] Float_result_reg, Converter_out_reg, Sqrt_out_reg;
    logic [63:0] Fix_result_reg;
    
    logic done_signals;
    logic [63:0] buffer_reg, buffer_reg_in, FaC1_reg, FaC2_reg;

    ALU iDUT(
      .clk(clk), .rst(rst),
      .Fix_mode(Fix_mode), .Fix_en(Fix_en), .Fix_a(Fix_a), .Fix_b(Fix_b), .Fix_done(Fix_done), .Fix_result(Fix_result), 
      .Float_mode(Float_mode), .Float_en(Float_en), .Float_a(Float_a), .Float_b(Float_b), .Float_done(Float_done), .Float_result(Float_result),
      .Converter_mode(Converter_mode), .Converter_en(Converter_en), .Converter_in(Converter_in), .Converter_done(Converter_done), .Converter_out(Converter_out),
      .Sqrt_in(Sqrt_in), .Sqrt_en(Sqrt_en), .Sqrt_done(Sqrt_done), .Sqrt_out(Sqrt_out));
  
    always_ff@(posedge clk or posedge rst) begin
      if (rst) begin
        Converter_mode <= '0;
        Fix_en <= '0;
        Float_en <= '0;
        Converter_en <= '0;
        Sqrt_en <= '0;
        Fix_mode <= '0;
        Float_mode <= '0;
        Fix_a <= '0;
        Fix_b <= '0;
        Float_a <= '0;
        Float_b <= '0;
        Converter_in <= '0;
        Sqrt_in <= '0;
      end
      else begin
        Converter_mode <= rx.c0.data[0];
        Fix_en <= rx.c0.data[1];
        Float_en <= rx.c0.data[2];
        Converter_en <= rx.c0.data[3];
        Sqrt_en <= rx.c0.data[4];
        Fix_mode <= rx.c0.data[6:5];
        Float_mode <= rx.c0.data[8:7];
        Fix_a <= rx.c0.data[31:0];
        Fix_b <= rx.c0.data[63:32];
        Float_a <= rx.c0.data[95:64];
        Float_b <= rx.c0.data[127:96];
        Converter_in <= rx.c0.data[159:128];
        Sqrt_in <= rx.c0.data[191:160];
      end
    end
    
    always_ff@(posedge clk or posedge rst) begin
      if (rst) begin
        Fix_done_reg <= '0;
        Float_done_reg <= '0;
        Converter_done_reg <= '0;
        Sqrt_done_reg <= '0;
        Float_result_reg <= '0;
        Converter_out_reg <= '0;
        Fix_result_reg <= '0;
        Sqrt_out_reg <= '0;
      end
      else begin
        Fix_done_reg <= Fix_done;
        Float_done_reg <= Float_done;
        Converter_done_reg <= Converter_done;
        Sqrt_done_reg <= Sqrt_done;
        Float_result_reg <= Float_result;
        Converter_out_reg <= Converter_out;
        Fix_result_reg <= Fix_result;
        Sqrt_out_reg <= Sqrt_out;
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
    
    assign done_signals = Fix_done_reg & Float_done_reg & Converter_done_reg & Sqrt_done_reg;
    assign FaC1_reg = {Float_result_reg, Sqrt_out_reg};
    assign FaC2_reg = {Sqrt_out_reg, Converter_out_reg};
    assign buffer_reg_in = Fix_result_reg | FaC1_reg | FaC2_reg | done_signals;
    
    assign tx.c2.data = buffer_reg;

endmodule
