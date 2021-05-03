	Fix_Add u0 (
		.clk    (_connected_to_clk_),    //   input,   width = 1,    clk.clk
		.rst    (_connected_to_rst_),    //   input,   width = 1,    rst.reset
		.en     (_connected_to_en_),     //   input,   width = 1,     en.en
		.a0     (_connected_to_a0_),     //   input,  width = 32,     a0.a0
		.a1     (_connected_to_a1_),     //   input,  width = 32,     a1.a1
		.result (_connected_to_result_)  //  output,  width = 33, result.result
	);

