// Module Name:  rta.sv
// Project:      ECE554-Ray-Tracing
// Description:  
//
//

//===================================================================
// Interface Description
// clk  : Clock input
// rst  : Reset input (active high)
// mmio : Memory-mapped I/O interface. See mmio_if.vh and description above.
// dma  : DMA interface. See dma_if.vh and description above.
//===================================================================


module rta 
  (
   input clk,
   input rst,
	 mmio_if.user mmio,
	 dma_if.peripheral dma
   );


  parameter NUM_RT = 1;
  parameter NUM_IC = 1;
//   parameter NUM_RT = 4;
//   parameter NUM_IC = 8;
  parameter NUM_THREAD = 32;
  parameter NUM_TRI = 512;
  parameter DEPTH_RT_CONST = 512;
  parameter DEPTH_RT_INST = 4096;

  localparam BIT_RT = $clog2(NUM_RT);
  localparam BIT_IC = $clog2(NUM_IC);
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  localparam BIT_TRI = $clog2(NUM_TRI);

  genvar i, j;

  logic rst_n;
  assign rst_n = ~rst;


  ///////////////// Memory Controller ////////////////
  // MAIN
  logic re_mc_main;
  logic [31:0] addr_mc_main[3:0];
  // CP
  logic wr_out_done_mc_cp;
  // CP || INST || CONST
  logic [1:0] we_mem_mc_x[3:0];
  logic [31:0] data_32_mc_x;
  logic cp_strt_mc_cp;
  // TRI
  logic [127:0] data_128_mc_tri;
  logic term_mc_cp;


  /////////////////// Stack Memory ///////////////////
  logic re_x_main[3:0];
  logic [31:0] addr_x_main[3:0];
  // MC || RT
  logic [127:0] data_out_main_x[3:0];
  // RT
  logic rd_rdy_main_rt[3:0];
  

  //////////////// Instruction Memory ////////////////
  // RT
  logic [31:0] data_out_inst_rt[NUM_RT-1:0];


  ///////////////// Constant Memory /////////////////
  // RT
  logic [31:0] data_out_const_rt[NUM_RT-1:0];


  ///////////////// Triangle Memory /////////////////
  // MC
  logic [NUM_IC-1:0]rdy_tri_mc;
  // IC
  logic rdy_tri_ic[NUM_IC-1:0];
  logic invalid_tri_ic[NUM_IC-1:0];
  logic [95:0] vertex_0_tri_ic[NUM_IC-1:0];
  logic [95:0] vertex_1_tri_ic[NUM_IC-1:0];
  logic [95:0] vertex_2_tri_ic[NUM_IC-1:0];
  logic [31:0] sid_tri_ic[NUM_IC-1:0];


  //////////////// Command Processor ////////////////
  // MC
  logic load_done_term_cp_mc;
  // PD
  logic load_cp_pd;
  logic load_done_cp_pd;
  logic [31:0] pixel_id_cp_pd;


  //////////////// Patch Dispatcher ////////////////
  // MC
  logic patch_done_pd_mc;
  // RT_IF
  logic job_dispatch_pd_rtif[NUM_RT-1:0];
  logic [BIT_THREAD-1:0] thread_id_out_pd_rtif;
  logic [31:0] pixel_id_pd_rtif;
  logic [31:0] pc_out_pd_rtif;
  logic [31:0] sp_out_pd_rtif;
  // IC
  logic job_dispatch_pd_ic[NUM_IC-1:0];
  logic [BIT_THREAD-1:0] thread_id_out_pd_ic;
  // ICM
  logic q_en_rt2ic_pd_icm;
  logic core_id_rt2ic_pd_icm[NUM_RT-1:0];
  logic q_en_ic2rt_pd_icm;
  logic core_id_ic2rt_pd_icm[NUM_IC-1:0];


  ////////////////// RT INTERFACE /////////////////
  // PD
  logic context_switch_rtif_pd[NUM_RT-1:0];
  logic task_done_rtif_pd[NUM_RT-1:0];
  logic [BIT_THREAD-1:0] thread_id_rtif_pd[NUM_RT-1:0];
  logic [31:0] program_counter_rtif_pd[NUM_RT-1:0];
  logic [31:0] stack_ptr_rtif_pd[NUM_RT-1:0];
  // RT
  logic [4:0] scalar_rd_addr_0_rtif_rt[NUM_RT-1:0];
  logic [4:0] scalar_rd_addr_1_rtif_rt[NUM_RT-1:0];
  logic [3:0] vector_rd_addr_0_rtif_rt[NUM_RT-1:0];
  logic [3:0] vector_rd_addr_1_rtif_rt[NUM_RT-1:0];
  logic kernel_mode_rtif_rt[NUM_RT-1:0];
  logic scalar_we_rtif_rt[NUM_RT-1:0];
  logic vector_we_rtif_rt[NUM_RT-1:0];
  logic [4:0] scalar_wb_addr_rtif_rt[NUM_RT-1:0];
  logic [3:0] vector_wb_addr_rtif_rt[NUM_RT-1:0];
  logic [31:0] scalar_wb_data_rtif_rt[NUM_RT-1:0];
  logic [127:0] vector_wb_data_rtif_rt[NUM_RT-1:0];

  // ICM
  logic [NUM_RT-1:0] de_q_rtif_icm;
  logic [95:0] origin_rtif_icm[NUM_RT-1:0];
  logic [95:0] direction_rtif_icm[NUM_RT-1:0];


  //////////////////// RT CORE ////////////////////
  // MAIN
  logic [127:0] data_in_rt_main[3:0];
  logic we_rt_main[3:0];
  logic re_rt_main[3:0];
  logic mode_rt_main[3:0];
  // INST
  logic [31:0] addr_rt_inst[NUM_RT-1:0];
  // MAIN || INST
  logic [31:0] addr_rt_x[3:0];
  logic [127:0] mem_data_read_x_rt[NUM_RT-1:0];
  // RT_IF
  logic task_done_rt_rtif[NUM_RT-1:0];
  logic context_switch_rt_rtif[NUM_RT-1:0];
  logic [31:0] scalar_rd_data_0_rt_rtif[NUM_RT-1:0];
  logic [31:0] scalar_rd_data_1_rt_rtif[NUM_RT-1:0];
  logic [127:0] vector_rd_data_0_rt_rtif[NUM_RT-1:0];
  logic [127:0] vector_rd_data_1_rt_rtif[NUM_RT-1:0];
  // ICM
  logic [127:0] ray_origin_rt_icm [NUM_RT-1:0];
  logic [127:0] ray_direction_rt_icm [NUM_RT-1:0];
  logic dequeue_rt_icm;

  //////////////////// IC CORE ////////////////////
  // PD
  logic context_switch_ic_pd[NUM_IC-1:0];
  logic [BIT_THREAD-1:0] thread_id_in_ic_pd[NUM_IC-1:0];
  // TRI
  logic re_ic_tri[NUM_IC-1:0];
  logic unsigned [BIT_TRI-1:0] tri_id_ic_tri[NUM_IC-1:0];
  // ICM
  logic [127:0] shader_info_ic_icm [NUM_IC-1:0]; //(sid, v2, v1, v0)
  logic [95:0] normal_ic_icm [NUM_IC-1:0];
  logic [NUM_IC-1:0] dequeue_ic_icm;

  /////////////////// IC Memory ///////////////////
  // IC
  logic [95:0] ray_origin_icm_ic;
  logic [95:0] ray_direction_icm_ic;
  // RT_IF
  logic [127:0] shader_info_icm_rtif; //(sid, v2, v1, v0)
  logic [95:0] normal_icm_rtif;

  mem_controller memory_controller
   (
    .clk(clk),
    .rst_n(rst_n),
    .dma(dma),
    .mmio(mmio),
    .rdy_tri(&rdy_tri_mc),
    .patch_done(patch_done_pd_mc),
    .term_cp(load_done_term_cp_mc),
    .result(data_out_main_x),
    .we_mem(we_mem_mc_x),
    .data_32(data_32_mc_x),
    .data_128(data_128_mc_tri),
    .cp_strt(cp_strt_mc_cp),
    .re_main(re_mc_main),
    .wr_out_done(wr_out_done_mc_cp),
    .addr_main(addr_mc_main),
    .term(term_mc_cp)
    );


  mem_main memory_stack
   (
    .clk(clk), 
    .rst_n(rst_n),
    .we(we_rt_main), 
    .re(re_x_main), 
    .mode(mode_rt_main),
    .addr(addr_x_main), 
    .data_in(data_in_rt_main),
    .data_out(data_out_main_x), 
    .rd_rdy(rd_rdy_main_rt)
    );

  generate
    for (i = 0; i < 4; i++) begin
      assign re_x_main[i] = re_mc_main ? 1'h1 : re_rt_main[i];
      assign addr_x_main[i] = re_mc_main ? addr_mc_main[i] : addr_rt_x[i]; 
    end
  endgenerate
/*
  assign we_rt_main[1] = 1'h0;
  assign re_rt_main[1] = 1'h0;
  assign addr_rt_x[1] = 32'h0;
  assign mode_rt_main[1] = 1'h0;
  assign data_in_rt_main[1] = 128'h0;
*/
/*
  assign we_rt_main[2] = 1'h0;
  assign re_rt_main[2] = 1'h0;
  assign addr_rt_x[2] = 32'h0;
  assign mode_rt_main[2] = 1'h0;
  assign data_in_rt_main[2] = 128'h0;
*/
/*
  assign we_rt_main[3] = 1'h0;
  assign re_rt_main[3] = 1'h0;
  assign addr_rt_x[3] = 32'h0;
  assign mode_rt_main[3] = 1'h0;
  assign data_in_rt_main[3] = 128'h0;
*/

  CP #(.NUM_THREAD(NUM_THREAD))command_processer
   (
    .clk(clk), 
    .rst_n(rst_n),
    .init_mem_fin_MC(cp_strt_mc_cp),
    .patch_out_done_MC(wr_out_done_mc_cp),
    .pixel_size_MC(data_32_mc_x),
    .we_pixel_size_MC(we_mem_mc_x[0][0]),
    .load_done_term_MC(load_done_term_cp_mc),
    .load_start_PD(load_cp_pd),
    .load_done_PD(load_done_cp_pd),
    .pixel_id_PD(pixel_id_cp_pd)
    );
    

  generate
    for (i = 0; i < NUM_RT; i++) begin: inst_const_memory
      mem_inst_const #(.DEPTH(DEPTH_RT_INST)) memory_instruction 
      (
        .clk(clk), 
        .rst_n(rst_n), 
        .addr(addr_rt_inst[i]), 
        .data_MC(data_32_mc_x), 
        .ctrl_MC(we_mem_mc_x[1]), 
        .busy(), 
        .data_out(data_out_inst_rt[i])
        );

      mem_inst_const #(.DEPTH(DEPTH_RT_CONST)) memory_constant 
      (
        .clk(clk), 
        .rst_n(rst_n), 
        .addr(addr_rt_x[i]), 
        .data_MC(data_32_mc_x), 
        .ctrl_MC(we_mem_mc_x[2]), 
        .busy(), 
        .data_out(data_out_const_rt[i])
        );
    end
  endgenerate


  generate
    for (i = 0; i < NUM_IC; i++) begin: triangle_memory
      mem_triangle #(.NUM_TRIANGLE(NUM_TRI))memory_triangle
       (
         .clk(clk),
         .rst_n(rst_n),
         // IC
         .re_IC(re_ic_tri[i]),
         .triangle_id(tri_id_ic_tri[i]),
         .data_MC(data_128_mc_tri),
         // MC
         .we_MC(we_mem_mc_x[3][0]),
         .done_MC(we_mem_mc_x[3][1]),
         .rdy_MC(rdy_tri_mc[i]),
         // TRI
         .rdy_IC(rdy_tri_ic[i]),
         .not_valid_IC(invalid_tri_ic[i]),
         .vertex0_IC(vertex_0_tri_ic[i]),
         .vertex1_IC(vertex_1_tri_ic[i]),
         .vertex2_IC(vertex_2_tri_ic[i]),
         .sid_IC(sid_tri_ic[i])
         );
    end
  endgenerate
  

  patch_dispatcher #(.NUM_RT(NUM_RT),.NUM_IC(NUM_IC)) pd  
   (
    .clk(clk),
    .rst_n(rst_n),
    .load_cp(load_cp_pd),
    .load_done_cp(load_done_cp_pd),
    .pixel_id_cp(pixel_id_cp_pd),
    .task_done_rt(task_done_rtif_pd),
    .context_switch_rt(context_switch_rtif_pd),
    .thread_id_in_rt(thread_id_rtif_pd),
    .pc_in_rt(program_counter_rtif_pd),
    .stack_ptr_in_rt(stack_ptr_rtif_pd),
    .context_switch_ic(context_switch_ic_pd),
    .thread_id_in_ic(thread_id_in_ic_pd),
    .patch_done(patch_done_pd_mc),
    .job_dispatch_rt(job_dispatch_pd_rtif),
    .thread_id_out_rt(thread_id_out_pd_rtif),
    .pixel_id_rt(pixel_id_pd_rtif),
    .pc_out_rt(pc_out_pd_rtif),
    .sp_out_rt(sp_out_pd_rtif),
    .job_dispatch_ic(job_dispatch_pd_ic),
    .thread_id_out_ic(thread_id_out_pd_ic),
    .q_en_rt2ic(q_en_rt2ic_pd_icm),
    .core_id_rt2ic(core_id_rt2ic_pd_icm),
    .q_en_ic2rt(q_en_ic2rt_pd_icm),
    .core_id_ic2rt(core_id_ic2rt_pd_icm)
    );


  generate
    for (i = 0; i < NUM_RT; i++) begin: RT_IF
      rt_pd_icm_interface rt_interface
       (
         .clk(clk),
         .rst_n(rst_n),
         .rst(rst),
         // PD
         .job_assign(job_dispatch_pd_rtif[i]),
         .thread_id_in(thread_id_out_pd_rtif),
         .pixel_id_in(pixel_id_pd_rtif),
         .program_counter_in(pc_out_pd_rtif),
         .stack_ptr_in(sp_out_pd_rtif),

         .context_switch_pd(context_switch_rtif_pd[i]),
         .task_done_pd(task_done_rtif_pd[i]),
         .thread_id_out(thread_id_rtif_pd[i]),
         .program_counter_out(program_counter_rtif_pd[i]),
         .stack_ptr_out(stack_ptr_rtif_pd[i]),
         // ICM
         .shader_info(shader_info_icm_rtif),
         .normal(normal_icm_rtif),

         .de_q(de_q_rtif_icm[i]),
         .origin(origin_rtif_icm[i]),
         .direction(direction_rtif_icm[i]),
         // RT
         .end_program(task_done_rt_rtif[i]),
         .context_switch_rt(context_switch_rt_rtif[i]),
         .scalar_rd_data_0(scalar_rd_data_0_rt_rtif[i]),
         .scalar_rd_data_1(scalar_rd_data_1_rt_rtif[i]),
         .vector_rd_data_0(vector_rd_data_0_rt_rtif[i]),
         .vector_rd_data_1(vector_rd_data_1_rt_rtif[i]),

         .scalar_rd_addr_0(scalar_rd_addr_0_rtif_rt[i]),
         .scalar_rd_addr_1(scalar_rd_addr_1_rtif_rt[i]),
         .vector_rd_addr_0(vector_rd_addr_0_rtif_rt[i]),
         .vector_rd_addr_1(vector_rd_addr_1_rtif_rt[i]),
         .kernel_mode(kernel_mode_rtif_rt[i]),
         .scalar_we(scalar_we_rtif_rt[i]),
         .vector_we(vector_we_rtif_rt[i]),
         .scalar_wb_addr(scalar_wb_addr_rtif_rt[i]),
         .vector_wb_addr(vector_wb_addr_rtif_rt[i]),
         .scalar_wb_data(scalar_wb_data_rtif_rt[i]),
         .vector_wb_data(vector_wb_data_rtif_rt[i])
        );
    end
    for (i = 0; i < NUM_RT; i++) begin: RT_CORE
      RT_core_single rt
       (
        .clk(clk),
        .rst_n(rst_n),
        .kernel_mode(kernel_mode_rtif_rt[i]),
        .PD_scalar_wen(scalar_we_rtif_rt[i]),
        .PD_vector_wen(vector_we_rtif_rt[i]),
        .PD_scalar_wb_address(scalar_wb_addr_rtif_rt[i]),
        .PD_scalar_read_address1(scalar_rd_addr_0_rtif_rt[i]),
        .PD_scalar_read_address2(scalar_rd_addr_1_rtif_rt[i]),
        .PD_vector_wb_address(vector_wb_addr_rtif_rt[i]),
        .PD_vector_read_address1(vector_rd_addr_0_rtif_rt[i]),
        .PD_vector_read_address2(vector_rd_addr_1_rtif_rt[i]),
        .PD_scalar_wb_data(scalar_wb_data_rtif_rt[i]),
        .PD_vector_wb_data(vector_wb_data_rtif_rt[i]),
        .MRTI_data(data_out_inst_rt[i]),
        .MEM_data_read(mem_data_read_x_rt[i]),
        .MEM_done(rd_rdy_main_rt[i]),

        .End_program(task_done_rt_rtif[i]),
        .Context_switch(context_switch_rt_rtif[i]),
        .PD_scalar_read1(scalar_rd_data_0_rt_rtif[i]),
        .PD_scalar_read2(scalar_rd_data_1_rt_rtif[i]),
        .PD_vector_read1(vector_rd_data_0_rt_rtif[i]),
        .PD_vector_read2(vector_rd_data_1_rt_rtif[i]),
        .MRTI_addr(addr_rt_inst[i]),
        .MEM_addr(addr_rt_x[i]),
        .MEM_data_write(data_in_rt_main[i]),
        .MEM_read_en(re_rt_main[i]),
        .MEM_write_en(we_rt_main[i]),
        .MEM_s_or_v(mode_rt_main[i])
        );

      assign mem_data_read_x_rt[i] = addr_rt_x[i][31] ? data_out_main_x[i] : data_out_const_rt[i];
     end
  endgenerate

  // logic [127:0] reverse[NUM_IC-1:0];

  generate;
    for(i = 0; i < NUM_IC; i++) begin: IC_CORE
      // assign reverse[i][127:96] = shader_info_ic_icm[i][127:96];
      // assign reverse[i][95:0] = {shader_info_ic_icm[i][31:0]
      //                           ,shader_info_ic_icm[i][63:32]
      //                           ,shader_info_ic_icm[i][95:64]
      //                           };
      IC_v3 ic
      (
        .clk(clk), 
        .rst(rst),
        // PD
        .Core_ID(job_dispatch_pd_ic[i]), 
        .thread_id_in(thread_id_out_pd_ic), 
        .Context_Switch_PD(context_switch_ic_pd[i]),
        .thread_id_out(thread_id_in_ic_pd[i]),
        // ICM
        .dir(ray_direction_icm_ic), 
        .orig(ray_origin_icm_ic), 

        .IC_Mem_Rdy(dequeue_ic_icm[i]),
        .norm(normal_ic_icm[i]), 
        .sid_out(shader_info_ic_icm[i][127:96]), 
        .IntersectionPoint(shader_info_ic_icm[i][95:0]),
        // TRI
        .Mem_Rdy(rdy_tri_ic[i]), 
        .Mem_NotValid(invalid_tri_ic[i]), 
        .v0(vertex_0_tri_ic[i]), 
        .v1(vertex_1_tri_ic[i]), 
        .v2(vertex_2_tri_ic[i]), 
        .sid_in(sid_tri_ic[i]), 
        .triangle_id(tri_id_ic_tri[i]), 
        .Mem_En(re_ic_tri[i])
    );
    end
  endgenerate
  

  mem_IC #(.NUM_RT(NUM_RT), .NUM_IC(NUM_IC), .NUM_THREAD(NUM_THREAD)) mem_ic
  (
    //input
    .clk(clk), 
    .rst_n(rst_n), 
    // PD
    .q_en_rt2ic_PD(q_en_rt2ic_pd_icm), 
    .core_id_rt2ic_PD(core_id_rt2ic_pd_icm), 
    .q_en_ic2rt_PD(q_en_ic2rt_pd_icm), 
    .core_id_ic2rt_PD(core_id_ic2rt_pd_icm),
    // RT_IF
    .ray_origin_RT(origin_rtif_icm), 
    .ray_direction_RT(direction_rtif_icm), 
    .dequeue_RT(|de_q_rtif_icm),
    // IC
    .shader_info_IC(shader_info_ic_icm), 
    .normal_IC(normal_ic_icm), 
    .dequeue_IC(|dequeue_ic_icm),
    //output
    .ray_origin_IC(ray_origin_icm_ic), 
    .ray_direction_IC(ray_direction_icm_ic), 
    .shader_info_RT(shader_info_icm_rtif), 
    .normal_RT(normal_icm_rtif) 
    );

     
endmodule




