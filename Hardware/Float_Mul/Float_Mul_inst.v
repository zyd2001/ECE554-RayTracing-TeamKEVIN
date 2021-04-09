	Float_Mul u0 (
		.clk0   (_connected_to_clk0_),   //   input,   width = 1,   clk0.clk
		.ena    (_connected_to_ena_),    //   input,   width = 1,    ena.ena
		.clr0   (_connected_to_clr0_),   //   input,   width = 1,   clr0.reset
		.clr1   (_connected_to_clr1_),   //   input,   width = 1,   clr1.reset
		.result (_connected_to_result_), //  output,  width = 32, result.result
		.ay     (_connected_to_ay_),     //   input,  width = 32,     ay.ay
		.az     (_connected_to_az_)      //   input,  width = 32,     az.az
	);

