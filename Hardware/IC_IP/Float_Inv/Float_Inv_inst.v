	Float_Inv u0 (
		.clk    (_connected_to_clk_),    //   input,   width = 1,    clk.clk
		.areset (_connected_to_areset_), //   input,   width = 1, areset.reset
		.a      (_connected_to_a_),      //   input,  width = 32,      a.a
		.q      (_connected_to_q_)       //  output,  width = 32,      q.q
	);

