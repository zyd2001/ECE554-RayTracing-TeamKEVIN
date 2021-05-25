# Intel IP
You can treat them as .sv files and initiate them as a normal module. Their interface can be found in `<ipxact:ports><\ipxact:ports>`

Example about how to use the Arria IP:
```Verilog 
Float_Add Adder (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'h1),       //   input,   width = 1,     en.en
		.a      (op1),             //   input,  width = 32,      a.a
		.b      (op2),             //   input,  width = 32,      b.b
		.q      (Adder_result),       //  output,  width = 32,      q.q
		.opSel  (!operation[0])       //   input,   width = 1,  opSel.opSel
	);
```

