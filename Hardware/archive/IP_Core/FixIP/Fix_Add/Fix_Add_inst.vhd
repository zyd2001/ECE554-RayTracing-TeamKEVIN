	component Fix_Add is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			rst    : in  std_logic                     := 'X';             -- reset
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			a0     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a0
			a1     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a1
			result : out std_logic_vector(32 downto 0)                     -- result
		);
	end component Fix_Add;

	u0 : component Fix_Add
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			rst    => CONNECTED_TO_rst,    --    rst.reset
			en     => CONNECTED_TO_en,     --     en.en
			a0     => CONNECTED_TO_a0,     --     a0.a0
			a1     => CONNECTED_TO_a1,     --     a1.a1
			result => CONNECTED_TO_result  -- result.result
		);

