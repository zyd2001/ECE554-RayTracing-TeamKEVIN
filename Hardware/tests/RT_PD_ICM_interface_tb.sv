module RT_PD_ICM_interface_tb ();


    // input 
    logic clk;
    logic rst_n;    

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
    logic [127:0] origin;
    logic [127:0] direction;

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

	mem_main #(.NUM_RT(4), .NUM_THREAD(32)) main_mem(.clk(clk), .rst_n(rst_n), .we(we_RT), .re(re_RT), .addr(addr_RT), 
		.data_in(data_RT_in), .data_out(data_RT_out), .rd_rdy(rd_rdy_RT));
	
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


    rt_pd_icm_interface iDUT(.clk(clk), .rst_n(rst_n), .job_assign(job_assign), .thread_id_in(thread_id_in), .pixel_id_in(pixel_id_in)
        .program_counter_in(program_counter_in), .stack_ptr_in(stack_ptr_in), .context_switch_pd(context_switch_pd), .task_done_pd(task_done_pd),
        .program_counter_out(program_counter_out), .stack_ptr_out(stack_ptr_out), .shader_info(shader_info), .normal(normal), .de_q(de_q), .origin(origin),
        .direction(direction), .end_program(End_program), .context_switch_rt(Context_switch), 
        .scalar_rd_data_0(PD_scalar_read1), .scalar_rd_data_1(PD_scalar_read2), .vector_rd_data_0(PD_vector_read1), .vector_rd_data_1(PD_vector_read2),
        .scalar_rd_addr_0(PD_scalar_read_address1), .scalar_rd_addr_1(PD_scalar_read_address2), .vector_rd_addr_0(PD_vector_read_address1), .vector_rd_addr_1(PD_vector_read_address2), 
        .kernel_mode(kernel_mode), .scalar_we(PD_scalar_wen), .vector_we(PD_vector_wen), 
        .scalar_wb_addr(PD_scalar_wb_address), .vector_wb_addr(PD_vector_wb_address), .scalar_wb_data(PD_scalar_wb_data), .vector_wb_data(PD_vector_wb_data));

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        job_assign = 0;
        thread_id_in = 0;
        pixel_id_in = 0;
        program_counter_in = 0;
        stack_ptr_in = 0;
        shader_info = 0;
        normal = 0;

        // assigning the first job
        @(negedge clk)
        rst_n = 1'b0;
        job_assign = 1;
        thread_id_in = 5'd10;
        pixel_id_in = 32'd98498;
        program_counter_in = 32'h4;
        stack_ptr_in = 32'h778787;
        shader_info = 128'h989498891965;
        normal = 128'h5741918748;

        @(negedge clk)
        job_assign = 0;

        @(context_switch_pd)
        if (thread_id_in != 5'd10 || pixel_id_in != 32'd98498) begin
            print("thread ID or pixel ID is wrong");
        end
    end


    always #2 clk = ~clk; 

endmodule