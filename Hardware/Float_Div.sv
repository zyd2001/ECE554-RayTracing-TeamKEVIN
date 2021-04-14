module Float_Div (
		input  wire        clk, 
		input  wire        en,  
		input  wire        rst,   
		output wire [31:0] result, 
		input  wire [31:0] a,    
		input  wire [31:0] b      
	);
  
  wire [7:0] exponent;
  wire [31:0] temp1, temp2, temp3, temp4, temp5, temp6, temp7, x0, x1, x2, x3, reciprocal;
  
  /*----Initial value----*/
  Float_Mul Multiplier1 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (temp1), //  output,  width = 32, result.result
		.ay     ({{1'b0,8'd126,b[22:0]}}),     //   input,  width = 32,     ay.ay
		.az     (32'h3ff0f0f1)      //   input,  width = 32,     az.az
	);
  
  Float_Add Adder1 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (x0), //  output,  width = 32, result.result
		.ax     (32'h4034b4b5),     //   input,  width = 32,     ax.ax
		.ay     ({1'b1,temp1[30:0]})      //   input,  width = 32,     ay.ay
	);

  /*----First Iteration----*/
  Float_Mul Multiplier2 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (temp2), //  output,  width = 32, result.result
		.ay     ({{1'b0,8'd126,b[22:0]}}),     //   input,  width = 32,     ay.ay
		.az     (x0)      //   input,  width = 32,     az.az
	);
  
  Float_Add Adder2 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (temp3), //  output,  width = 32, result.result
		.ax     (32'h40000000),     //   input,  width = 32,     ax.ax
		.ay     ({!temp2[31],temp2[30:0]})      //   input,  width = 32,     ay.ay
	);
  
  Float_Mul Multiplier3 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (x1), //  output,  width = 32, result.result
		.ay     (x0),     //   input,  width = 32,     ay.ay
		.az     (temp3)      //   input,  width = 32,     az.az
	);

  /*----Second Iteration----*/
  Float_Mul Multiplier4 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (temp4), //  output,  width = 32, result.result
		.ay     ({1'b0,8'd126,b[22:0]}),     //   input,  width = 32,     ay.ay
		.az     (x1)      //   input,  width = 32,     az.az
	);
  
  Float_Add Adder3 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (temp5), //  output,  width = 32, result.result
		.ax     (32'h40000000),     //   input,  width = 32,     ax.ax
		.ay     ({!temp4[31],temp4[30:0]})      //   input,  width = 32,     ay.ay
	);
  
  Float_Mul Multiplier5 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (x2), //  output,  width = 32, result.result
		.ay     (x1),     //   input,  width = 32,     ay.ay
		.az     (temp5)      //   input,  width = 32,     az.az
	);

  /*----Third Iteration----*/
  Float_Mul Multiplier6 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (temp6), //  output,  width = 32, result.result
		.ay     ({1'b0,8'd126,b[22:0]}),     //   input,  width = 32,     ay.ay
		.az     (x2)      //   input,  width = 32,     az.az
	);
  
  Float_Add Adder4 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (temp7), //  output,  width = 32, result.result
		.ax     (32'h40000000),     //   input,  width = 32,     ax.ax
		.ay     ({!temp6[31],temp6[30:0]})      //   input,  width = 32,     ay.ay
	);
  
  Float_Mul Multiplier7 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (x3), //  output,  width = 32, result.result
		.ay     (x2),     //   input,  width = 32,     ay.ay
		.az     (temp7)      //   input,  width = 32,     az.az
	);

  /*----Reciprocal : 1/B----*/
  assign exponent = x3[30:23]+8'd126-b[30:23];
  assign reciprocal = {b[31],exponent,x3[22:0]};

  /*----Multiplication A*1/B----*/
  Float_Mul Multiplier8 (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (en),    //   input,   width = 1,    ena.ena
		.clr0   (rst),   //   input,   width = 1,   clr0.reset
		.clr1   (rst),   //   input,   width = 1,   clr1.reset
		.result (result), //  output,  width = 32, result.result
		.ay     (a),     //   input,  width = 32,     ay.ay
		.az     (reciprocal)      //   input,  width = 32,     az.az
	);
  
endmodule