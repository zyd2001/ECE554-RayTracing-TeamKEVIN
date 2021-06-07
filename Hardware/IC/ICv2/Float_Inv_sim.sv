module Float_Inv (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
        input  wire        en,
		input  wire [31:0] a,      //      a.a
		output wire [31:0] q       //      q.q
	);
  
  shortreal in, temp;
  logic [31:0] out;
  logic [31:0] pip [7:0];

  assign in = $bitstoshortreal(a);
  
  assign temp = 1/in;
  
  assign out = $shortrealtobits(temp);

  genvar i;
  generate;
    for (i=1; i<8; ++i) begin
        always_ff@( posedge clk, posedge areset ) begin
            if (areset) 
                pip[i] <= '0;
            else if (en)
                pip[i] <= pip[i-1];
            else
                pip[i] <= '0;
        end
    end
  endgenerate

  always_ff @( posedge clk, posedge areset ) begin : internal_pipe
    if (areset) begin
        pip[0] <= '0;
    end else begin
        if (en) begin
            pip[0] <= out;
        end else begin
            pip[0] <= '0;
        end
    end  
  end
  
  assign q = pip[7];
  
endmodule

