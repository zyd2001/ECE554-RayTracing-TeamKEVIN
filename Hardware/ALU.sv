module ALU (
  clk, rst,
  Fix_mode, Fix_a, Fix_b, Fix_result, Fix_start, Fix_done,
  Float_mode, Float_a, Float_b, Float_result, Float_start, Float_done,
  Converter_mode, Converter_in, Converter_out, Converter_start, Converter_done);
  
  input clk, rst;
  input Converter_mode;
  input Fix_start, Float_start, Converter_start;
  input [2:0] Fix_mode, Float_mode;
  input [31:0] Fix_a, Fix_b, Float_a, Float_b, Converter_in;
  
  output Fix_done, Float_done, Converter_done;
  output [31:0] Float_result, Converter_out;
  output [63:0] Fix_result;
  
  logic [31:0] Float_check, Float_check_in, Converter_check, Converter_check_in;
  logic [63:0] Fix_check, Fix_check_in;
  
  logic [5:0] Fix_counter, Fix_counter_in, Float_counter, Float_counter_in, Converter_counter, Converter_counter_in;
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      Fix_check <= '0;
      Float_check <= '0;
      Converter_check <= '0;
      Fix_counter <= '0;
      Float_counter <= '0;
      Converter_counter <= '0;
    end
    else begin
      Fix_check <= Fix_check_in ;    
      Float_check <= Float_check_in;
      Converter_check <= Converter_check_in;
      Fix_counter <= Fix_counter_in;
      Float_counter <= Float_counter_in;
      Converter_counter <= Converter_counter_in;
    end
  end
    
  assign Fix_check_in = Fix_start ? Fix_result : Fix_check;
  assign Float_check_in = Float_start ? Float_result : Fix_check;
  assign Converter_check_in = Converter_start ? Converter_out : Converter_check;
  
  assign Fix_counter_in = ((Fix_counter == 6'd50) || (Fix_check !== Fix_result)) ? 5'h0 : (Fix_counter + 1);
  assign Float_counter_in = ((Float_counter == 6'd50) || (Float_check !== Float_result)) ? 5'h0 : (Float_counter + 1);
  assign Converter_counter_in = ((Converter_counter == 6'd50) || (Converter_check !== Converter_out)) ? 5'h0 : (Converter_counter + 1);
  
  assign Fix_done = ((Fix_counter == 6'd50) || (Fix_check !== Fix_result)) ? 1'b1 : 1'b0;
  assign Float_done = ((Float_counter == 6'd50) || (Float_check !== Float_result)) ? 1'b1 : 1'b0;
  assign Converter_done = ((Converter_counter == 6'd50) || (Converter_check !== Converter_out)) ? 1'b1 : 1'b0;
  
  FixPU (
    .clk(clk), .rst(Fix_rst),
    .mode(Fix_mode),
    .a(Fix_a),
    .b(Fix_b),
    .result(Fix_result));
  
  FloatPU (
    .clk(clk), .rst(Float_rst),
    .mode(Float_mode),
    .a(Float_a),
    .b(Float_b),
    .result(Float_result));

  Converter (
    .clk(clk), .rst(Converter_rst),
    .mode(Converter_mode),
    .data_in(Converter_in),
    .data_out(Converter_out));
  
endmodule