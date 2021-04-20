//import rand_assembly.out;
import "DPI-C" function string getenv(input string env_name);
module RT_Core_single_tb;
	// Instruction Memory values
	int file;
	string filename;
	logic [31:0] MRTI [0:4095];
	logic [31:0] not_MRTI [0:4095];
	int status;

	// Trace Log
	int tracefile;
	string tracefilename;
	
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


	assign MRTI_data_rd = MRTI[MRTI_addr_rd];


	// Reading the binary file contains 0's for 1's and vice versa
	// Flip all bits to fix this
	always_comb foreach (not_MRTI[i]) MRTI[i] = ~not_MRTI[i];

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
		filename = {getenv("PWD"), "/rand_assembly.out"};
		file = $fopen(filename, "rb");
		status = $fread(not_MRTI, file);

		// Initialize Trace 
		tracefilename = {getenv("PWD"), "/trace.out"};
		tracefile = $fopen(tracefilename, "w+");


		clk = 0;
		rst_n = 0;
		started = 0;
		
		@(posedge clk)
		rst_n = 1;
		@(posedge clk)
		started = 1;

		// test trace log print
		scalar_wen = 0;
		MRTI_addr_rd = 200;
		@(posedge clk)
		scalar_wen = 1;
		MRTI_addr_rd = 400;
		@(posedge clk)
		End_program = 1;

		

	end

	//always@(End_program, Context_switch, scalar_wen, vector_wen, scalar_wb_address, scalar_read_address1, scalar_read_address2,
	//vector_wb_address, vector_read_address1, vector_read_address2, Scalar_wb_data, vector_wb_data, MRTI_addr_rd) begin
		
	//	if(started == 1) begin

	//	end


	//end

	// Trace log sensitivities for change of outputs from RT core
	always@(End_program) begin
		if(started == 1) begin
			$fwrite(tracefile, "End_program <= %b\n", End_program);
			
			// End test when thread is finished?
			$fclose(tracefilename);
			$fclose(filename);
			$stop; 
		end
	end

	always@(Context_switch) begin
		if(started == 1) begin
			$fwrite(tracefile, "Context_switch <= "  + Context_switch + "\n");
		end
	end

	always@(scalar_wen) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_wen <= %b\n", scalar_wen);
		end
	end

	always@(vector_wen) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_wen <= "  + vector_wen + "\n");
		end
	end

	always@(scalar_wb_address) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_wb_address <= "  + scalar_wb_address + "\n");
		end
	end

	always@(scalar_read_address1) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_read_address1 <= "  + scalar_read_address1 + "\n");
		end
	end

	always@(scalar_read_address2) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_read_address2 <= "  + scalar_read_address2 + "\n");
		end
	end


	always@(vector_read_address1) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_read_address1 <= "  + vector_read_address1 + "\n");
		end
	end

	always@(vector_read_address2) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_read_address2 <= "  + vector_read_address2 + "\n");
		end
	end

	always@(vector_wb_address) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_wb_address <= "  + vector_wb_address + "\n");
		end
	end

	always@(scalar_wb_data) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_wb_data <= "  + scalar_wb_data + "\n");
		end
	end

	always@(vector_wb_data) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_wb_data <= "  + vector_wb_data + "\n");
		end
	end

	always@(MRTI_addr_rd) begin
		if(started == 1) begin
			$fwrite(tracefile, "MRTI_addr_rd <= %h\n", MRTI_addr_rd);
		end
	end
	
	always #5 clk = ~clk;

endmodule