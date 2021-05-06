// Quartus Prime Verilog Template
// Single port RAM with single read/write address 
import "DPI-C" function string getenv(input string env_name);
module single_port_ram_inst
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=6)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output reg [(DATA_WIDTH-1):0] q
);
	// int file;
	// string filename;
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	// always_comb foreach (ram_inverse[i]) ram[i] = ~ram_inverse[i];

	initial begin
		$readmemb({getenv("PWD"), "/RT_Core TB/Data_instruction_full.in"}, ram);
		// filename = {getenv("PWD"), "/RT_Core TB/Data_instruction.in"};
		// file = $fopen(filename, "rb");
		// $fread(ram, file);
   	end

	always @ (posedge clk)
	begin
		if (we)
			ram[addr] <= data;

		// Read returns OLD data.	To return
		// NEW data, use = (blocking write) rather than <= (non-blocking write)
		// in the write assignment.	 NOTE: NEW data requires extra bypass
		// logic around the RAM on Stratix10.
		q <= ram[addr];
	end
endmodule
