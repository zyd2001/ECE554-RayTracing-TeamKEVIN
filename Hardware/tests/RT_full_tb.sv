import "DPI-C" function string getenv(input string env_name);

module RT_full_tb ();

    int rmtracefile;
	string rmtracefilename;

    // input 
    logic clk;
    logic rst_n;    

    shortreal temp1, temp2;
    // PD
    logic job_assign;
    logic [4:0] thread_id_in;
    logic [31:0] pixel_id_in;
    logic [31:0] program_counter_in;
    logic [31:0] stack_ptr_in;
    logic context_switch_pd;
    logic task_done_pd;
    logic [4:0] thread_id_out;
    logic [31:0] program_counter_out;
    logic [31:0] stack_ptr_out;
    
    // IC MEM
    logic [127:0] shader_info;
    logic [127:0] normal;
    logic de_q;
    logic [95:0] origin;
    logic [95:0] direction;

    logic [31:0] scalar_rd_data_0;
    logic [31:0] scalar_rd_data_1;
    logic [127:0] vector_rd_data_0;
    logic [127:0] vector_rd_data_1;

    logic [4:0] scalar_rd_addr_0;
    logic [4:0] scalar_rd_addr_1;
    logic [3:0] vector_rd_addr_0;
    logic [3:0] vector_rd_addr_1;

    logic kernel_mode;
    logic scalar_we;
    logic vector_we;
    logic [4:0] scalar_wb_addr;
    logic [3:0] vector_wb_addr;
    logic [31:0] scalar_wb_data;
    logic [127:0] vector_wb_data;
    

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

    logic s_or_v [3:0];
    logic s_or_v_s;
    assign s_or_v[0] = s_or_v_s;
	mem_main #(.NUM_RT(4), .NUM_THREAD(32)) main_mem(.clk(clk), .rst_n(rst_n), .we(we_RT), .re(re_RT), .addr(addr_RT), 
		.data_in(data_RT_in), .data_out(data_RT_out), .rd_rdy(rd_rdy_RT), .mode(s_or_v));
	
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
		.MEM_read_en(RT_MEM_read_en), .MEM_write_en(RT_MEM_write_en), .MEM_done(RT_MEM_done), .MEM_s_or_v(s_or_v_s)
	);


    rt_pd_icm_interface iDUT(.clk(clk), .rst_n(rst_n), .job_assign(job_assign), .thread_id_in(thread_id_in), .pixel_id_in(pixel_id_in), .thread_id_out(thread_id_out),
        .program_counter_in(program_counter_in), .stack_ptr_in(stack_ptr_in), .context_switch_pd(context_switch_pd), .task_done_pd(task_done_pd),
        .program_counter_out(program_counter_out), .stack_ptr_out(stack_ptr_out), .shader_info(shader_info), .normal(normal[95:0]), .de_q(de_q), .origin(origin),
        .direction(direction), .end_program(End_program), .context_switch_rt(Context_switch), 
        .scalar_rd_data_0(PD_scalar_read1), .scalar_rd_data_1(PD_scalar_read2), .vector_rd_data_0(PD_vector_read1), .vector_rd_data_1(PD_vector_read2),
        .scalar_rd_addr_0(PD_scalar_read_address1), .scalar_rd_addr_1(PD_scalar_read_address2), .vector_rd_addr_0(PD_vector_read_address1), .vector_rd_addr_1(PD_vector_read_address2), 
        .kernel_mode(kernel_mode), .scalar_we(PD_scalar_wen), .vector_we(PD_vector_wen), 
        .scalar_wb_addr(PD_scalar_wb_address), .vector_wb_addr(PD_vector_wb_address), .scalar_wb_data(PD_scalar_wb_data), .vector_wb_data(PD_vector_wb_data));

    initial begin
        rmtracefilename = {getenv("PWD"), "/rmtrace.out"};
		rmtracefile = $fopen(rmtracefilename, "w+");
        clk = 1'b0;
        rst_n = 1'b0;
        job_assign = 0;
        thread_id_in = 0;
        pixel_id_in = 0;
        program_counter_in = 0;
        stack_ptr_in = 0;
        shader_info = 0;
        normal = 0;

        // assigning the first job
        @(negedge clk)
        rst_n = 1'b1;
        job_assign = 1;
        thread_id_in = 5'd00;
        pixel_id_in = 32'd37;
        program_counter_in = 32'h0;
        stack_ptr_in = 32'h80050000;
        shader_info = 128'h000098A7;
        normal = 128'h00007748;

        @(negedge clk)
        job_assign = 0;

        // First hit
        #1
		fork
        // we want to make sure that no more responses
        begin: timeout
	        repeat(2000) @(posedge clk);
            $display("Program does not correctly terminate");
            $stop();
	    end
	    begin
            while (context_switch_pd != 1'b1) begin
				@(posedge clk);
				print_output(rmtracefile);
			end
            
            $display("First iteration correctly terminate");
            disable timeout;
	    end
    	join
        
        program_counter_in = program_counter_out;
        stack_ptr_in = stack_ptr_out;
        
        $display("Origin: %f, %f, %f\n",$bitstoshortreal(origin[31:0]),$bitstoshortreal(origin[63:32]),$bitstoshortreal(origin[95:64]) );
        $display("Direction: %f, %f, %f\n",$bitstoshortreal(direction[31:0]),$bitstoshortreal(direction[63:32]),$bitstoshortreal(direction[95:64]) );
        
        $stop();
        repeat(4) @(negedge clk);
        
        job_assign = 1;
        shader_info = {32'h3,32'h403f9cdc,32'h407d4110, 32'hc03d3f6c};
        normal = {32'h0, 32'h0,32'h0,32'h3f800000};

        @(negedge clk)
        job_assign = 0;

        // Shadow Ray
        #1
		fork
        // we want to make sure that no more responses
        begin: timeout2
	        repeat(4000) @(posedge clk);
            $fclose(rmtracefile);
            $display("Program does not correctly terminate");
            $stop();
	    end
	    begin
            while (context_switch_pd != 1'b1) begin
				@(posedge clk);
				print_output(rmtracefile);
			end
            disable timeout2;
	    end
        join


        program_counter_in = program_counter_out;
        stack_ptr_in = stack_ptr_out;
        
        $display("Origin: %f, %f, %f\n",$bitstoshortreal(origin[31:0]),$bitstoshortreal(origin[63:32]),$bitstoshortreal(origin[95:64]) );
        $display("Direction: %f, %f, %f\n",$bitstoshortreal(direction[31:0]),$bitstoshortreal(direction[63:32]),$bitstoshortreal(direction[95:64]) );
        $stop();
        repeat(4) @(negedge clk);
        
        // Waited to be filled
        job_assign = 1;
        shader_info = {32'h0, 32'h0,32'h0,32'h0};
        normal = {32'h0, 32'h0,32'h0,32'h0};

        @(negedge clk)
        job_assign = 0;

        // Final Color
        #1
		fork
        // we want to make sure that no more responses
        begin: timeout3
	        repeat(4000) @(posedge clk);
            $fclose(rmtracefile);
            $display("Program does not correctly terminate");
            $stop();
	    end
	    begin
            while (task_done_pd != 1'b1) begin
				@(posedge clk);
				print_output(rmtracefile);
			end
            disable timeout3;
	    end
        join

        $display("Test Passed. Please check log for more detail");
        $fclose(rmtracefile);
        $stop();

    end


    always #2 clk = ~clk; 
    
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
endmodule