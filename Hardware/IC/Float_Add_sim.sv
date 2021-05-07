module Float_Add (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [0:0]  en,     //     en.en
		input  wire [31:0] a,      //      a.a
		input  wire [31:0] b,      //      b.b
		output wire [31:0] q,      //      q.q
		input  wire [0:0]  opSel   //  opSel.opSel
	);
  
  shortreal in_a, in_b, temp;
  logic [31:0] out, q_in;
  
  assign in_a = $bitstoshortreal(a);
  assign in_b = $bitstoshortreal(b);
  
  assign temp = opSel ? (in_a + in_b) : (in_a - in_b);
  
  assign out = $shortrealtobits(temp);
  
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

