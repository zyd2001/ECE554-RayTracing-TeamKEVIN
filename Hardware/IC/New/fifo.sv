// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=45,
  parameter BITS=32
  )
  (
  input clk, rst, en,
  input [BITS-1:0] d,
  output [BITS-1:0] q
  );
  // your RTL code here
  logic [BITS-1:0] buffer[DEPTH-1:0];

  assign q = buffer[DEPTH-1];

  integer i;

  always_ff @(posedge clk, negedge rst)
    if (rst) begin
      for (i=0; i<DEPTH; i=i+1) buffer[i] <= '0;
    end
    else if (en) begin
      for (i=DEPTH-1; i>0; i=i-1) buffer[i] <= buffer[i-1];
      buffer[0] <= d;
    end

endmodule // fifo
