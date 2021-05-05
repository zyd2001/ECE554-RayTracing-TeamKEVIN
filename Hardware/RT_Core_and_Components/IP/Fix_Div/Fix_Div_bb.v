module Fix_Div (
		input  wire        clk,         //         clk.clk
		input  wire        rst,         //         rst.reset
		input  wire [0:0]  en,          //          en.en
		input  wire [31:0] numerator,   //   numerator.numerator
		input  wire [31:0] denominator, // denominator.denominator
		output wire [31:0] result       //      result.result
	);
endmodule

