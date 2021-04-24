module mem_simple(clk, rst_n, we, addr, data_in, data_MC, ctrl_MC, busy, data_out);

    parameter DEPTH = 512;
    localparam BIT_ADDR = $clog2(DEPTH);
    /*
        Input
    */
    input clk, rst_n;
    // DUT
    input we;
    input unsigned [31:0] addr;
    input [31:0] data_in;
    // MC
    input [31:0] data_MC;
    input [1:0] ctrl_MC;
    logic we_MC, wrdone_MC;
    assign we_MC = ctrl_MC[0];
    assign wrdone_MC = ctrl_MC[1];
    /*
        Output
    */
    // DUT
    output [31:0] data_out;
    output busy;

    logic busy_reg;
    logic unsigned [BIT_ADDR-1:0] mc_wr_addr_cnt, addr_ram;
    logic [31:0] data_ram;
    assign data_ram = we_MC ? data_MC : data_in;
    assign addr_ram = we_MC ? mc_wr_addr_cnt : addr[BIT_ADDR+1:2];
    assign busy = busy_reg | we_MC;
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            mc_wr_addr_cnt <= '0;
        end
        else if(wrdone_MC) begin
            mc_wr_addr_cnt <= '0;
        end
        else if(we_MC) begin
            mc_wr_addr_cnt <= mc_wr_addr_cnt + 1;
        end
        else begin
            mc_wr_addr_cnt <= mc_wr_addr_cnt;
        end
    end
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            busy_reg <= 1'b0;
        end
        else begin
            busy_reg <= we_MC;
        end
    end
    // mem modules
    single_port_ram #(.ADDR_WIDTH(BIT_ADDR), .DATA_WIDTH(32)) ram (.clk(clk), .we(we|we_MC),
                    .data(data_ram), .addr(addr_ram), .q(data_out));
    
endmodule