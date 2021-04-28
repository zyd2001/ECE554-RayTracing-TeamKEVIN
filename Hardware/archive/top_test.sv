`include "platform_if.vh"
`include "afu_json_info.vh"
module top_test(clk, rst, rx, tx);
    
    input clk, rst;
    input  t_if_ccip_Rx rx;
    output t_if_ccip_Tx tx;

    localparam NUM_RT = 4;
    localparam BIT_RT = $clog2(NUM_RT);
    localparam NUM_IC = 4;
    localparam BIT_IC = $clog2(NUM_IC);
    localparam NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);

    logic rst_n;
    assign rst_n = ~rst;

    logic load_cp;
    logic [31:0] pixel_id_cp;

    logic task_done_rt[NUM_RT-1:0];
    logic context_switch_rt[NUM_RT-1:0];
    logic [BIT_THREAD-1:0] thread_id_in_rt[NUM_RT-1:0];
    logic [31:0] pc_in_rt[NUM_RT-1:0];
    logic [31:0] stack_ptr_in_rt[NUM_RT-1:0];

    logic context_switch_ic[NUM_IC-1:0];
    logic [BIT_THREAD-1:0] thread_id_in_ic[NUM_IC-1:0];

    // output
    logic patch_done, patch_done_reg;

    logic job_dispatch_rt[NUM_RT-1:0], job_dispatch_rt_reg[NUM_RT-1:0];
    logic [BIT_THREAD-1:0] thread_id_out_rt, thread_id_out_rt_reg;
    logic [31:0] pixel_id_rt, pixel_id_rt_reg;
    logic [31:0] pc_out_rt, pc_out_rt_reg;
    logic [31:0] sp_out_rt, sp_out_rt_reg;

    logic job_dispatch_ic[NUM_IC-1:0], job_dispatch_ic_reg[NUM_IC-1:0];
    logic [BIT_THREAD-1:0] thread_id_out_ic, thread_id_out_ic_reg;

    logic q_en_rt2ic, q_en_rt2ic_reg;
    logic core_id_rt2ic[NUM_RT-1:0], core_id_rt2ic_reg[NUM_RT-1:0];

    logic q_en_ic2rt, q_en_ic2rt_reg;
    logic core_id_ic2rt[NUM_IC-1:0], core_id_ic2rt_reg[NUM_IC-1:0];


    patch_dispatcher pd(.*);

    genvar i;





    always_ff @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
            load_cp <= '0;
            pixel_id_cp <= '0;

            patch_done_reg <= '0;
            thread_id_out_rt_reg <= '0;
            pixel_id_rt_reg <= '0;
            pc_out_rt_reg <= '0; 
            sp_out_rt_reg <= '0;
            thread_id_out_ic_reg <= '0;
            q_en_rt2ic_reg <= '0;
            q_en_ic2rt_reg <= '0;
       end 
       else begin
            load_cp <= rx.c0.data[0];
            pixel_id_cp <= rx.c0.data[31:0];

            patch_done_reg <= patch_done;
            thread_id_out_rt_reg <= thread_id_out_rt;
            pixel_id_rt_reg <= pixel_id_rt;
            pc_out_rt_reg <= pc_out_rt; 
            sp_out_rt_reg <= sp_out_rt;
            thread_id_out_ic_reg <= thread_id_out_ic;
            q_en_rt2ic_reg <= q_en_rt2ic;
            q_en_ic2rt_reg <= q_en_ic2rt;
       end
    end

    generate
        for (i = 0; i < NUM_RT; i++) begin
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    task_done_rt[i] <= '0;
                    context_switch_rt[i] <= '0;
                    thread_id_in_rt[i] <= '0;
                    pc_in_rt[i] <= '0;
                    stack_ptr_in_rt[i] <= '0;

                    job_dispatch_rt_reg[i] <= '0;
                    core_id_rt2ic_reg[i] <= '0;
                end
                else begin
                    task_done_rt[i] <= rx.c0.data[99];
                    context_switch_rt[i] <= rx.c0.data[10];
                    thread_id_in_rt[i] <= rx.c0.data[13:9];
                    pc_in_rt[i] <= rx.c0.data[127:96];
                    stack_ptr_in_rt[i] <= rx.c0.data[159:128];

                    job_dispatch_rt_reg[i] <= job_dispatch_rt[i];
                    core_id_rt2ic_reg[i] <= core_id_rt2ic[i];
                end
            end
        end
        for (i = 0; i < NUM_IC; i++) begin
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    context_switch_ic[i] <= '0;
                    thread_id_in_ic[i] <= '0;

                    job_dispatch_ic_reg[i] <= '0;
                    core_id_ic2rt_reg[i] <= '0;
                end
                else begin
                    context_switch_ic[i] <= rx.c0.data[255];
                    thread_id_in_ic[i] <= rx.c0.data[260:256];

                    job_dispatch_ic_reg[i] <= job_dispatch_ic[i];
                    core_id_ic2rt_reg[i] <= core_id_ic2rt[i];
                end
            end
        end
    endgenerate

    logic [63:0] tx_reg_0, tx_reg_1, tx_reg_2;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_reg_0 <= 64'h0;
            tx_reg_1 <= 64'h0;
            tx_reg_2 <= 64'h0;
        end
        else begin
            tx_reg_0 <= {core_id_ic2rt_reg[3],core_id_ic2rt_reg[2],core_id_ic2rt_reg[1],core_id_ic2rt_reg[0],
                        job_dispatch_ic_reg[3],job_dispatch_ic_reg[2],job_dispatch_ic_reg[1],job_dispatch_ic_reg[0],
                        core_id_rt2ic_reg[3],core_id_rt2ic_reg[2],core_id_rt2ic_reg[1],core_id_rt2ic_reg[0],
                        job_dispatch_rt_reg[3],job_dispatch_rt_reg[2],job_dispatch_rt_reg[1],job_dispatch_rt_reg[0],
                        q_en_ic2rt_reg,q_en_rt2ic_reg,thread_id_out_ic_reg,thread_id_out_rt_reg,patch_done_reg,{3'h0},
                        pixel_id_rt_reg};
            tx_reg_1 <= {pc_out_rt_reg,sp_out_rt_reg};
            tx_reg_2 <= tx_reg_0 & tx_reg_1;
        end
    end

    assign tx.c2.data = tx_reg_2;




    // wire rst_n;
    // assign rst_n = ~rst;

    // reg we_RT[3:0], re_RT[3:0];
    // reg re_MC;
    // reg [31:0] addr_RT[3:0], addr_MC;
	//  wire [31:0] addr_RT_bank[3:0];
    // wire rdy_RT[3:0], rdy_MC;
    // wire [127:0] data_RT_out[3:0], data_MC_out;

    // reg [127:0] data_RT_in[3:0];
	// logic [127:0] data_MC_out;
	// logic [127:0] data_MC_reg;
    // mem_main #(.NUM_THREAD(32)) mem_main(.clk(clk), .rst_n(rst_n), .re_RT(re_RT), .we_RT(we_RT), .addr_RT(addr_RT_bank), .data_RT_in(data_RT_in)
    // , .re_MC(re_MC), .data_RT_out(data_RT_out), .rd_rdy_RT(rdy_RT), .data_MC_out()
    // , .rdy_MC());
// 	assign addr_RT_bank[0] = re_MC ? addr_MC : addr_RT[0];
// 	assign addr_RT_bank[1] = addr_RT[1];
// 	assign addr_RT_bank[2] = addr_RT[2];
// 	assign addr_RT_bank[3] = addr_RT[3];
//     reg [63:0] data_out_0[3:0];
//     reg [63:0] data_out_1[1:0];
//     reg [63:0] data_out_2;
// 	reg [127:0] data_RT_out_reg[3:0];
//     always_ff @( posedge clk, negedge rst_n ) begin 
//         if (!rst_n) begin
//             data_out_0[0] <= 64'b0;
//             data_out_0[1] <= 64'b0;
//             data_out_0[2] <= 64'b0;
//             data_out_0[3] <= 64'b0;
//         end
//         else begin
//             data_out_0[0] <= data_RT_out_reg[0][63:0] & data_RT_out_reg[0][127:64];
//             data_out_0[1] <= data_RT_out_reg[1][63:0] & data_RT_out_reg[1][127:64];
//             data_out_0[2] <= data_RT_out_reg[2][63:0] & data_RT_out_reg[2][127:64];
//             data_out_0[3] <= data_RT_out_reg[3][63:0] & data_RT_out_reg[3][127:64];
//         end
//     end
//     always_ff @( posedge clk, negedge rst_n ) begin 
//         if (!rst_n) begin
//             data_out_1[0] <= 64'b0;
//             data_out_1[1] <= 64'b0;
//         end
//         else begin
//             data_out_1[0] <= data_out_0[0] & data_out_0[1]; 
//             data_out_1[1] <= data_out_0[2] & data_out_0[3]; 
//         end
//     end

//     always_ff @( posedge clk, negedge rst_n ) begin 
//         if (!rst_n)
//             data_out_2 <= 64'b0;
//         else 
//             data_out_2 <= data_out_1[0] & data_out_1[1];
//     end

// 	assign tx.c2.data = data_out_2;

//      always_ff @( posedge clk, negedge rst_n ) begin
//         if (!rst_n) begin 
//             addr_RT[0] <= 32'h00000000;
//             addr_RT[1] <= 32'h00100000;
//             addr_RT[2] <= 32'h00200000;
//             addr_RT[3] <= 32'h00300000;
// //            addr_MC <= 32'b0;
//         end
//         else begin
//              addr_RT[0] <= rx.c0.data[127:0];
//              addr_RT[1] <= rx.c0.data[255:128];
//              addr_RT[2] <= rx.c0.data[383:256];
//              addr_RT[3] <= rx.c0.data[511:384];
// //             addr_MC <= rx.c0.data[255:128];
//         end
//     end

//     always_ff @( posedge clk, negedge rst_n ) begin
//         if (!rst_n) begin 
//             data_RT_in[0] <= 32'h00000000;
//             data_RT_in[1] <= 32'h00000001;
//             data_RT_in[2] <= 32'h00000002;
//             data_RT_in[3] <= 32'h00000003;
//         end
//         else begin
//              data_RT_in[0] <= rx.c0.data[127:0];;
//              data_RT_in[1] <= rx.c0.data[255:128];
//              data_RT_in[2] <= rx.c0.data[383:256];
//              data_RT_in[3] <= rx.c0.data[511:384];
//         end
//     end

//      always_ff @( posedge clk, negedge rst_n ) begin
//         if (!rst_n) begin 
//             we_RT[0] <= 1'b1;
//             we_RT[1] <= 1'b1;
//             we_RT[2] <= 1'b1;
//             we_RT[3] <= 1'b1;
// 	re_RT[0] <= 1'b0;
// 	re_RT[1] <= 1'b0;
// 	re_RT[2] <= 1'b0;
// 	re_RT[3] <= 1'b0;
//         end
//         else begin
//             we_RT[0] <= we_RT[0];
//             we_RT[1] <= we_RT[1];
//             we_RT[2] <= we_RT[2];
//             we_RT[3] <= we_RT[3];
// re_RT[0] <= rx.c0.data[0];
//         re_RT[1] <= rx.c0.data[1];
//         re_RT[2] <= rx.c0.data[2];
//         re_RT[3] <= rx.c0.data[3]; 
//         end
//     end

//      always_ff @( posedge clk, negedge rst_n ) begin
//         if (!rst_n) begin 
//             re_MC <= 0;
//         end
//         else begin
//             re_MC <= rx.c0.data[6];
//         end
//     end
	 
// 	 always_ff @( posedge clk, negedge rst_n ) begin
//         if (!rst_n) begin 
//             addr_MC <= 32'b0;
//         end
//         else begin
//             addr_MC <= rx.c0.data[31:0];
//         end
//     end
   
//      //reg [127:0] data_RT_out_reg[3:0], data_MC_out_reg;
//      always_ff @( posedge clk, negedge rst_n ) begin
//         if (!rst_n) begin 
//             data_RT_out_reg[0] <= 128'b0;
//             data_RT_out_reg[1] <= 128'b0;
//             data_RT_out_reg[2] <= 128'b0;
//             data_RT_out_reg[3] <= 128'b0;
//             //data_MC_out_reg <= 128'b0;
//         end
//         else begin
//             data_RT_out_reg[0] <= data_RT_out[0];
//             data_RT_out_reg[1] <= data_RT_out[1];
//             data_RT_out_reg[2] <= data_RT_out[2];
//             data_RT_out_reg[3] <= data_RT_out[3];
//             //data_MC_out_reg <= data_MC_out;
//         end
//     end


endmodule