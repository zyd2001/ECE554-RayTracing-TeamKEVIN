module Native_Fixed_Add (
		input  wire [17:0] ay,      //      ay.ay
		input  wire [17:0] by,      //      by.by
		input  wire [17:0] ax,      //      ax.ax
		input  wire [17:0] bx,      //      bx.bx
		output wire [36:0] resulta, // resulta.resulta
		input  wire        clk0,    //    clk0.clk
		input  wire        clk1,    //    clk1.clk
		input  wire        clk2,    //    clk2.clk
		input  wire [2:0]  ena      //     ena.ena
	);
endmodule

