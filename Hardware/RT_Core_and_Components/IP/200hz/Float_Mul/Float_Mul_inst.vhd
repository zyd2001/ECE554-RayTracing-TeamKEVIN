	component Float_Mul is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			a      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a
			b      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- b
			q      : out std_logic_vector(31 downto 0)                     -- q
		);
	end component Float_Mul;

	u0 : component Float_Mul
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			areset => CONNECTED_TO_areset, -- areset.reset
			en     => CONNECTED_TO_en,     --     en.en
			a      => CONNECTED_TO_a,      --      a.a
			b      => CONNECTED_TO_b,      --      b.b
			q      => CONNECTED_TO_q       --      q.q
		);

