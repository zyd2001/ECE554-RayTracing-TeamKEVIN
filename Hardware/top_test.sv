`include "platform_if.vh"
`include "afu_json_info.vh"
module top_test(clk, rst, rx, tx);
    
    input clk, rst;
    input  t_if_ccip_Rx rx;
    output t_if_ccip_Tx tx;

    wire rst_n;
    assign rst_n = ~rst;

    reg we_RT[3:0];
    reg re_MC;
    reg [31:0] addr_RT[3:0], addr_MC;
    wire rdy_RT[3:0], rdy_MC;
    wire [127:0] data_RT_out[3:0], data_MC_out;

    reg [127:0] data_RT_in[3:0];

    mem_main main_mem(.clk(clk), .rst_n(rst_n), .we_RT(we_RT), .addr_RT(addr_RT), .data_RT_in(data_RT_in)
    , .addr_MC(addr_MC), .re_MC(re_MC), .data_RT_out(data_RT_out), .rdy_RT(rdy_RT), .data_MC_out()
    , .rdy_MC());
	
    // assign data_RT_in[0] = rx.c0.data[127:0];
    // assign data_RT_in[1] = rx.c0.data[255:128]; 
    // assign data_RT_in[2] = rx.c0.data[383:256];
    // assign data_RT_in[3] = rx.c0.data[511:384];
	//  assign addr_RT[0] = rx.c0.data[127:0];
	//  assign addr_RT[1] = rx.c0.data[255:128];
	//  assign addr_RT[2] = rx.c0.data[383:256];
	//  assign addr_RT[3] = rx.c0.data[511:384];
	//  assign addr_MC =  rx.c0.data[255:128];
    wire [127:0] data_out;
	reg [127:0] data_RT_out_reg[3:0];
    assign data_out = data_RT_out_reg[0] & data_RT_out_reg[1] & data_RT_out_reg[2] & data_RT_out_reg[3];
    assign tx.c2.data = data_out;
	 /*wire we_RT[0] = rx.c0.data[256];
	 wire we_RT[1] = rx.c0.data[257];
	 wire we_RT[2] = rx.c0.data[258];
	 wire we_RT[3] = rx.c0.data[259];
	 wire re_MC = rx.c0.data[300];*/

     always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            addr_RT[0] <= 32'h00000000;
            addr_RT[1] <= 32'h00100000;
            addr_RT[2] <= 32'h00200000;
            addr_RT[3] <= 32'h00300000;
            addr_MC <= 32'b0;
        end
        else begin
             addr_RT[0] <= rx.c0.data[127:0];;
             addr_RT[1] <= rx.c0.data[255:128];
             addr_RT[2] <= rx.c0.data[383:256];
             addr_RT[3] <= rx.c0.data[511:384];
             addr_MC <= rx.c0.data[255:128];
        end
    end

    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            data_RT_in[0] <= 32'h00000000;
            data_RT_in[1] <= 32'h00000001;
            data_RT_in[2] <= 32'h00000002;
            data_RT_in[3] <= 32'h00000003;
        end
        else begin
             data_RT_in[0] <= rx.c0.data[127:0];;
             data_RT_in[1] <= rx.c0.data[255:128];
             data_RT_in[2] <= rx.c0.data[383:256];
             data_RT_in[3] <= rx.c0.data[511:384];
        end
    end

/*
    // reg addr_inc;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            addr_RT[0] <= 32'h00000000;
            addr_RT[1] <= 32'h00100000;
            addr_RT[2] <= 32'h00200000;
            addr_RT[3] <= 32'h00300000;
            addr_MC <= 32'b0;
        end
        else begin
             addr_RT[0] <= {addr_RT[0][31:22], {addr_RT[0][21:16] + 6'b1}, {addr_RT[0][15:0] + 16'b1}};
             addr_RT[1] <= {addr_RT[1][31:22], {addr_RT[1][21:16] + 6'b1}, {addr_RT[1][15:0] + 16'b1}};
             addr_RT[2] <= {addr_RT[2][31:22], {addr_RT[2][21:16] + 6'b1}, {addr_RT[2][15:0] + 16'b1}};
             addr_RT[3] <= {addr_RT[3][31:22], {addr_RT[3][21:16] + 6'b1}, {addr_RT[3][15:0] + 16'b1}};
             addr_MC <= addr_MC + 32'b1;
        end
    end

    // always_ff @( posedge clk, negedge rst_n ) begin
    //     if (!rst_n) begin 
    //         data_RT_in[0] <= 128'b0;
    //         data_RT_in[1] <= 128'b0;
    //         data_RT_in[2] <= 128'b0;
    //         data_RT_in[3] <= 128'b0;
    //     end
    // end
*/
     always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            we_RT[0] <= 0;
            we_RT[1] <= 0;
            we_RT[2] <= 0;
            we_RT[3] <= 0;
        end
        else begin
            we_RT[0] <= ~we_RT[0];
            we_RT[1] <= ~we_RT[1];
            we_RT[2] <= ~we_RT[2];
            we_RT[3] <= ~we_RT[3]; 
        end
    end

     always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            re_MC <= 0;
        end
        else begin
            re_MC <= re_MC;
        end
    end
   
     //reg [127:0] data_RT_out_reg[3:0], data_MC_out_reg;
     always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            data_RT_out_reg[0] <= 128'b0;
            data_RT_out_reg[1] <= 128'b0;
            data_RT_out_reg[2] <= 128'b0;
            data_RT_out_reg[3] <= 128'b0;
            //data_MC_out_reg <= 128'b0;
        end
        else begin
            data_RT_out_reg[0] <= data_RT_out[0];
            data_RT_out_reg[1] <= data_RT_out[1];
            data_RT_out_reg[2] <= data_RT_out[2];
            data_RT_out_reg[3] <= data_RT_out[3];
            //data_MC_out_reg <= data_MC_out;
        end
    end


endmodule