module Float_Mul (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [0:0]  en,     //     en.en
		input  wire [31:0] a,      //      a.a
		input  wire [31:0] b,      //      b.b
		output wire [31:0] q       //      q.q
	);
  
  shortreal in_a, in_b, temp;
  logic [31:0] out, q_in;
  
  
  always_comb begin
    in_a = $bitstoshortreal(a);
    in_b = $bitstoshortreal(b);
    temp = in_a * in_b;
    out = $shortrealtobits(temp);
  end
  
  always_ff @( posedge clk, posedge areset ) begin
    if (areset) begin
      q_in <= 32'b0;
    end
    else if (en) begin
      q_in <= out;
    end
  end
  
  assign q = q_in;
  
endmodule

