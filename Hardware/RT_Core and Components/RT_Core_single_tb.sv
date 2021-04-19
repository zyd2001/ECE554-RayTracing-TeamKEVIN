//import rand_assembly.out;
import "DPI-C" function string getenv(input string env_name);
module RT_Core_single_tb;
	int file;
	string filename;
	logic [31:0] MRTI [0:4095];
	logic [31:0] not_MRTI [0:4095];
	int status;

	initial begin
		
		filename = {getenv("PWD"), "/rand_assembly.out"};
		file = $fopen(filename, "rb");
		status = $fread(not_MRTI, file);
		
	
	end

	always_comb foreach (not_MRTI[i]) MRTI[i] = ~not_MRTI[i];
	
endmodule