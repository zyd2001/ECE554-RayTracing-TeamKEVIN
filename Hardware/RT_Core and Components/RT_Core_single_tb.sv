module RT_Core_single_tb;
	
	reg [31:0] MRTI [0:4095];
	$readmemh("MRTI.mem", MRTI);
	
	
endmodule