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

	// Memory signal
	logic [31:0] mem_inst_out, mem_const_out;
	logic [127:0] mem_main_out, mem_out;
	logic [8:0] inst_address, const_address;
	logic MM_we, MM_re, MM_done, MM_en, Const_en;
	logic [127:0] MM_data_out;
	
	logic [31:0] RT_MEM_addr;
	logic [127:0] RT_MEM_data_write, RT_MEM_data_read;
	logic RT_MEM_read_en, RT_MEM_write_en, RT_MEM_done;

	assign inst_address = MRTI_addr_rd[10:2];
	assign const_address = MRTI_addr_rd[10:2];

	// We don't care about invalid address
	assign MM_en = RT_MEM_addr[31:29] == 3'b100 ? 1'b1 : 1'b0;
	assign Const_en = = RT_MEM_addr[31:29] == 3'b010 ? 1'b1 : 1'b0;

	assign RT_MEM_data_read = MM_en == 1'b1 ? MM_data_out : {96'b0, mem_const_out};
	assign MM_we = RT_MEM_write_en & MM_en;
	assign MM_re = RT_MEM_read_en & MM_en;
	assign RT_MEM_done = Const_en | (MM_en & MM_done);

	single_port_ram_inst #(.ADDR_WIDTH(9), .DATA_WIDTH(32)) inst_mem(.clk(clk), .addr(inst_address), .q(mem_inst_out), .we(1'b0), .data(32'b0));
	single_port_ram_const #(.ADDR_WIDTH(9), .DATA_WIDTH(32)) const_mem(.clk(clk), .addr(const_address), .q(mem_const_out), .we(1'b0), .data(32'b0));

	mem_main #(.NUM_RT(1), .NUM_THREAD(1)) main_mem(.clk(clk), .rst_n(rst_n), .we_RT(MM_we), .re_RT(MM_re), .addr_RT(RT_MEM_addr), 
		.data_RT_in(RT_MEM_data_write), .data_RT_out(MM_data_out), .rd_rdy_RT(MM_done));
	
	RT_core_single rt_core(.clk(clk), .rst_n(rst_n),
		.Kernel_mode(Kernel_mode), .End_program(End_program), .Context_switch(Context_switch),
		.scalar_wen(scalar_wen), .scalar_wb_address(scalar_wb_address), .scalar_wb_data(scalar_wb_data),
		.vector_wen(vector_wen), .vector_wb_address(vector_wb_address), .vector_wb_data(vector_wb_data),
		.scalar_read_address1(scalar_read_address1), .scalar_read_address2(scalar_read_address2), 
		.vector_read_address1(vector_read_address1), .vector_read_address2(vector_read_address2),
		.scalar_read1(scalar_read1), .scalar_read2(scalar_read2),
		.vector_read1(vector_read1), .vector_read2(vector_read2),

		.MRTI_addr(MRTI_addr_rd), .MRTI_data(mem_inst_out),
    	.MEM_addr(RT_MEM_addr), .MEM_data_write(RT_MEM_data_write), .MEM_data_read(RT_MEM_data_read),
		.MEM_read_en(RT_MEM_read_en), .MEM_write_en(RT_MEM_write_en), .MEM_done(RT_MEM_done)
	);

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
			$fwrite(tracefile, "End_program <= %h\n", End_program);
			
			// End test when thread is finished?
			$fclose(tracefilename);
			$fclose(filename);
			$stop; 
		end
	end

	always@(Context_switch) begin
		if(started == 1) begin
			$fwrite(tracefile, "Context_switch <= %h\n", Context_switch);
		end
	end

	always@(scalar_wen) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_wen <= %h\n", scalar_wen);
		end
	end

	always@(vector_wen) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_wen <= %h\n", vector_wen);
		end
	end

	always@(scalar_wb_address) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_wb_address <= %h\n", scalar_wb_address);
		end
	end

	always@(scalar_read_address1) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_read_address1 <= %h\n", scalar_read_address1);
		end
	end

	always@(scalar_read_address2) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_read_address2 <= %h\n", scalar_read_address2);
		end
	end


	always@(vector_read_address1) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_read_address1 <= %h\n", vector_read_address1);
		end
	end

	always@(vector_read_address2) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_read_address2 <= %h\n", vector_read_address2);
		end
	end

	always@(vector_wb_address) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_wb_address <= %h\n", vector_wb_address);
		end
	end

	always@(scalar_wb_data) begin
		if(started == 1) begin
			$fwrite(tracefile, "scalar_wb_data <= %h\n", scalar_wb_data);
		end
	end

	always@(vector_wb_data) begin
		if(started == 1) begin
			$fwrite(tracefile, "vector_wb_data <= %h\n", vector_wb_data);
		end
	end

	always@(MRTI_addr_rd) begin
		if(started == 1) begin
			$fwrite(tracefile, "MRTI_addr_rd <= %h\n", MRTI_addr_rd);
		end
	end
	
	always #5 clk = ~clk;

endmodule