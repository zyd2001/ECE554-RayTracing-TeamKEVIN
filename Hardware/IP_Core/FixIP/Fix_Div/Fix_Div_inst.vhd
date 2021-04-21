	component Fix_Div is
		port (
			clk         : in  std_logic                     := 'X';             -- clk
			rst         : in  std_logic                     := 'X';             -- reset
			en          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			numerator   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- numerator
			denominator : in  std_logic_vector(31 downto 0) := (others => 'X'); -- denominator
			result      : out std_logic_vector(31 downto 0)                     -- result
		);
	end component Fix_Div;

	u0 : component Fix_Div
		port map (
			clk         => CONNECTED_TO_clk,         --         clk.clk
			rst         => CONNECTED_TO_rst,         --         rst.reset
			en          => CONNECTED_TO_en,          --          en.en
			numerator   => CONNECTED_TO_numerator,   --   numerator.numerator
			denominator => CONNECTED_TO_denominator, -- denominator.denominator
			result      => CONNECTED_TO_result       --      result.result
		);

