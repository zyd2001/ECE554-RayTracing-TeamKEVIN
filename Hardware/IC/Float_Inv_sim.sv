module Float_Inv (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [31:0] a,      //      a.a
		output wire [31:0] q       //      q.q
	);
  
  shortreal in, temp;
  logic [31:0] out, q_in;
  
  assign in = $bitstoshortreal(a);
  
  assign temp = 1/in;
  
  assign out = $shortrealtobits(temp);
  
    always_ff @( posedge clk, posedge areset ) begin
    if (areset) begin
        q_in <= 32'b0;
    end
    else begin
        q_in <= out;
    end
  end
  
  assign q = q_in;
  
endmodule

