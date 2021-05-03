	Fix_Sqrt u0 (
		.clk     (_connected_to_clk_),     //   input,   width = 1,     clk.clk
		.rst     (_connected_to_rst_),     //   input,   width = 1,     rst.reset
		.en      (_connected_to_en_),      //   input,   width = 1,      en.en
		.radical (_connected_to_radical_), //   input,  width = 32, radical.radical
		.result  (_connected_to_result_)   //  output,  width = 32,  result.result
	);

