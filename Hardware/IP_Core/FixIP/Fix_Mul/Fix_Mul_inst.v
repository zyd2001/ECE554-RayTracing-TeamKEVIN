	Fix_Mul u0 (
		.clk    (_connected_to_clk_),    //   input,   width = 1,    clk.clk
		.rst    (_connected_to_rst_),    //   input,   width = 1,    rst.reset
		.en     (_connected_to_en_),     //   input,   width = 1,     en.en
		.a      (_connected_to_a_),      //   input,  width = 32,      a.a
		.b      (_connected_to_b_),      //   input,  width = 32,      b.b
		.result (_connected_to_result_)  //  output,  width = 64, result.result
	);

