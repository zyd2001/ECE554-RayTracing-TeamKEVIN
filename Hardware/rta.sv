// Module Name:  afu.sv
// Project:      dma_loopback
// Description:  This AFU provides a loopback DMA test that simply reads
//               data from one array in the CPU's memory and writes the
//               received data to a separate array. The AFU uses MMIO to
//               receive the starting read adress, starting write address,
//               size (# of cache lines to read/wite), and a go signal. The
//               AFU asserts a done signal to tell software that the DMA
//               transfer is complete.
//
//               One key difference with this AFU is that it does not use
//               CCI-P, which is abstracted away by a hardware abstraction
//               layer (HAL). Instead, the AFU uses a simplified MMIO interface
//               and DMA interface.
//
//               The MMIO interface is defined in mmio_if.vh. It behaves
//               similarly to the CCI-P functionality, except only supports
//               single-cycle MMIO read responses, which eliminates the need
//               for transaction IDs. MMIO writes behave identically to
//               CCI-P.
//
//               The DMA read interface takes a starting read address (rd_addr),
//               and a read size (rd_size) (# of cache lines to read). The rd_go
//               signal starts the transfer. When data is available from memory
//               the empty signal is cleared (0 == data available) and the data
//               is shown on the rd_data port. To read the data, the AFU should
//               assert the read enable (rd_en) (active high) for one cycle.
//               The rd_done signal is continuously asserted (active high) after
//               the AFU reads "size" words from the DMA.
//
//               The DMA write interface is similar, again using a starting
//               write address (wr_addr), write size (wr_size), and go signal.
//               Before writing data, the AFU must ensure that the write
//               interface is not full (full == 0). To write data, the AFU
//               puts the corresponding data on wr_data and asserts wr_en
//               (active high) for one cycle. The wr_done signal is continuosly
//               asserted after size cache lines have been written to memory.
//
//               All addresses are virtual addresses provided by the software.
//               All data elements are cachelines.
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


  localparam NUM_RT = 4;
  localparam NUM_TRI = 512;
  localparam BIT_TRI = $clog2(NUM_TRI);

  wire rst_n;
  assign rst_n = ~rst;

  // Memory Controller
  logic rdy_tri_mc;
  logic patch_done_pd_mc;
  logic [1:0] we_mem_mc_x[NUM_RT-1:0];
  logic [31:0] data_32_mc_x;
  logic [127:0] data_128_mc_tri;
  logic re_mc_main;
  logic [31:0] addr_mc_main[NUM_RT-1:0];

  // Stack Memory
  logic we_rt_main[NUM_RT-1:0];
  logic re_x_main[NUM_RT-1:0];
  logic [31:0] addr_x_main[NUM_RT-1:0];
  logic [127:0] data_in_rt_main[NUM_RT-1:0];
  logic [127:0] data_out_main_x[NUM_RT-1:0];
  logic rd_rdy_main_rt[NUM_RT-1:0];

  // RT CORE
  logic re_rt_main[NUM_RT-1:0];
  logic [31:0] addr_rt_main[NUM_RT-1:0];

  // Triangle Memory
  logic re_ic_tri;
  logic unsigned [BIT_TRI-1:0] tri_id_ic_tri;
  logic rdy_tri_ic;
  logic unvalid_tri_ic;
  logic [95:0] vertex_0_tri_ic;
  logic [95:0] vertex_1_tri_ic;
  logic [95:0] vertex_2_tri_ic;
  logic sid_tri_ic;


  mem_controller memory_controller
   (
    .clk(clk),
    .rst_n(rst_n),
    .dma(dma.peripheral),
    .mmio(mmio.user),
    .rdy_tri(rdy_tri_mc),
    .patch_done(patch_done_pd_mc),
    .result(data_out_main_x),
    .we_mem(we_mem_mc_x),
    .data_32(data_32_mc_x),
    .data_128(data_128_mc_tri),
    .re_main(re_mc_main),
    .addr_main(addr_mc_main)
    );


  mem_main memory_stack
   (
    .clk(clk), 
    .rst_n(rst_n),
    .we(we_rt_main), 
    .re(re_x_main), 
    .addr(addr_x_main), 
    .data_in(data_in_rt_main),
    .data_out(data_out_main_x), 
    .rd_rdy(rd_rdy_main_rt)
    );

  genvar i;
  generate
    for (i = 0; i < NUM_RT; i++) begin
      assign re_x_main[i] = re_mc_main ? 1'h1 : re_rt_main[i];
      assign addr_x_main[i] = re_mc_main ? addr_mc_main[i] : addr_rt_main[i]; 
    end
  endgenerate


  mem_triangle memory_triangle
   (
    .clk(clk),
    .rst_n(rst_n),
    .re_IC(re_ic_tri),
    .triangle_id(tri_id_ic_tri),
    .data_MC(data_128_mc_tri),
    .we_MC(we_mem_mc_x[3]),
    .rdy_MC(rdy_tri_mc),
    .rdy_IC(rdy_tri_ic),
    .not_valid_IC(unvalid_tri_ic),
    .vertex0_IC(vertex_0_tri_ic),
    .vertex1_IC(vertex_1_tri_ic),
    .vertex2_IC(vertex_2_tri_ic),
    .sid_IC(sid_tri_ic)
    );
  
            
endmodule




