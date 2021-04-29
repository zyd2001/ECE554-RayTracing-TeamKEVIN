-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.2 (Release Build #57)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from Float_Grtr_altera_fp_functions_191_ab2jp6a
-- VHDL created on Sun Apr 25 10:06:12 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;

library fourteennm;
use fourteennm.fourteennm_components.fourteennm_mac;
use fourteennm.fourteennm_components.fourteennm_fp_mac;

entity Float_Grtr_altera_fp_functions_191_ab2jp6a is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end Float_Grtr_altera_fp_functions_191_ab2jp6a;

architecture normal of Float_Grtr_altera_fp_functions_191_ab2jp6a is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpCompareTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid7_fpCompareTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid8_fpCompareTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid9_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid10_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid11_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid16_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid23_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid24_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid25_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid26_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid28_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid30_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid34_fpCompareTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid34_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid39_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotZero_uid40_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXPS_uid41_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXPS_uid41_fpCompareTest_qi : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXPS_uid41_fpCompareTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYPS_uid42_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYPS_uid42_fpCompareTest_qi : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYPS_uid42_fpCompareTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expFracX_uid43_fpCompareTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid45_fpCompareTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid47_fpCompareTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid47_fpCompareTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid47_fpCompareTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid47_fpCompareTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid48_fpCompareTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid48_fpCompareTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid48_fpCompareTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid48_fpCompareTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid52_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid53_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid54_fpCompareTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSYSX_uid55_fpCompareTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxGTsy_uid56_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid57_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid58_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid59_fpCompareTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid59_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid62_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid63_fpCompareTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid63_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid64_fpCompareTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid64_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid65_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid66_fpCompareTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid66_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_rc2_uid63_fpCompareTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_signY_uid53_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_signX_uid52_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_oneIsNaN_uid34_fpCompareTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_exp_y_uid23_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_exp_x_uid9_fpCompareTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstAllZWE_uid8_fpCompareTest(CONSTANT,7)
    cstAllZWE_uid8_fpCompareTest_q <= "00000000";

    -- exp_y_uid23_fpCompareTest(BITSELECT,22)@0
    exp_y_uid23_fpCompareTest_b <= b(30 downto 23);

    -- excZ_y_uid25_fpCompareTest(LOGICAL,24)@0
    excZ_y_uid25_fpCompareTest_q <= "1" WHEN exp_y_uid23_fpCompareTest_b = cstAllZWE_uid8_fpCompareTest_q ELSE "0";

    -- yNotZero_uid40_fpCompareTest(LOGICAL,39)@0
    yNotZero_uid40_fpCompareTest_q <= not (excZ_y_uid25_fpCompareTest_q);

    -- exp_x_uid9_fpCompareTest(BITSELECT,8)@0
    exp_x_uid9_fpCompareTest_b <= a(30 downto 23);

    -- excZ_x_uid11_fpCompareTest(LOGICAL,10)@0
    excZ_x_uid11_fpCompareTest_q <= "1" WHEN exp_x_uid9_fpCompareTest_b = cstAllZWE_uid8_fpCompareTest_q ELSE "0";

    -- xNotZero_uid39_fpCompareTest(LOGICAL,38)@0
    xNotZero_uid39_fpCompareTest_q <= not (excZ_x_uid11_fpCompareTest_q);

    -- oneNonZero_uid62_fpCompareTest(LOGICAL,61)@0
    oneNonZero_uid62_fpCompareTest_q <= xNotZero_uid39_fpCompareTest_q or yNotZero_uid40_fpCompareTest_q;

    -- two_uid54_fpCompareTest(CONSTANT,53)
    two_uid54_fpCompareTest_q <= "10";

    -- signY_uid53_fpCompareTest(BITSELECT,52)@0
    signY_uid53_fpCompareTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid52_fpCompareTest(BITSELECT,51)@0
    signX_uid52_fpCompareTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- concSYSX_uid55_fpCompareTest(BITJOIN,54)@0
    concSYSX_uid55_fpCompareTest_q <= signY_uid53_fpCompareTest_b & signX_uid52_fpCompareTest_b;

    -- sxGTsy_uid56_fpCompareTest(LOGICAL,55)@0
    sxGTsy_uid56_fpCompareTest_q <= "1" WHEN concSYSX_uid55_fpCompareTest_q = two_uid54_fpCompareTest_q ELSE "0";

    -- rc2_uid63_fpCompareTest(LOGICAL,62)@0 + 1
    rc2_uid63_fpCompareTest_qi <= sxGTsy_uid56_fpCompareTest_q and oneNonZero_uid62_fpCompareTest_q;
    rc2_uid63_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => rc2_uid63_fpCompareTest_qi, xout => rc2_uid63_fpCompareTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist0_rc2_uid63_fpCompareTest_q_2(DELAY,67)
    redist0_rc2_uid63_fpCompareTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_rc2_uid63_fpCompareTest_q_2_q <= (others => '0');
            ELSE
                redist0_rc2_uid63_fpCompareTest_q_2_q <= STD_LOGIC_VECTOR(rc2_uid63_fpCompareTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_exp_y_uid23_fpCompareTest_b_1(DELAY,71)
    redist4_exp_y_uid23_fpCompareTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_exp_y_uid23_fpCompareTest_b_1_q <= (others => '0');
            ELSE
                redist4_exp_y_uid23_fpCompareTest_b_1_q <= STD_LOGIC_VECTOR(exp_y_uid23_fpCompareTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- frac_y_uid24_fpCompareTest(BITSELECT,23)@0
    frac_y_uid24_fpCompareTest_b <= b(22 downto 0);

    -- fracYPS_uid42_fpCompareTest(LOGICAL,41)@0 + 1
    fracYPS_uid42_fpCompareTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 1 => yNotZero_uid40_fpCompareTest_q(0)) & yNotZero_uid40_fpCompareTest_q));
    fracYPS_uid42_fpCompareTest_qi <= frac_y_uid24_fpCompareTest_b and fracYPS_uid42_fpCompareTest_b;
    fracYPS_uid42_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYPS_uid42_fpCompareTest_qi, xout => fracYPS_uid42_fpCompareTest_q, clk => clk, aclr => areset, ena => '1' );

    -- expFracY_uid45_fpCompareTest(BITJOIN,44)@1
    expFracY_uid45_fpCompareTest_q <= redist4_exp_y_uid23_fpCompareTest_b_1_q & fracYPS_uid42_fpCompareTest_q;

    -- redist5_exp_x_uid9_fpCompareTest_b_1(DELAY,72)
    redist5_exp_x_uid9_fpCompareTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_exp_x_uid9_fpCompareTest_b_1_q <= (others => '0');
            ELSE
                redist5_exp_x_uid9_fpCompareTest_b_1_q <= STD_LOGIC_VECTOR(exp_x_uid9_fpCompareTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- frac_x_uid10_fpCompareTest(BITSELECT,9)@0
    frac_x_uid10_fpCompareTest_b <= a(22 downto 0);

    -- fracXPS_uid41_fpCompareTest(LOGICAL,40)@0 + 1
    fracXPS_uid41_fpCompareTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 1 => xNotZero_uid39_fpCompareTest_q(0)) & xNotZero_uid39_fpCompareTest_q));
    fracXPS_uid41_fpCompareTest_qi <= frac_x_uid10_fpCompareTest_b and fracXPS_uid41_fpCompareTest_b;
    fracXPS_uid41_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXPS_uid41_fpCompareTest_qi, xout => fracXPS_uid41_fpCompareTest_q, clk => clk, aclr => areset, ena => '1' );

    -- expFracX_uid43_fpCompareTest(BITJOIN,42)@1
    expFracX_uid43_fpCompareTest_q <= redist5_exp_x_uid9_fpCompareTest_b_1_q & fracXPS_uid41_fpCompareTest_q;

    -- efxLTefy_uid48_fpCompareTest(COMPARE,47)@1
    efxLTefy_uid48_fpCompareTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid43_fpCompareTest_q);
    efxLTefy_uid48_fpCompareTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid45_fpCompareTest_q);
    efxLTefy_uid48_fpCompareTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid48_fpCompareTest_a) - UNSIGNED(efxLTefy_uid48_fpCompareTest_b));
    efxLTefy_uid48_fpCompareTest_c(0) <= efxLTefy_uid48_fpCompareTest_o(32);

    -- efxGTefy_uid47_fpCompareTest(COMPARE,46)@1
    efxGTefy_uid47_fpCompareTest_a <= STD_LOGIC_VECTOR("00" & expFracY_uid45_fpCompareTest_q);
    efxGTefy_uid47_fpCompareTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid43_fpCompareTest_q);
    efxGTefy_uid47_fpCompareTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid47_fpCompareTest_a) - UNSIGNED(efxGTefy_uid47_fpCompareTest_b));
    efxGTefy_uid47_fpCompareTest_c(0) <= efxGTefy_uid47_fpCompareTest_o(32);

    -- redist2_signX_uid52_fpCompareTest_b_1(DELAY,69)
    redist2_signX_uid52_fpCompareTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_signX_uid52_fpCompareTest_b_1_q <= (others => '0');
            ELSE
                redist2_signX_uid52_fpCompareTest_b_1_q <= STD_LOGIC_VECTOR(signX_uid52_fpCompareTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expFracCompMux_uid59_fpCompareTest(MUX,58)@1
    expFracCompMux_uid59_fpCompareTest_s <= redist2_signX_uid52_fpCompareTest_b_1_q;
    expFracCompMux_uid59_fpCompareTest_combproc: PROCESS (expFracCompMux_uid59_fpCompareTest_s, efxGTefy_uid47_fpCompareTest_c, efxLTefy_uid48_fpCompareTest_c)
    BEGIN
        CASE (expFracCompMux_uid59_fpCompareTest_s) IS
            WHEN "0" => expFracCompMux_uid59_fpCompareTest_q <= efxGTefy_uid47_fpCompareTest_c;
            WHEN "1" => expFracCompMux_uid59_fpCompareTest_q <= efxLTefy_uid48_fpCompareTest_c;
            WHEN OTHERS => expFracCompMux_uid59_fpCompareTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_signY_uid53_fpCompareTest_b_1(DELAY,68)
    redist1_signY_uid53_fpCompareTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_signY_uid53_fpCompareTest_b_1_q <= (others => '0');
            ELSE
                redist1_signY_uid53_fpCompareTest_b_1_q <= STD_LOGIC_VECTOR(signY_uid53_fpCompareTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- xorSigns_uid57_fpCompareTest(LOGICAL,56)@1
    xorSigns_uid57_fpCompareTest_q <= redist2_signX_uid52_fpCompareTest_b_1_q xor redist1_signY_uid53_fpCompareTest_b_1_q;

    -- sxEQsy_uid58_fpCompareTest(LOGICAL,57)@1
    sxEQsy_uid58_fpCompareTest_q <= not (xorSigns_uid57_fpCompareTest_q);

    -- sxEQsyExpFracCompMux_uid64_fpCompareTest(LOGICAL,63)@1 + 1
    sxEQsyExpFracCompMux_uid64_fpCompareTest_qi <= sxEQsy_uid58_fpCompareTest_q and expFracCompMux_uid59_fpCompareTest_q;
    sxEQsyExpFracCompMux_uid64_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sxEQsyExpFracCompMux_uid64_fpCompareTest_qi, xout => sxEQsyExpFracCompMux_uid64_fpCompareTest_q, clk => clk, aclr => areset, ena => '1' );

    -- r_uid65_fpCompareTest(LOGICAL,64)@2
    r_uid65_fpCompareTest_q <= sxEQsyExpFracCompMux_uid64_fpCompareTest_q or redist0_rc2_uid63_fpCompareTest_q_2_q;

    -- cstZeroWF_uid7_fpCompareTest(CONSTANT,6)
    cstZeroWF_uid7_fpCompareTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid27_fpCompareTest(LOGICAL,26)@0
    fracXIsZero_uid27_fpCompareTest_q <= "1" WHEN cstZeroWF_uid7_fpCompareTest_q = frac_y_uid24_fpCompareTest_b ELSE "0";

    -- fracXIsNotZero_uid28_fpCompareTest(LOGICAL,27)@0
    fracXIsNotZero_uid28_fpCompareTest_q <= not (fracXIsZero_uid27_fpCompareTest_q);

    -- cstAllOWE_uid6_fpCompareTest(CONSTANT,5)
    cstAllOWE_uid6_fpCompareTest_q <= "11111111";

    -- expXIsMax_uid26_fpCompareTest(LOGICAL,25)@0
    expXIsMax_uid26_fpCompareTest_q <= "1" WHEN exp_y_uid23_fpCompareTest_b = cstAllOWE_uid6_fpCompareTest_q ELSE "0";

    -- excN_y_uid30_fpCompareTest(LOGICAL,29)@0
    excN_y_uid30_fpCompareTest_q <= expXIsMax_uid26_fpCompareTest_q and fracXIsNotZero_uid28_fpCompareTest_q;

    -- fracXIsZero_uid13_fpCompareTest(LOGICAL,12)@0
    fracXIsZero_uid13_fpCompareTest_q <= "1" WHEN cstZeroWF_uid7_fpCompareTest_q = frac_x_uid10_fpCompareTest_b ELSE "0";

    -- fracXIsNotZero_uid14_fpCompareTest(LOGICAL,13)@0
    fracXIsNotZero_uid14_fpCompareTest_q <= not (fracXIsZero_uid13_fpCompareTest_q);

    -- expXIsMax_uid12_fpCompareTest(LOGICAL,11)@0
    expXIsMax_uid12_fpCompareTest_q <= "1" WHEN exp_x_uid9_fpCompareTest_b = cstAllOWE_uid6_fpCompareTest_q ELSE "0";

    -- excN_x_uid16_fpCompareTest(LOGICAL,15)@0
    excN_x_uid16_fpCompareTest_q <= expXIsMax_uid12_fpCompareTest_q and fracXIsNotZero_uid14_fpCompareTest_q;

    -- oneIsNaN_uid34_fpCompareTest(LOGICAL,33)@0 + 1
    oneIsNaN_uid34_fpCompareTest_qi <= excN_x_uid16_fpCompareTest_q or excN_y_uid30_fpCompareTest_q;
    oneIsNaN_uid34_fpCompareTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => oneIsNaN_uid34_fpCompareTest_qi, xout => oneIsNaN_uid34_fpCompareTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist3_oneIsNaN_uid34_fpCompareTest_q_2(DELAY,70)
    redist3_oneIsNaN_uid34_fpCompareTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_oneIsNaN_uid34_fpCompareTest_q_2_q <= (others => '0');
            ELSE
                redist3_oneIsNaN_uid34_fpCompareTest_q_2_q <= STD_LOGIC_VECTOR(oneIsNaN_uid34_fpCompareTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rPostExc_uid66_fpCompareTest(MUX,65)@2
    rPostExc_uid66_fpCompareTest_s <= redist3_oneIsNaN_uid34_fpCompareTest_q_2_q;
    rPostExc_uid66_fpCompareTest_combproc: PROCESS (rPostExc_uid66_fpCompareTest_s, r_uid65_fpCompareTest_q, GND_q)
    BEGIN
        CASE (rPostExc_uid66_fpCompareTest_s) IS
            WHEN "0" => rPostExc_uid66_fpCompareTest_q <= r_uid65_fpCompareTest_q;
            WHEN "1" => rPostExc_uid66_fpCompareTest_q <= GND_q;
            WHEN OTHERS => rPostExc_uid66_fpCompareTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xOut(GPOUT,4)@2
    q <= rPostExc_uid66_fpCompareTest_q;

END normal;
