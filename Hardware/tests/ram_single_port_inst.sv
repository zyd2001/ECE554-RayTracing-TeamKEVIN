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
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	initial begin
		// When using RT_Core_Single_tb, Data_instruction_full will not work
		$readmemb({getenv("PWD"), "/tests/RT_Core_testbench_input/Data_instruction_branch.in"}, ram);
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
