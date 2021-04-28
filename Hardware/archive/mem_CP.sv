module mem_CP(clk, rst_n, re_CP, data_MC, ctrl_MC, invalid_CP, data_out_PD);

    parameter DEPTH = 65536;
    localparam BIT_ADDR = $clog2(DEPTH);
    /*
        Input
    */
    input clk, rst_n;
    // CP
    input re_CP;
    // MC
    input [31:0] data_MC;
    input [1:0] ctrl_MC;
    logic we_MC, wrdone_MC;
    assign we_MC = ctrl_MC[0];
    assign wrdone_MC = ctrl_MC[1];
    /*
        Output
    */
    // CP
    output [31:0] data_out_PD;
    output invalid_CP;

    logic busy_reg, read_end_reg, read_end_reg2;
    logic unsigned [BIT_ADDR-1:0] addr_cnt;
    logic unsigned [BIT_ADDR-1:0] max_addr;
    assign invalid_CP = we_MC | busy_reg | read_end_reg2;
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            read_end_reg <= 1'b0;
            read_end_reg2 <= 1'b0;
        end
        else if(wrdone_MC) begin
            read_end_reg <= 1'b0;
            read_end_reg2 <= 1'b0;
        end
        else begin
            read_end_reg <= &addr_cnt | (addr_cnt > max_addr);
            read_end_reg2 <= read_end_reg2 ? read_end_reg2 : (addr_cnt > max_addr) | read_end_reg;
        end
    end
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            addr_cnt <= '0;
            max_addr <= '0;
            busy_reg <= 1'b0;
        end
        else if(wrdone_MC) begin
            addr_cnt <= '0;
            max_addr <= max_addr;
            busy_reg <= 1'b0;
        end
        else if(we_MC) begin
            addr_cnt <= addr_cnt + 1;
            max_addr <= addr_cnt;
            busy_reg <= 1'b1;
        end
        else if (re_CP) begin
            addr_cnt <= ((addr_cnt > max_addr) | read_end_reg) ? '0 : addr_cnt + 1;
            max_addr <= max_addr;
            busy_reg <= busy_reg;
        end
        else begin
            addr_cnt <= addr_cnt;
            max_addr <= max_addr;
            busy_reg <= busy_reg;
        end
    end
    // mem modules
    single_port_ram #(.ADDR_WIDTH(BIT_ADDR), .DATA_WIDTH(32)) ram (.clk(clk), .we(we_MC),
                    .data(data_MC), .addr(addr_cnt), .q(data_out_PD));
    
endmodule