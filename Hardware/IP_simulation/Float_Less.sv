module Float_Less (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
        input  wire        en,
		input  wire [31:0] a,      //      a.a
		input  wire [31:0] b,      //      b.b
		output wire [0:0]  q       //      q.q
	);
  
  shortreal in_a, in_b;
  logic out, q_in;
  
  assign in_a = $bitstoshortreal(a);
  assign in_b = $bitstoshortreal(b);
  
  assign out = in_a < in_b;
  
  always_ff @( posedge clk, posedge areset ) begin
    if (areset) begin
      q_in <= 1'b0;
    end
    else if (en) begin
      q_in <= out;
    end else
        q_in <= '0;
  end
  
  assign q = en ? q_in : '0;
  
endmodule

