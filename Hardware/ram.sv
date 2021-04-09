//single port
module ram(clk, we, din, addr, dout);
  parameter ADDR_WIDTH;
  parameter DATA_WIDTH;
  input clk;
  input we;
  input [ADDR_WIDTH-1:0] addr;
  input [DATA_WIDTH-1:0] din;
  output reg [DATA_WIDTH-1:0] dout;

  reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

  always @(posedge clk) begin
    if (we)
      ram[addr] <= din;
    dout <= ram[addr];
  end
endmodule
