	component Fix_Sqrt is
		port (
			clk     : in  std_logic                     := 'X';             -- clk
			rst     : in  std_logic                     := 'X';             -- reset
			en      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			radical : in  std_logic_vector(31 downto 0) := (others => 'X'); -- radical
			result  : out std_logic_vector(31 downto 0)                     -- result
		);
	end component Fix_Sqrt;

	u0 : component Fix_Sqrt
		port map (
			clk     => CONNECTED_TO_clk,     --     clk.clk
			rst     => CONNECTED_TO_rst,     --     rst.reset
			en      => CONNECTED_TO_en,      --      en.en
			radical => CONNECTED_TO_radical, -- radical.radical
			result  => CONNECTED_TO_result   --  result.result
		);

