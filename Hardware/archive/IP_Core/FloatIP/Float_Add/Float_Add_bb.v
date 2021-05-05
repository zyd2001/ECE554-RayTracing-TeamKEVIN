module Float_Add (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [0:0]  en,     //     en.en
		input  wire [31:0] a,      //      a.a
		input  wire [31:0] b,      //      b.b
		output wire [31:0] q,      //      q.q
		input  wire [0:0]  opSel   //  opSel.opSel
	);
endmodule

