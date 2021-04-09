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
	
    reg [63:0] data_out_0[3:0];
    reg [63:0] data_out_1[1:0];
    reg [63:0] data_out_2;
	reg [127:0] data_RT_out_reg[3:0];
    always_ff @( posedge clk, negedge rst_n ) begin 
        if (!rst_n) begin
            data_out_0[0] <= 64'b0;
            data_out_0[1] <= 64'b0;
            data_out_0[2] <= 64'b0;
            data_out_0[3] <= 64'b0;
        end
        else begin
            data_out_0[0] <= data_RT_out_reg[0][63:0] & data_RT_out_reg[0][127:64];
            data_out_0[1] <= data_RT_out_reg[1][63:0] & data_RT_out_reg[1][127:64];
            data_out_0[2] <= data_RT_out_reg[2][63:0] & data_RT_out_reg[2][127:64];
            data_out_0[3] <= data_RT_out_reg[3][63:0] & data_RT_out_reg[3][127:64];
        end
    end
    always_ff @( posedge clk, negedge rst_n ) begin 
        if (!rst_n) begin
            data_out_1[0] <= 64'b0;
            data_out_1[1] <= 64'b0;
        end
        else begin
            data_out_1[0] <= data_out_0[0] & data_out_0[1]; 
            data_out_1[1] <= data_out_0[2] & data_out_0[3]; 
        end
    end

    always_ff @( posedge clk, negedge rst_n ) begin 
        if (!rst_n)
            data_out_2 <= 64'b;
        else 
            data_out_2 <= data_out_1[0] & data_out_1[1];
    end

    assign tx.c2.data = data_out_2;

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

     always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            we_RT[0] <= 1'b1;
            we_RT[1] <= 1'b1;
            we_RT[2] <= 1'b1;
            we_RT[3] <= 1'b1;
        end
        else begin
            we_RT[0] <= we_RT[0];
            we_RT[1] <= we_RT[1];
            we_RT[2] <= we_RT[2];
            we_RT[3] <= we_RT[3]; 
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