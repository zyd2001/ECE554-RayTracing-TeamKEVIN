//import rand_assembly.out;
import "DPI-C" function string getenv(input string env_name);
module RT_Core_single_tb;
	int file;
	string filename;
	logic [31:0] MRTI [0:4095];
	int i;

	initial begin
		
		filename = {getenv("PWD"), "/rand_assembly.out"};
		file = $fopen(filename, "rb");
		i = $fread(MRTI, file);
	
	end
endmodule