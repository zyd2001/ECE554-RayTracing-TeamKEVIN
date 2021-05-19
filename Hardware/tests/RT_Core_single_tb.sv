//import rand_assembly.out;
import "DPI-C" function string getenv(input string env_name);

module RT_Core_single_tb();

	// Reg/Mem Trace log
	int rmtracefile;
	string rmtracefilename;
 
	// RT core control inputs
	logic clk, rst_n, rst;
	assign rst = !rst_n;
	logic kernel_mode;

	// RT core control outputs
	logic End_program, Context_switch;

	logic PD_scalar_wen, PD_vector_wen;
	logic [4:0] PD_scalar_wb_address, PD_scalar_read_address1, PD_scalar_read_address2;
	logic [3:0] PD_vector_wb_address, PD_vector_read_address1, PD_vector_read_address2;
	logic [31:0] PD_scalar_wb_data, PD_scalar_read1, PD_scalar_read2;
	logic [127:0] PD_vector_wb_data, PD_vector_read1, PD_vector_read2;

	// Memory signal
	logic [31:0] mem_inst_out, mem_const_out, MRTI_addr_rd, pc_reg;
	logic [127:0] mem_main_out, mem_out;
	logic [8:0] const_address;
	logic [11:0] inst_address;
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

	assign inst_address = MRTI_addr_rd[13:2];
	assign const_address = RT_MEM_addr[10:2];

	// We don't care about invalid address
	assign MM_en = RT_MEM_addr[31] == 3'b1 ? 1'b1 : 1'b0;
	assign Const_en = RT_MEM_addr[31] == 3'b0 ? 1'b1 : 1'b0;

	assign RT_MEM_data_read = MM_en == 1'b1 ? MM_data_out : {96'b0, mem_const_out};
	assign MM_we = RT_MEM_write_en & MM_en;
	assign MM_re = RT_MEM_read_en & MM_en;
	assign RT_MEM_done = Const_en | (MM_en & MM_done);

	single_port_ram_inst #(.ADDR_WIDTH(12), .DATA_WIDTH(32)) inst_mem(.clk(clk), .addr(inst_address), .q(mem_inst_out), .we(1'b0), .data(32'b0));
	single_port_ram_const #(.ADDR_WIDTH(9), .DATA_WIDTH(32)) const_mem(.clk(clk), .addr(const_address), .q(mem_const_out), .we(1'b0), .data(32'b0));

	logic MM_s_or_v [3:0];
    logic MM_s_or_v_s;
    assign MM_s_or_v[0] = MM_s_or_v_s;
	mem_main #(.NUM_RT(4), .NUM_THREAD(32)) main_mem(.clk(clk), .rst_n(rst_n), .we(we_RT), .re(re_RT), .addr(addr_RT), 
		.data_in(data_RT_in), .data_out(data_RT_out), .rd_rdy(rd_rdy_RT), .mode(MM_s_or_v));
	
	RT_core_single rt_core(.clk(clk), .rst_n(rst_n), .rst(rst),
		.kernel_mode(kernel_mode), .End_program(End_program), .Context_switch(Context_switch),
		
		.PD_scalar_wen(PD_scalar_wen), .PD_scalar_wb_address(PD_scalar_wb_address), .PD_scalar_wb_data(PD_scalar_wb_data),
		.PD_vector_wen(PD_vector_wen), .PD_vector_wb_address(PD_vector_wb_address), .PD_vector_wb_data(PD_vector_wb_data),
		.PD_scalar_read_address1(PD_scalar_read_address1), .PD_scalar_read_address2(PD_scalar_read_address2), 
		.PD_vector_read_address1(PD_vector_read_address1), .PD_vector_read_address2(PD_vector_read_address2),
		.PD_scalar_read1(PD_scalar_read1), .PD_scalar_read2(PD_scalar_read2),
		.PD_vector_read1(PD_vector_read1), .PD_vector_read2(PD_vector_read2),

		.MRTI_addr(MRTI_addr_rd), .MRTI_data(mem_inst_out),
    	.MEM_addr(RT_MEM_addr), .MEM_data_write(RT_MEM_data_write), .MEM_data_read(RT_MEM_data_read),
		.MEM_read_en(RT_MEM_read_en), .MEM_write_en(RT_MEM_write_en), .MEM_done(RT_MEM_done), .MEM_s_or_v(MM_s_or_v_s)
	);

	initial begin
		// Initialize Reg/Mem Trace
		rmtracefilename = {getenv("PWD"), "/tests/RT_trace.out"};
		rmtracefile = $fopen(rmtracefilename, "w+");		

		clk = 0;
		rst_n = 0;

		we_RT[1] = 0;
		we_RT[2] = 0;
		we_RT[3] = 0;

		re_RT[1] = 0;
		re_RT[2] = 0;
		re_RT[3] = 0;

		addr_RT[1] = 32'b0;
		addr_RT[2] = 32'b0;
		addr_RT[3] = 32'b0;

		data_RT_in[1] = 128'b0;
		data_RT_in[2] = 128'b0;
		data_RT_in[3] = 128'b0;
		

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
		if (rt_core.DEBUG_inst != 32'hF8000000) begin
			if (rt_core.DEBUG_inst == 32'h30000000) begin
				$fwrite(rmtracefile, "PC at %h, Flushed \n\n", rt_core.DEBUG_PC);
			end
			else begin
				$fwrite(rmtracefile, "PC at %h, instruction: %h \n", rt_core.DEBUG_PC, rt_core.DEBUG_inst);
				$fwrite(rmtracefile, " Reading scalar %d: %h, Reading scalar %d: %h \n", rt_core.DEBUG_scalar_read_address1, rt_core.DEBUG_scalar_read1,rt_core.DEBUG_scalar_read_address2, rt_core.DEBUG_scalar_read2);
				$fwrite(rmtracefile, " Reading vector %d: %h, Reading vector %d: %h \n", rt_core.DEBUG_vector_read_address1, rt_core.DEBUG_vector_read1,rt_core.DEBUG_vector_read_address2, rt_core.DEBUG_vector_read2);
				if (rt_core.DEBUG_memory_R_enable) 
					$fwrite(rmtracefile, " Reading memory location %h: %h \n",rt_core.DEBUG_memory_address, rt_core.DEBUG_memory_R_data);
				else if (rt_core.DEBUG_memory_W_enable)
					$fwrite(rmtracefile, " writing memory location %h: %h \n",rt_core.DEBUG_memory_address, rt_core.DEBUG_memory_W_data);
				else 
					$fwrite(rmtracefile, " No memory operations\n");

				if (rt_core.DEBUG_scalar_wb_address == 5'b0) 
					$fwrite(rmtracefile, " No scalar write back. ");
				else 
					$fwrite(rmtracefile, " write back scalar %d: %h. ", rt_core.DEBUG_scalar_wb_address, rt_core.DEBUG_scalar_wb_data);


				if (rt_core.DEBUG_vector_wb_address == 4'b0) 
					$fwrite(rmtracefile, " No vector write back. \n\n");
				else 
					$fwrite(rmtracefile, " write back vector %d: %h. \n\n", rt_core.DEBUG_vector_wb_address, rt_core.DEBUG_vector_wb_data);
			end
		end
	endtask
	
	always #2 clk = ~clk;

endmodule