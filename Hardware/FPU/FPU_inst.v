	FPU u0 (
		.clk       (_connected_to_clk_),       //   input,   width = 1, s1.clk
		.clk_en    (_connected_to_clk_en_),    //   input,   width = 1,   .clk_en
		.dataa     (_connected_to_dataa_),     //   input,  width = 32,   .dataa
		.datab     (_connected_to_datab_),     //   input,  width = 32,   .datab
		.n         (_connected_to_n_),         //   input,   width = 3,   .n
		.reset     (_connected_to_reset_),     //   input,   width = 1,   .reset
		.reset_req (_connected_to_reset_req_), //   input,   width = 1,   .reset_req
		.start     (_connected_to_start_),     //   input,   width = 1,   .start
		.done      (_connected_to_done_),      //  output,   width = 1,   .done
		.result    (_connected_to_result_)     //  output,  width = 32,   .result
	);

