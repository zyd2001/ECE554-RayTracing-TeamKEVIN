	component Fix_Mul is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			rst    : in  std_logic                     := 'X';             -- reset
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			a      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a
			b      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- b
			result : out std_logic_vector(63 downto 0)                     -- result
		);
	end component Fix_Mul;

	u0 : component Fix_Mul
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			rst    => CONNECTED_TO_rst,    --    rst.reset
			en     => CONNECTED_TO_en,     --     en.en
			a      => CONNECTED_TO_a,      --      a.a
			b      => CONNECTED_TO_b,      --      b.b
			result => CONNECTED_TO_result  -- result.result
		);

