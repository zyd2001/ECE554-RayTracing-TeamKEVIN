//import rand_assembly.out;
import "DPI-C" function string getenv(input string env_name);



module RT_Core_single_tb();

	// Output signal Trace Log
	// int signaltracefile;
	// string signaltracefilename;

	// Reg/Mem Trace log
	int rmtracefile;
	string rmtracefilename;
	
	// for monitoring regs/memory
	genvar g;

	int clk_cnt;

	// set high after reset to start trace
	logic started;
 
	// RT core control inputs
	logic clk, rst_n;
	logic kernel_mode;

	// RT core control outputs
	logic End_program, Context_switch;

	logic PD_scalar_wen, PD_vector_wen;
	logic [4:0] PD_scalar_wb_address, PD_scalar_read_address1, PD_scalar_read_address2;
	logic [3:0] PD_vector_wb_address, PD_vector_read_address1, PD_vector_read_address2;
	logic [31:0] PD_scalar_wb_data, PD_scalar_read1, PD_scalar_read2;
	logic [127:0] PD_vector_wb_data, PD_vector_read1, PD_vector_read2;

	logic [4:0] DEBUG_scalar_wb_address, DEBUG_scalar_read_address1, DEBUG_scalar_read_address2;
	logic [3:0] DEBUG_vector_wb_address, DEBUG_vector_read_address1, DEBUG_vector_read_address2;
	logic [31:0] DEBUG_scalar_wb_data, DEBUG_scalar_read1, DEBUG_scalar_read2;
	logic [127:0] DEBUG_vector_wb_data, DEBUG_vector_read1, DEBUG_vector_read2;

	logic [31:0] Instruction;
	logic [31:0] PC;

	logic [31:0] memory_address;
	logic memory_R_enable;
	logic memory_W_enable;
	logic [127:0] memory_R_data;
	logic [127:0] memory_W_data;

	// Memory signal
	logic [31:0] mem_inst_out, mem_const_out, MRTI_addr_rd, pc_reg;
	logic [127:0] mem_main_out, mem_out;
	logic [8:0] inst_address, const_address;
	logic MM_we, MM_re, MM_done, MM_en, Const_en;
	logic [127:0] MM_data_out;

	logic [31:0] RT_MEM_addr;
	logic [127:0] RT_MEM_data_write, RT_MEM_data_read;
	logic RT_MEM_read_en, RT_MEM_write_en, RT_MEM_done;
	
	// MM input
	logic we_RT[3:0];
    logic re_RT[3:0];
    logic [31:0] addr_RT[3:0];
    logic [127:0] data_RT_in[3:0];
    
    logic rd_rdy_RT[3:0];
    logic [127:0] data_RT_out[3:0];

	assign we_RT[0] = MM_we;
	assign re_RT[0] = MM_re;
	assign addr_RT[0] = RT_MEM_addr;
	assign data_RT_in[0] = RT_MEM_data_write;
	assign MM_data_out = data_RT_out[0];
	assign MM_done = rd_rdy_RT[0];

	assign inst_address = MRTI_addr_rd[10:2];
	assign const_address = MRTI_addr_rd[10:2];

	// We don't care about invalid address
	assign MM_en = RT_MEM_addr[31:29] == 3'b100 ? 1'b1 : 1'b0;
	assign Const_en = RT_MEM_addr[31:29] == 3'b010 ? 1'b1 : 1'b0;

	assign RT_MEM_data_read = MM_en == 1'b1 ? MM_data_out : {96'b0, mem_const_out};
	assign MM_we = RT_MEM_write_en & MM_en;
	assign MM_re = RT_MEM_read_en & MM_en;
	assign RT_MEM_done = Const_en | (MM_en & MM_done);

	single_port_ram_inst #(.ADDR_WIDTH(9), .DATA_WIDTH(32)) inst_mem(.clk(clk), .addr(inst_address), .q(mem_inst_out), .we(1'b0), .data(32'b0));
	single_port_ram_const #(.ADDR_WIDTH(9), .DATA_WIDTH(32)) const_mem(.clk(clk), .addr(const_address), .q(mem_const_out), .we(1'b0), .data(32'b0));

	mem_main #(.NUM_RT(4), .NUM_THREAD(4)) main_mem(.clk(clk), .rst_n(rst_n), .we_RT(we_RT), .re_RT(re_RT), .addr_RT(addr_RT), 
		.data_RT_in(data_RT_in), .data_RT_out(data_RT_out), .rd_rdy_RT(rd_rdy_RT));
	
	RT_core_single rt_core(.clk(clk), .rst_n(rst_n),
		.kernel_mode(kernel_mode), .End_program(End_program), .Context_switch(Context_switch),
		
		.PD_scalar_wen(PD_scalar_wen), .PD_scalar_wb_address(PD_scalar_wb_address), .PD_scalar_wb_data(PD_scalar_wb_data),
		.PD_vector_wen(PD_vector_wen), .PD_vector_wb_address(PD_vector_wb_address), .PD_vector_wb_data(PD_vector_wb_data),
		.PD_scalar_read_address1(PD_scalar_read_address1), .PD_scalar_read_address2(PD_scalar_read_address2), 
		.PD_vector_read_address1(PD_vector_read_address1), .PD_vector_read_address2(PD_vector_read_address2),
		.PD_scalar_read1(PD_scalar_read1), .PD_scalar_read2(PD_scalar_read2),
		.PD_vector_read1(PD_vector_read1), .PD_vector_read2(PD_vector_read2),

		.DEBUG_scalar_wb_address(DEBUG_scalar_wb_address), .DEBUG_scalar_wb_data(DEBUG_scalar_wb_data),
		.DEBUG_vector_wb_address(DEBUG_vector_wb_address), .DEBUG_vector_wb_data(DEBUG_vector_wb_data),
		.DEBUG_scalar_read_address1(DEBUG_scalar_read_address1), .DEBUG_scalar_read_address2(DEBUG_scalar_read_address2), 
		.DEBUG_vector_read_address1(DEBUG_vector_read_address1), .DEBUG_vector_read_address2(DEBUG_vector_read_address2),
		.DEBUG_scalar_read1(DEBUG_scalar_read1), .DEBUG_scalar_read2(DEBUG_scalar_read2),
		.DEBUG_vector_read1(DEBUG_vector_read1), .DEBUG_vector_read2(DEBUG_vector_read2), .DEBUG_PC(PC),
		.DEBUG_inst(Instruction),
		.DEBUG_memory_address(memory_address), .DEBUG_memory_R_enable(memory_R_enable), .DEBUG_memory_W_enable(memory_W_enable),
		.DEBUG_memory_R_data(memory_R_data), .DEBUG_memory_W_data(memory_W_data),

		.MRTI_addr(MRTI_addr_rd), .MRTI_data(mem_inst_out),
    	.MEM_addr(RT_MEM_addr), .MEM_data_write(RT_MEM_data_write), .MEM_data_read(RT_MEM_data_read),
		.MEM_read_en(RT_MEM_read_en), .MEM_write_en(RT_MEM_write_en), .MEM_done(RT_MEM_done)
	);

	initial begin
		// Initialize Out Signal Trace 
		// signaltracefilename = {getenv("PWD"), "/sigtrace.out"};
		// signaltracefile = $fopen(signaltracefilename, "w+");

		// Initialize Reg/Mem Trace
		rmtracefilename = {getenv("PWD"), "/rmtrace.out"};
		rmtracefile = $fopen(rmtracefilename, "w+");		

		clk = 0;
		clk_cnt = 0;
		rst_n = 0;
		
		kernel_mode = 1;
		PD_scalar_wen = 0;
		PD_vector_wen = 0;
		PD_scalar_wb_address = 5'h1F;
		PD_scalar_read_address1 = 5'b0; 
		PD_scalar_read_address2 = 5'b0; 
		PD_vector_wb_address = 4'b0;
		PD_vector_read_address1 = 4'b0; 
		PD_vector_read_address2 = 4'b0;
		PD_scalar_wb_data = 31'b0;
		PD_vector_wb_data = 128'b0;
		@(negedge clk)
		rst_n = 1;
		// Always starts in Kernel mode, writing PC to RT core
		@(negedge clk)
		PD_scalar_wen = 1;
		// After writing PC, release kernel mode and The RT core should start
		@(negedge clk)
		kernel_mode = 0;
		started = 1;
		#1
		fork
        // we want to make sure that no more responses
        begin
	        repeat(500) @(posedge clk);
            disable timeout;
	    end
	    begin: timeout
	        while (End_program != 1'b1) begin
				@(posedge clk);
				print_output(rmtracefile);
			end
	        $display("Program Correctly terminates");
            $stop();
	    end
    	join


		$stop();
		
	end


	task print_output(int file);
		if (Instruction != 32'hF8000000) begin
			if (Instruction == 32'h30000000) begin
				$fwrite(rmtracefile, "PC at %h, Flushed \n\n", PC);
			end
			else begin
				$fwrite(rmtracefile, "PC at %h, instruction: %h \n", PC, Instruction);
				$fwrite(rmtracefile, " Reading scalar %d: %h, Reading scalar %d: %h \n", DEBUG_scalar_read_address1, DEBUG_scalar_read1,DEBUG_scalar_read_address2, DEBUG_scalar_read2);
				$fwrite(rmtracefile, " Reading vector %d: %h, Reading vector %d: %h \n", DEBUG_vector_read_address1, DEBUG_vector_read1,DEBUG_vector_read_address2, DEBUG_vector_read2);
				if (memory_R_enable) 
					$fwrite(rmtracefile, " Reading memory location %h: %h \n",memory_address, memory_R_data);
				else if (memory_W_enable)
					$fwrite(rmtracefile, " writing memory location %h: %h \n",memory_address, memory_W_data);
				else 
					$fwrite(rmtracefile, " No memory operations\n");

				if (DEBUG_scalar_wb_address == 5'b0) 
					$fwrite(rmtracefile, " No scalar write back. ");
				else 
					$fwrite(rmtracefile, " write back scalar %d: %h. ", DEBUG_scalar_wb_address, DEBUG_scalar_wb_data);


				if (DEBUG_vector_wb_address == 4'b0) 
					$fwrite(rmtracefile, " No vector write back. \n\n");
				else 
					$fwrite(rmtracefile, " write back vector %d: %h. \n\n", DEBUG_vector_wb_address, DEBUG_vector_wb_data);
			end
		end
	endtask

	
	// Reg file tracing
	// Right now, monitors changing of the instruction memory (to make sure tb works)
	// When testing the RT core, change MRTI to the registers of the 
	// RT reg file
	// Should be rt_core.scalar_ram and rt.core.vector_ram
	// generate
	//  	for(g = 0; g < 32; g++) begin
	//  		always@(rt_core.RF.scalar_ram[g]) begin
	//  			if(started == 1) begin
	//  				$fwrite(rmtracefile, "%d Reg %h: %h\n", clk_cnt,g, rt_core.RF.scalar_ram[g]);
	//  			end
	//  		end
 	// 	end

	// endgenerate
	

	// // Trace log sensitivities for change of outputs from RT core
	// always@(End_program) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "End_program <= %h\n", End_program);
			
	// 		// End test when thread is finished?
	// 		$fclose(signaltracefilename);
	// 		$fclose(filename);
	// 		$stop; 
	// 	end
	// end

	// always@(Context_switch) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "Context_switch <= %h\n", Context_switch);
	// 	end
	// end

	// always@(scalar_wen) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "scalar_wen <= %h\n", scalar_wen);
	// 	end
	// end

	// always@(vector_wen) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "vector_wen <= %h\n", vector_wen);
	// 	end
	// end

	// always@(scalar_wb_address) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "scalar_wb_address <= %h\n", scalar_wb_address);
	// 	end
	// end

	// always@(scalar_read_address1) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "scalar_read_address1 <= %h\n", scalar_read_address1);
	// 	end
	// end

	// always@(scalar_read_address2) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "scalar_read_address2 <= %h\n", scalar_read_address2);
	// 	end
	// end


	// always@(vector_read_address1) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "vector_read_address1 <= %h\n", vector_read_address1);
	// 	end
	// end

	// always@(vector_read_address2) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "vector_read_address2 <= %h\n", vector_read_address2);
	// 	end
	// end

	// always@(vector_wb_address) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "vector_wb_address <= %h\n", vector_wb_address);
	// 	end
	// end

	// always@(scalar_wb_data) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "scalar_wb_data <= %h\n", scalar_wb_data);
	// 	end
	// end

	// always@(vector_wb_data) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "vector_wb_data <= %h\n", vector_wb_data);
	// 	end
	// end

	// always@(MRTI_addr_rd) begin
	// 	if(started == 1) begin
	// 		$fwrite(signaltracefile, "MRTI_addr_rd <= %h\n", MRTI_addr_rd);
	// 	end
	// end
	
	always #2 clk = ~clk;
	
	always@(posedge clk) clk_cnt = clk_cnt + 1;

endmodule