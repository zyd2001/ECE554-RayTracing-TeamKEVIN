//import rand_assembly.out;
module RT_Core_single_tb;
	
	initial begin
		reg [31:0] MRTI [0:4095];
		$readmemb("rand_assembly.out", MRTI);
	
	end
endmodule