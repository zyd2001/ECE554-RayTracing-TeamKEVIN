	component Float_MulAdd is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			a      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a
			b      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- b
			c      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- c
			q      : out std_logic_vector(31 downto 0)                     -- q
		);
	end component Float_MulAdd;

	u0 : component Float_MulAdd
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			areset => CONNECTED_TO_areset, -- areset.reset
			a      => CONNECTED_TO_a,      --      a.a
			b      => CONNECTED_TO_b,      --      b.b
			c      => CONNECTED_TO_c,      --      c.c
			q      => CONNECTED_TO_q       --      q.q
		);

