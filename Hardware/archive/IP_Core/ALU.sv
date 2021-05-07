module ALU (
  clk, rst,
  Fix_mode, Fix_en, Fix_start, Fix_a, Fix_b, Fix_done, Fix_result,
  Float_mode, Float_en, Float_start, Float_a, Float_b, Float_done, Float_result, 
  Converter_mode, Converter_en, Converter_start, Converter_in, Converter_done, Converter_out,
  Sqrt_in, Sqrt_en, Sqrt_start, Sqrt_done, Sqrt_out);
  
  input clk, rst;
  input Fix_en, Float_en, Converter_en, Sqrt_en;
  input Fix_start, Float_start, Converter_start, Sqrt_start;
  input Converter_mode;
  input [1:0] Fix_mode, Float_mode;
  input [31:0] Fix_a, Fix_b, Float_a, Float_b, Converter_in, Sqrt_in;
  
  output Fix_done, Float_done, Converter_done, Sqrt_done;
  output [31:0] Float_result, Converter_out, Sqrt_out;
  output [63:0] Fix_result;

  FixPU Fix(
    .clk(clk), .rst(rst), .en(Fix_en), .start(Fix_start),
    .mode(Fix_mode),
    .a(Fix_a),
    .b(Fix_b),
    .done(Fix_done),
    .result(Fix_result));
  
  FloatPU Float(
    .clk(clk), .rst(rst), .en(Float_en), .start(Float_start),
    .mode(Float_mode),
    .a(Float_a),
    .b(Float_b),
    .done(Float_done),
    .result(Float_result));

  Converter Convert(
    .clk(clk), .rst(rst), .en(Converter_en), .start(Converter_start),
    .mode(Converter_mode),
    .data_in(Converter_in),
    .done(Converter_done),
    .data_out(Converter_out));
  
  Sqrter Sqrt(
    .clk(clk), .rst(rst), .en(Sqrt_en), .start(Sqrt_start),
    .in(Sqrt_in),
    .done(Sqrt_done),
    .out(Sqrt_out));
  
endmodule