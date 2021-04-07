module top_test(clk, rst);
    
    input clk, rst;

    wire rst_n;
    assign rst_n = ~rst;

    reg we_RT[3:0];
    reg re_MC;
    reg [31:0] addr_RT[3:0], data_RT_in[31:0], addr_MC;
    wire rdy_RT, rdy_MC;
    wire [31:0] data_RT_out[3:0], data_MC_out;
    mem_main main_mem(.clk(rst), .rst_n(rst_n), .we_RT(we_RT), .addr_RT(addr_RT), .data_RT_in(data_RT_in)
    , .addr_MC(addr_MC), .re_MC(re_MC), .data_RT_out(data_RT_out), .rdy_RT(rdy_RT), .data_MC_out(data_MC_out)
    , .rdy_MC(rdy_MC));

    // reg addr_inc;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            addr_RT[0] <= 32'b0;
            addr_RT[1] <= 32'b0;
            addr_RT[2] <= 32'b0;
            addr_RT[3] <= 32'b0;
            addr_MC <= 32'b0;
        end
        // else if (addr_inc) begin
        //     addr_RT[0] = addr_RT[0] + 32'b1;
        //     addr_RT[1] = addr_RT[1] + 32'b1;
        //     addr_RT[1] = addr_RT[1] + 32'b1;
        //     addr_RT[1] = addr_RT[1] + 32'b1;
        // end
    end

    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            data_RT_in[0] <= 32'b0;
            data_RT_in[1] <= 32'b0;
            data_RT_in[2] <= 32'b0;
            data_RT_in[3] <= 32'b0;
        end
    end

     always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            we_RT[0] <= 1;
            we_RT[1] <= 1;
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
            re_MC <= ~re_MC;
        end
    end
    
     reg [31:0] data_RT_out_reg[3:0], data_MC_out_reg;
     always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n) begin 
            data_RT_out_reg[0] <= 32'b0;
            data_RT_out_reg[1] <= 32'b0;
            data_RT_out_reg[2] <= 32'b0;
            data_RT_out_reg[3] <= 32'b0;
            data_MC_out_reg <= 32'b0;
        end
        else begin
            data_RT_out_reg[0] <= data_RT_out[0];
            data_RT_out_reg[1] <= data_RT_out[1];
            data_RT_out_reg[2] <= data_RT_out[2];
            data_RT_out_reg[3] <= data_RT_out[3];
            data_MC_out_reg <= data_MC_out;
        end
    end


endmodule