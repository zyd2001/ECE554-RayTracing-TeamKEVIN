//import rand_assembly.out;
import "DPI-C" function string getenv(input string env_name);
module RT_Core_single_tb;
	// Instruction Memory values
	int file;
	string filename;
	logic [31:0] MRTI [0:4095];
	logic [31:0] not_MRTI [0:4095];
	int status;

	// Output signal Trace Log
	int signaltracefile;
	string signaltracefilename;

	// Reg/Mem Trace log
	int rmtracefile;
	string rmtracefilename;
	
	// RT core inputs
	logic clk, rst_n;
	logic Kernel_mode;
	logic [31:0] MRTI_data_rd;
	logic [31:0] scalar_read1;
	logic [31:0] scalar_read2;
	logic [127:0] vector_read1;
	logic [127:0] vector_read2;

	// RT core outputs
	logic [31:0] MRTI_addr_rd;
	logic End_program, Context_switch, scalar_wen, vector_wen;
	logic  [4:0] scalar_wb_address, scalar_read_address1, scalar_read_address2;
    logic  [3:0] vector_wb_address, vector_read_address1, vector_read_address2;
    logic  [31:0] scalar_wb_data;
    logic  [127:0] vector_wb_data;

	// set high after reset to start trace
	logic started;

	// for monitoring regs/memory
	genvar g;

	int clk_cnt;

	assign MRTI_data_rd = MRTI[MRTI_addr_rd];


	// Reading the binary file contains 0's for 1's and vice versa
	// Flip all bits to fix this
	always_comb foreach (not_MRTI[i]) MRTI[i] = ~not_MRTI[i];

	// RT core instantiation, comment out if
	// RT core not ready
	//RT_core_single rt_core(.clk(clk), .rst_n(rst_n),
	//		.Kernel_mode(Kernel_mode), .End_program(End_program), .Context_switch(Context_switch),
	//		.scalar_wen(scalar_wen), .scalar_wb_address(scalar_wb_address), .scalar_wb_data(scalar_wb_data),
	//		.vector_wen(vector_wen), .vector_wb_address(vector_wb_address), .vector_wb_data(vector_wb_data),
	//		.scalar_read_address1(scalar_read_address1), .scalar_read_address2(scalar_read_address2), 
	//		.vector_read_address1(vector_read_address1), .vector_read_address2(vector_read_address2),
	//		.scalar_read1(scalar_read1), .scalar_read2(scalar_read2),
	//		.vector_read1(vector_read1), .vector_read2(vector_read2),
	//		.MRTI_addr_rd(MRTI_addr_rd), .MRTI_data_rd(MRTI_data_rd)

	//	);

	initial begin
		// Initialize MRTI
		// change the filename to what binary file 
		// you want to use
		filename = {getenv("PWD"), "/rand_assembly.out"};
		file = $fopen(filename, "rb");
		status = $fread(not_MRTI, file);

		// Initialize Out Signal Trace 
		signaltracefilename = {getenv("PWD"), "/sigtrace.out"};
		signaltracefile = $fopen(signaltracefilename, "w+");

		// Initialize Reg/Mem Trace
		rmtracefilename = {getenv("PWD"), "/rmtrace.out"};
		rmtracefile = $fopen(rmtracefilename, "w+");		


		clk = 0;
		clk_cnt = 0;
		rst_n = 0;
		started = 0;
		

		@(posedge clk)
		rst_n = 1;
		@(posedge clk)
		started = 1;

		// test trace log print
		// comment out unless testing file print
		scalar_wen = 0;
		MRTI_addr_rd = 200;
		not_MRTI[0] = 5;
		not_MRTI[1] = 1;
		@(posedge clk)
		scalar_wen = 1;
		MRTI_addr_rd = 400;
		not_MRTI[0] = 6;
		not_MRTI[2] = 2;
		@(posedge clk)
		End_program = 1;

		

	end

	
	// Reg file tracing
	// Right now, monitors changing of the instruction memory (to make sure tb works)
	// When testing the RT core, change MRTI to the registers of the 
	// RT reg file
	// Should be rt_core.scalar_ram and rt.core.vector_ram
	generate
		for(g = 0; g < 4096; g++) begin
			always@(MRTI[g]) begin
				if(started == 1) begin
					$fwrite(rmtracefile, "%d Reg %h: %h\n", clk_cnt,g, MRTI[g]);
				end
			end
		end

	endgenerate
	

	// Trace log sensitivities for change of outputs from RT core
	always@(End_program) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "End_program <= %h\n", End_program);
			
			// End test when thread is finished?
			$fclose(signaltracefilename);
			$fclose(filename);
			$stop; 
		end
	end

	always@(Context_switch) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "Context_switch <= %h\n", Context_switch);
		end
	end

	always@(scalar_wen) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "scalar_wen <= %h\n", scalar_wen);
		end
	end

	always@(vector_wen) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "vector_wen <= %h\n", vector_wen);
		end
	end

	always@(scalar_wb_address) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "scalar_wb_address <= %h\n", scalar_wb_address);
		end
	end

	always@(scalar_read_address1) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "scalar_read_address1 <= %h\n", scalar_read_address1);
		end
	end

	always@(scalar_read_address2) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "scalar_read_address2 <= %h\n", scalar_read_address2);
		end
	end


	always@(vector_read_address1) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "vector_read_address1 <= %h\n", vector_read_address1);
		end
	end

	always@(vector_read_address2) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "vector_read_address2 <= %h\n", vector_read_address2);
		end
	end

	always@(vector_wb_address) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "vector_wb_address <= %h\n", vector_wb_address);
		end
	end

	always@(scalar_wb_data) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "scalar_wb_data <= %h\n", scalar_wb_data);
		end
	end

	always@(vector_wb_data) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "vector_wb_data <= %h\n", vector_wb_data);
		end
	end

	always@(MRTI_addr_rd) begin
		if(started == 1) begin
			$fwrite(signaltracefile, "MRTI_addr_rd <= %h\n", MRTI_addr_rd);
		end
	end
	
	always #5 clk = ~clk;
	
	always@(posedge clk) clk_cnt = clk_cnt + 1;

endmodule