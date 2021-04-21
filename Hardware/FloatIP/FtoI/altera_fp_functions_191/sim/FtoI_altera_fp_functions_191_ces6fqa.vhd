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

-- VHDL created from FtoI_altera_fp_functions_191_ces6fqa
-- VHDL created on Tue Apr 20 22:58:12 2021


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

entity FtoI_altera_fp_functions_191_ces6fqa is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- sfix32
        clk : in std_logic;
        areset : in std_logic
    );
end FtoI_altera_fp_functions_191_ces6fqa;

architecture normal of FtoI_altera_fp_functions_191_ces6fqa is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpToFxPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid7_fpToFxPTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid8_fpToFxPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid9_fpToFxPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid10_fpToFxPTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid11_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid15_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid15_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid16_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostZ_uid23_fpToFxPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostZ_uid23_fpToFxPTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal invExcXZ_uid24_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid24_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid25_fpToFxPTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal signX_uid27_fpToFxPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal notNan_uid28_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid29_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid29_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpVal_uid30_fpToFxPTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal ovfExpRange_uid31_fpToFxPTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal ovfExpRange_uid31_fpToFxPTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ovfExpRange_uid31_fpToFxPTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal ovfExpRange_uid31_fpToFxPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal udfExpVal_uid32_fpToFxPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal udf_uid33_fpToFxPTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal udf_uid33_fpToFxPTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal udf_uid33_fpToFxPTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal udf_uid33_fpToFxPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpVal_uid34_fpToFxPTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValE_uid35_fpToFxPTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftValE_uid35_fpToFxPTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftValE_uid35_fpToFxPTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftValE_uid35_fpToFxPTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal shiftValRaw_uid36_fpToFxPTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValRaw_uid36_fpToFxPTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal maxShiftCst_uid37_fpToFxPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftOutOfRange_uid38_fpToFxPTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftOutOfRange_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftOutOfRange_uid38_fpToFxPTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftOutOfRange_uid38_fpToFxPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid39_fpToFxPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid39_fpToFxPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shifterIn_uid41_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal maxPosValueS_uid43_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal maxNegValueS_uid44_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zRightShiferNoStickyOut_uid45_fpToFxPTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xXorSignE_uid46_fpToFxPTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xXorSignE_uid46_fpToFxPTest_qi : STD_LOGIC_VECTOR (32 downto 0);
    signal xXorSignE_uid46_fpToFxPTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal d0_uid47_fpToFxPTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal sPostRndFull_uid48_fpToFxPTest_a : STD_LOGIC_VECTOR (33 downto 0);
    signal sPostRndFull_uid48_fpToFxPTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal sPostRndFull_uid48_fpToFxPTest_o : STD_LOGIC_VECTOR (33 downto 0);
    signal sPostRndFull_uid48_fpToFxPTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sPostRnd_uid49_fpToFxPTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal sPostRnd_uid49_fpToFxPTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal sPostRnd_uid50_fpToFxPTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal sPostRnd_uid50_fpToFxPTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal rndOvfPos_uid51_fpToFxPTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal rndOvfPos_uid51_fpToFxPTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal rndOvfPos_uid51_fpToFxPTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal rndOvfPos_uid51_fpToFxPTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfPostRnd_uid52_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal muxSelConc_uid53_fpToFxPTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal muxSel_uid54_fpToFxPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal maxNegValueU_uid55_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal finalOut_uid56_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal finalOut_uid56_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng1_uid60_rightShiferNoStickyOut_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage0Idx1_uid62_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2Rng2_uid63_rightShiferNoStickyOut_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage0Idx2Pad2_uid64_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx2_uid65_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx3Rng3_uid66_rightShiferNoStickyOut_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal rightShiftStage0Idx3Pad3_uid67_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx3_uid68_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx1Rng4_uid71_rightShiferNoStickyOut_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx1Pad4_uid72_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx1_uid73_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx2Rng8_uid74_rightShiferNoStickyOut_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx2_uid76_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx3Rng12_uid77_rightShiferNoStickyOut_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal rightShiftStage1Idx3Pad12_uid78_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid79_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng16_uid82_rightShiferNoStickyOut_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage2Idx1Pad16_uid83_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage2Idx1_uid84_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_sPostRnd_uid49_fpToFxPTest_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_udf_uid33_fpToFxPTest_n_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_udf_uid33_fpToFxPTest_n_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ovfExpRange_uid31_fpToFxPTest_n_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ovfExpRange_uid31_fpToFxPTest_n_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_signX_uid29_fpToFxPTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_signX_uid29_fpToFxPTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_excN_x_uid16_fpToFxPTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_excN_x_uid16_fpToFxPTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_excN_x_uid16_fpToFxPTest_q_3_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_excI_x_uid15_fpToFxPTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_excI_x_uid15_fpToFxPTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- maxNegValueU_uid55_fpToFxPTest(CONSTANT,54)
    maxNegValueU_uid55_fpToFxPTest_q <= "00000000000000000000000000000000";

    -- maxNegValueS_uid44_fpToFxPTest(CONSTANT,43)
    maxNegValueS_uid44_fpToFxPTest_q <= "10000000000000000000000000000000";

    -- maxPosValueS_uid43_fpToFxPTest(CONSTANT,42)
    maxPosValueS_uid43_fpToFxPTest_q <= "01111111111111111111111111111111";

    -- d0_uid47_fpToFxPTest(CONSTANT,46)
    d0_uid47_fpToFxPTest_q <= "001";

    -- signX_uid27_fpToFxPTest(BITSELECT,26)@0
    signX_uid27_fpToFxPTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- frac_x_uid10_fpToFxPTest(BITSELECT,9)@0
    frac_x_uid10_fpToFxPTest_b <= a(22 downto 0);

    -- cstZeroWF_uid7_fpToFxPTest(CONSTANT,6)
    cstZeroWF_uid7_fpToFxPTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid13_fpToFxPTest(LOGICAL,12)@0
    fracXIsZero_uid13_fpToFxPTest_q <= "1" WHEN cstZeroWF_uid7_fpToFxPTest_q = frac_x_uid10_fpToFxPTest_b ELSE "0";

    -- fracXIsNotZero_uid14_fpToFxPTest(LOGICAL,13)@0
    fracXIsNotZero_uid14_fpToFxPTest_q <= not (fracXIsZero_uid13_fpToFxPTest_q);

    -- cstAllOWE_uid6_fpToFxPTest(CONSTANT,5)
    cstAllOWE_uid6_fpToFxPTest_q <= "11111111";

    -- exp_x_uid9_fpToFxPTest(BITSELECT,8)@0
    exp_x_uid9_fpToFxPTest_b <= a(30 downto 23);

    -- expXIsMax_uid12_fpToFxPTest(LOGICAL,11)@0
    expXIsMax_uid12_fpToFxPTest_q <= "1" WHEN exp_x_uid9_fpToFxPTest_b = cstAllOWE_uid6_fpToFxPTest_q ELSE "0";

    -- excN_x_uid16_fpToFxPTest(LOGICAL,15)@0
    excN_x_uid16_fpToFxPTest_q <= expXIsMax_uid12_fpToFxPTest_q and fracXIsNotZero_uid14_fpToFxPTest_q;

    -- notNan_uid28_fpToFxPTest(LOGICAL,27)@0
    notNan_uid28_fpToFxPTest_q <= not (excN_x_uid16_fpToFxPTest_q);

    -- signX_uid29_fpToFxPTest(LOGICAL,28)@0 + 1
    signX_uid29_fpToFxPTest_qi <= notNan_uid28_fpToFxPTest_q and signX_uid27_fpToFxPTest_b;
    signX_uid29_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signX_uid29_fpToFxPTest_qi, xout => signX_uid29_fpToFxPTest_q, ena => en(0), clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- rightShiftStage2Idx1Pad16_uid83_rightShiferNoStickyOut_uid42_fpToFxPTest(CONSTANT,82)
    rightShiftStage2Idx1Pad16_uid83_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= "0000000000000000";

    -- rightShiftStage2Idx1Rng16_uid82_rightShiferNoStickyOut_uid42_fpToFxPTest(BITSELECT,81)@1
    rightShiftStage2Idx1Rng16_uid82_rightShiferNoStickyOut_uid42_fpToFxPTest_b <= rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q(31 downto 16);

    -- rightShiftStage2Idx1_uid84_rightShiferNoStickyOut_uid42_fpToFxPTest(BITJOIN,83)@1
    rightShiftStage2Idx1_uid84_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage2Idx1Pad16_uid83_rightShiferNoStickyOut_uid42_fpToFxPTest_q & rightShiftStage2Idx1Rng16_uid82_rightShiferNoStickyOut_uid42_fpToFxPTest_b;

    -- rightShiftStage1Idx3Pad12_uid78_rightShiferNoStickyOut_uid42_fpToFxPTest(CONSTANT,77)
    rightShiftStage1Idx3Pad12_uid78_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid77_rightShiferNoStickyOut_uid42_fpToFxPTest(BITSELECT,76)@1
    rightShiftStage1Idx3Rng12_uid77_rightShiferNoStickyOut_uid42_fpToFxPTest_b <= rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q(31 downto 12);

    -- rightShiftStage1Idx3_uid79_rightShiferNoStickyOut_uid42_fpToFxPTest(BITJOIN,78)@1
    rightShiftStage1Idx3_uid79_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage1Idx3Pad12_uid78_rightShiferNoStickyOut_uid42_fpToFxPTest_q & rightShiftStage1Idx3Rng12_uid77_rightShiferNoStickyOut_uid42_fpToFxPTest_b;

    -- cstAllZWE_uid8_fpToFxPTest(CONSTANT,7)
    cstAllZWE_uid8_fpToFxPTest_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid74_rightShiferNoStickyOut_uid42_fpToFxPTest(BITSELECT,73)@1
    rightShiftStage1Idx2Rng8_uid74_rightShiferNoStickyOut_uid42_fpToFxPTest_b <= rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q(31 downto 8);

    -- rightShiftStage1Idx2_uid76_rightShiferNoStickyOut_uid42_fpToFxPTest(BITJOIN,75)@1
    rightShiftStage1Idx2_uid76_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= cstAllZWE_uid8_fpToFxPTest_q & rightShiftStage1Idx2Rng8_uid74_rightShiferNoStickyOut_uid42_fpToFxPTest_b;

    -- rightShiftStage1Idx1Pad4_uid72_rightShiferNoStickyOut_uid42_fpToFxPTest(CONSTANT,71)
    rightShiftStage1Idx1Pad4_uid72_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid71_rightShiferNoStickyOut_uid42_fpToFxPTest(BITSELECT,70)@1
    rightShiftStage1Idx1Rng4_uid71_rightShiferNoStickyOut_uid42_fpToFxPTest_b <= rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q(31 downto 4);

    -- rightShiftStage1Idx1_uid73_rightShiferNoStickyOut_uid42_fpToFxPTest(BITJOIN,72)@1
    rightShiftStage1Idx1_uid73_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage1Idx1Pad4_uid72_rightShiferNoStickyOut_uid42_fpToFxPTest_q & rightShiftStage1Idx1Rng4_uid71_rightShiferNoStickyOut_uid42_fpToFxPTest_b;

    -- rightShiftStage0Idx3Pad3_uid67_rightShiferNoStickyOut_uid42_fpToFxPTest(CONSTANT,66)
    rightShiftStage0Idx3Pad3_uid67_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= "000";

    -- rightShiftStage0Idx3Rng3_uid66_rightShiferNoStickyOut_uid42_fpToFxPTest(BITSELECT,65)@1
    rightShiftStage0Idx3Rng3_uid66_rightShiferNoStickyOut_uid42_fpToFxPTest_b <= shifterIn_uid41_fpToFxPTest_q(31 downto 3);

    -- rightShiftStage0Idx3_uid68_rightShiferNoStickyOut_uid42_fpToFxPTest(BITJOIN,67)@1
    rightShiftStage0Idx3_uid68_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage0Idx3Pad3_uid67_rightShiferNoStickyOut_uid42_fpToFxPTest_q & rightShiftStage0Idx3Rng3_uid66_rightShiferNoStickyOut_uid42_fpToFxPTest_b;

    -- rightShiftStage0Idx2Pad2_uid64_rightShiferNoStickyOut_uid42_fpToFxPTest(CONSTANT,63)
    rightShiftStage0Idx2Pad2_uid64_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= "00";

    -- rightShiftStage0Idx2Rng2_uid63_rightShiferNoStickyOut_uid42_fpToFxPTest(BITSELECT,62)@1
    rightShiftStage0Idx2Rng2_uid63_rightShiferNoStickyOut_uid42_fpToFxPTest_b <= shifterIn_uid41_fpToFxPTest_q(31 downto 2);

    -- rightShiftStage0Idx2_uid65_rightShiferNoStickyOut_uid42_fpToFxPTest(BITJOIN,64)@1
    rightShiftStage0Idx2_uid65_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage0Idx2Pad2_uid64_rightShiferNoStickyOut_uid42_fpToFxPTest_q & rightShiftStage0Idx2Rng2_uid63_rightShiferNoStickyOut_uid42_fpToFxPTest_b;

    -- rightShiftStage0Idx1Rng1_uid60_rightShiferNoStickyOut_uid42_fpToFxPTest(BITSELECT,59)@1
    rightShiftStage0Idx1Rng1_uid60_rightShiferNoStickyOut_uid42_fpToFxPTest_b <= shifterIn_uid41_fpToFxPTest_q(31 downto 1);

    -- rightShiftStage0Idx1_uid62_rightShiferNoStickyOut_uid42_fpToFxPTest(BITJOIN,61)@1
    rightShiftStage0Idx1_uid62_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= GND_q & rightShiftStage0Idx1Rng1_uid60_rightShiferNoStickyOut_uid42_fpToFxPTest_b;

    -- excZ_x_uid11_fpToFxPTest(LOGICAL,10)@0
    excZ_x_uid11_fpToFxPTest_q <= "1" WHEN exp_x_uid9_fpToFxPTest_b = cstAllZWE_uid8_fpToFxPTest_q ELSE "0";

    -- invExcXZ_uid24_fpToFxPTest(LOGICAL,23)@0 + 1
    invExcXZ_uid24_fpToFxPTest_qi <= not (excZ_x_uid11_fpToFxPTest_q);
    invExcXZ_uid24_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => invExcXZ_uid24_fpToFxPTest_qi, xout => invExcXZ_uid24_fpToFxPTest_q, ena => en(0), clk => clk, aclr => areset );

    -- fracPostZ_uid23_fpToFxPTest(MUX,22)@0 + 1
    fracPostZ_uid23_fpToFxPTest_s <= excZ_x_uid11_fpToFxPTest_q;
    fracPostZ_uid23_fpToFxPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                fracPostZ_uid23_fpToFxPTest_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (fracPostZ_uid23_fpToFxPTest_s) IS
                        WHEN "0" => fracPostZ_uid23_fpToFxPTest_q <= frac_x_uid10_fpToFxPTest_b;
                        WHEN "1" => fracPostZ_uid23_fpToFxPTest_q <= cstZeroWF_uid7_fpToFxPTest_q;
                        WHEN OTHERS => fracPostZ_uid23_fpToFxPTest_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- oFracX_uid25_fpToFxPTest(BITJOIN,24)@1
    oFracX_uid25_fpToFxPTest_q <= invExcXZ_uid24_fpToFxPTest_q & fracPostZ_uid23_fpToFxPTest_q;

    -- shifterIn_uid41_fpToFxPTest(BITJOIN,40)@1
    shifterIn_uid41_fpToFxPTest_q <= oFracX_uid25_fpToFxPTest_q & cstAllZWE_uid8_fpToFxPTest_q;

    -- rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest(MUX,69)@1
    rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_s <= rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_b;
    rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_combproc: PROCESS (rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_s, en, shifterIn_uid41_fpToFxPTest_q, rightShiftStage0Idx1_uid62_rightShiferNoStickyOut_uid42_fpToFxPTest_q, rightShiftStage0Idx2_uid65_rightShiferNoStickyOut_uid42_fpToFxPTest_q, rightShiftStage0Idx3_uid68_rightShiferNoStickyOut_uid42_fpToFxPTest_q)
    BEGIN
        CASE (rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_s) IS
            WHEN "00" => rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= shifterIn_uid41_fpToFxPTest_q;
            WHEN "01" => rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage0Idx1_uid62_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN "10" => rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage0Idx2_uid65_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN "11" => rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage0Idx3_uid68_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN OTHERS => rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest(MUX,80)@1
    rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s <= rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_c;
    rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_combproc: PROCESS (rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s, en, rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q, rightShiftStage1Idx1_uid73_rightShiferNoStickyOut_uid42_fpToFxPTest_q, rightShiftStage1Idx2_uid76_rightShiferNoStickyOut_uid42_fpToFxPTest_q, rightShiftStage1Idx3_uid79_rightShiferNoStickyOut_uid42_fpToFxPTest_q)
    BEGIN
        CASE (rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s) IS
            WHEN "00" => rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage0_uid70_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN "01" => rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage1Idx1_uid73_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN "10" => rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage1Idx2_uid76_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN "11" => rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage1Idx3_uid79_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN OTHERS => rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- maxShiftCst_uid37_fpToFxPTest(CONSTANT,36)
    maxShiftCst_uid37_fpToFxPTest_q <= "100000";

    -- ovfExpVal_uid34_fpToFxPTest(CONSTANT,33)
    ovfExpVal_uid34_fpToFxPTest_q <= "010011101";

    -- shiftValE_uid35_fpToFxPTest(SUB,34)@0
    shiftValE_uid35_fpToFxPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => ovfExpVal_uid34_fpToFxPTest_q(8)) & ovfExpVal_uid34_fpToFxPTest_q));
    shiftValE_uid35_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & exp_x_uid9_fpToFxPTest_b));
    shiftValE_uid35_fpToFxPTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftValE_uid35_fpToFxPTest_a) - SIGNED(shiftValE_uid35_fpToFxPTest_b));
    shiftValE_uid35_fpToFxPTest_q <= shiftValE_uid35_fpToFxPTest_o(9 downto 0);

    -- shiftValRaw_uid36_fpToFxPTest(BITSELECT,35)@0
    shiftValRaw_uid36_fpToFxPTest_in <= shiftValE_uid35_fpToFxPTest_q(5 downto 0);
    shiftValRaw_uid36_fpToFxPTest_b <= shiftValRaw_uid36_fpToFxPTest_in(5 downto 0);

    -- shiftOutOfRange_uid38_fpToFxPTest(COMPARE,37)@0
    shiftOutOfRange_uid38_fpToFxPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => shiftValE_uid35_fpToFxPTest_q(9)) & shiftValE_uid35_fpToFxPTest_q));
    shiftOutOfRange_uid38_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & maxShiftCst_uid37_fpToFxPTest_q));
    shiftOutOfRange_uid38_fpToFxPTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftOutOfRange_uid38_fpToFxPTest_a) - SIGNED(shiftOutOfRange_uid38_fpToFxPTest_b));
    shiftOutOfRange_uid38_fpToFxPTest_n(0) <= not (shiftOutOfRange_uid38_fpToFxPTest_o(11));

    -- shiftVal_uid39_fpToFxPTest(MUX,38)@0 + 1
    shiftVal_uid39_fpToFxPTest_s <= shiftOutOfRange_uid38_fpToFxPTest_n;
    shiftVal_uid39_fpToFxPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                shiftVal_uid39_fpToFxPTest_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (shiftVal_uid39_fpToFxPTest_s) IS
                        WHEN "0" => shiftVal_uid39_fpToFxPTest_q <= shiftValRaw_uid36_fpToFxPTest_b;
                        WHEN "1" => shiftVal_uid39_fpToFxPTest_q <= maxShiftCst_uid37_fpToFxPTest_q;
                        WHEN OTHERS => shiftVal_uid39_fpToFxPTest_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select(BITSELECT,89)@1
    rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_b <= shiftVal_uid39_fpToFxPTest_q(1 downto 0);
    rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_c <= shiftVal_uid39_fpToFxPTest_q(3 downto 2);
    rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_d <= shiftVal_uid39_fpToFxPTest_q(5 downto 4);

    -- rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest(MUX,87)@1
    rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_s <= rightShiftStageSel0Dto0_uid69_rightShiferNoStickyOut_uid42_fpToFxPTest_merged_bit_select_d;
    rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_combproc: PROCESS (rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_s, en, rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q, rightShiftStage2Idx1_uid84_rightShiferNoStickyOut_uid42_fpToFxPTest_q, maxNegValueU_uid55_fpToFxPTest_q)
    BEGIN
        CASE (rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_s) IS
            WHEN "00" => rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN "01" => rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= rightShiftStage2Idx1_uid84_rightShiferNoStickyOut_uid42_fpToFxPTest_q;
            WHEN "10" => rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= maxNegValueU_uid55_fpToFxPTest_q;
            WHEN "11" => rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= maxNegValueU_uid55_fpToFxPTest_q;
            WHEN OTHERS => rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- zRightShiferNoStickyOut_uid45_fpToFxPTest(BITJOIN,44)@1
    zRightShiferNoStickyOut_uid45_fpToFxPTest_q <= GND_q & rightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q;

    -- xXorSignE_uid46_fpToFxPTest(LOGICAL,45)@1 + 1
    xXorSignE_uid46_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 1 => signX_uid29_fpToFxPTest_q(0)) & signX_uid29_fpToFxPTest_q));
    xXorSignE_uid46_fpToFxPTest_qi <= zRightShiferNoStickyOut_uid45_fpToFxPTest_q xor xXorSignE_uid46_fpToFxPTest_b;
    xXorSignE_uid46_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => xXorSignE_uid46_fpToFxPTest_qi, xout => xXorSignE_uid46_fpToFxPTest_q, ena => en(0), clk => clk, aclr => areset );

    -- sPostRndFull_uid48_fpToFxPTest(ADD,47)@2
    sPostRndFull_uid48_fpToFxPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => xXorSignE_uid46_fpToFxPTest_q(32)) & xXorSignE_uid46_fpToFxPTest_q));
    sPostRndFull_uid48_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 3 => d0_uid47_fpToFxPTest_q(2)) & d0_uid47_fpToFxPTest_q));
    sPostRndFull_uid48_fpToFxPTest_o <= STD_LOGIC_VECTOR(SIGNED(sPostRndFull_uid48_fpToFxPTest_a) + SIGNED(sPostRndFull_uid48_fpToFxPTest_b));
    sPostRndFull_uid48_fpToFxPTest_q <= sPostRndFull_uid48_fpToFxPTest_o(33 downto 0);

    -- sPostRnd_uid49_fpToFxPTest(BITSELECT,48)@2
    sPostRnd_uid49_fpToFxPTest_in <= sPostRndFull_uid48_fpToFxPTest_q(32 downto 0);
    sPostRnd_uid49_fpToFxPTest_b <= sPostRnd_uid49_fpToFxPTest_in(32 downto 1);

    -- redist0_sPostRnd_uid49_fpToFxPTest_b_1(DELAY,90)
    redist0_sPostRnd_uid49_fpToFxPTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_sPostRnd_uid49_fpToFxPTest_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist0_sPostRnd_uid49_fpToFxPTest_b_1_q <= STD_LOGIC_VECTOR(sPostRnd_uid49_fpToFxPTest_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist3_signX_uid29_fpToFxPTest_q_3(DELAY,93)
    redist3_signX_uid29_fpToFxPTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_signX_uid29_fpToFxPTest_q_3_delay_0 <= (others => '0');
                redist3_signX_uid29_fpToFxPTest_q_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist3_signX_uid29_fpToFxPTest_q_3_delay_0 <= STD_LOGIC_VECTOR(signX_uid29_fpToFxPTest_q);
                    redist3_signX_uid29_fpToFxPTest_q_3_q <= redist3_signX_uid29_fpToFxPTest_q_3_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- udfExpVal_uid32_fpToFxPTest(CONSTANT,31)
    udfExpVal_uid32_fpToFxPTest_q <= "01111101";

    -- udf_uid33_fpToFxPTest(COMPARE,32)@0 + 1
    udf_uid33_fpToFxPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => udfExpVal_uid32_fpToFxPTest_q(7)) & udfExpVal_uid32_fpToFxPTest_q));
    udf_uid33_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & exp_x_uid9_fpToFxPTest_b));
    udf_uid33_fpToFxPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                udf_uid33_fpToFxPTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    udf_uid33_fpToFxPTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid33_fpToFxPTest_a) - SIGNED(udf_uid33_fpToFxPTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    udf_uid33_fpToFxPTest_n(0) <= not (udf_uid33_fpToFxPTest_o(10));

    -- redist1_udf_uid33_fpToFxPTest_n_3(DELAY,91)
    redist1_udf_uid33_fpToFxPTest_n_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_udf_uid33_fpToFxPTest_n_3_delay_0 <= (others => '0');
                redist1_udf_uid33_fpToFxPTest_n_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_udf_uid33_fpToFxPTest_n_3_delay_0 <= STD_LOGIC_VECTOR(udf_uid33_fpToFxPTest_n);
                    redist1_udf_uid33_fpToFxPTest_n_3_q <= redist1_udf_uid33_fpToFxPTest_n_3_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sPostRnd_uid50_fpToFxPTest(BITSELECT,49)@2
    sPostRnd_uid50_fpToFxPTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => sPostRndFull_uid48_fpToFxPTest_q(33)) & sPostRndFull_uid48_fpToFxPTest_q));
    sPostRnd_uid50_fpToFxPTest_b <= STD_LOGIC_VECTOR(sPostRnd_uid50_fpToFxPTest_in(34 downto 1));

    -- rndOvfPos_uid51_fpToFxPTest(COMPARE,50)@2 + 1
    rndOvfPos_uid51_fpToFxPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & maxPosValueS_uid43_fpToFxPTest_q));
    rndOvfPos_uid51_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => sPostRnd_uid50_fpToFxPTest_b(33)) & sPostRnd_uid50_fpToFxPTest_b));
    rndOvfPos_uid51_fpToFxPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                rndOvfPos_uid51_fpToFxPTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    rndOvfPos_uid51_fpToFxPTest_o <= STD_LOGIC_VECTOR(SIGNED(rndOvfPos_uid51_fpToFxPTest_a) - SIGNED(rndOvfPos_uid51_fpToFxPTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    rndOvfPos_uid51_fpToFxPTest_c(0) <= rndOvfPos_uid51_fpToFxPTest_o(35);

    -- ovfExpVal_uid30_fpToFxPTest(CONSTANT,29)
    ovfExpVal_uid30_fpToFxPTest_q <= "010011110";

    -- ovfExpRange_uid31_fpToFxPTest(COMPARE,30)@0 + 1
    ovfExpRange_uid31_fpToFxPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & exp_x_uid9_fpToFxPTest_b));
    ovfExpRange_uid31_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => ovfExpVal_uid30_fpToFxPTest_q(8)) & ovfExpVal_uid30_fpToFxPTest_q));
    ovfExpRange_uid31_fpToFxPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                ovfExpRange_uid31_fpToFxPTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    ovfExpRange_uid31_fpToFxPTest_o <= STD_LOGIC_VECTOR(SIGNED(ovfExpRange_uid31_fpToFxPTest_a) - SIGNED(ovfExpRange_uid31_fpToFxPTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    ovfExpRange_uid31_fpToFxPTest_n(0) <= not (ovfExpRange_uid31_fpToFxPTest_o(10));

    -- redist2_ovfExpRange_uid31_fpToFxPTest_n_3(DELAY,92)
    redist2_ovfExpRange_uid31_fpToFxPTest_n_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_ovfExpRange_uid31_fpToFxPTest_n_3_delay_0 <= (others => '0');
                redist2_ovfExpRange_uid31_fpToFxPTest_n_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist2_ovfExpRange_uid31_fpToFxPTest_n_3_delay_0 <= STD_LOGIC_VECTOR(ovfExpRange_uid31_fpToFxPTest_n);
                    redist2_ovfExpRange_uid31_fpToFxPTest_n_3_q <= redist2_ovfExpRange_uid31_fpToFxPTest_n_3_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- excI_x_uid15_fpToFxPTest(LOGICAL,14)@0 + 1
    excI_x_uid15_fpToFxPTest_qi <= expXIsMax_uid12_fpToFxPTest_q and fracXIsZero_uid13_fpToFxPTest_q;
    excI_x_uid15_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excI_x_uid15_fpToFxPTest_qi, xout => excI_x_uid15_fpToFxPTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist5_excI_x_uid15_fpToFxPTest_q_3(DELAY,95)
    redist5_excI_x_uid15_fpToFxPTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_excI_x_uid15_fpToFxPTest_q_3_delay_0 <= (others => '0');
                redist5_excI_x_uid15_fpToFxPTest_q_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_excI_x_uid15_fpToFxPTest_q_3_delay_0 <= STD_LOGIC_VECTOR(excI_x_uid15_fpToFxPTest_q);
                    redist5_excI_x_uid15_fpToFxPTest_q_3_q <= redist5_excI_x_uid15_fpToFxPTest_q_3_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist4_excN_x_uid16_fpToFxPTest_q_3(DELAY,94)
    redist4_excN_x_uid16_fpToFxPTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_excN_x_uid16_fpToFxPTest_q_3_delay_0 <= (others => '0');
                redist4_excN_x_uid16_fpToFxPTest_q_3_delay_1 <= (others => '0');
                redist4_excN_x_uid16_fpToFxPTest_q_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist4_excN_x_uid16_fpToFxPTest_q_3_delay_0 <= STD_LOGIC_VECTOR(excN_x_uid16_fpToFxPTest_q);
                    redist4_excN_x_uid16_fpToFxPTest_q_3_delay_1 <= redist4_excN_x_uid16_fpToFxPTest_q_3_delay_0;
                    redist4_excN_x_uid16_fpToFxPTest_q_3_q <= redist4_excN_x_uid16_fpToFxPTest_q_3_delay_1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- ovfPostRnd_uid52_fpToFxPTest(LOGICAL,51)@3
    ovfPostRnd_uid52_fpToFxPTest_q <= redist4_excN_x_uid16_fpToFxPTest_q_3_q or redist5_excI_x_uid15_fpToFxPTest_q_3_q or redist2_ovfExpRange_uid31_fpToFxPTest_n_3_q or rndOvfPos_uid51_fpToFxPTest_c;

    -- muxSelConc_uid53_fpToFxPTest(BITJOIN,52)@3
    muxSelConc_uid53_fpToFxPTest_q <= redist3_signX_uid29_fpToFxPTest_q_3_q & redist1_udf_uid33_fpToFxPTest_n_3_q & ovfPostRnd_uid52_fpToFxPTest_q;

    -- muxSel_uid54_fpToFxPTest(LOOKUP,53)@3
    muxSel_uid54_fpToFxPTest_combproc: PROCESS (muxSelConc_uid53_fpToFxPTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (muxSelConc_uid53_fpToFxPTest_q) IS
            WHEN "000" => muxSel_uid54_fpToFxPTest_q <= "00";
            WHEN "001" => muxSel_uid54_fpToFxPTest_q <= "01";
            WHEN "010" => muxSel_uid54_fpToFxPTest_q <= "11";
            WHEN "011" => muxSel_uid54_fpToFxPTest_q <= "11";
            WHEN "100" => muxSel_uid54_fpToFxPTest_q <= "00";
            WHEN "101" => muxSel_uid54_fpToFxPTest_q <= "10";
            WHEN "110" => muxSel_uid54_fpToFxPTest_q <= "11";
            WHEN "111" => muxSel_uid54_fpToFxPTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           muxSel_uid54_fpToFxPTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- finalOut_uid56_fpToFxPTest(MUX,55)@3
    finalOut_uid56_fpToFxPTest_s <= muxSel_uid54_fpToFxPTest_q;
    finalOut_uid56_fpToFxPTest_combproc: PROCESS (finalOut_uid56_fpToFxPTest_s, en, redist0_sPostRnd_uid49_fpToFxPTest_b_1_q, maxPosValueS_uid43_fpToFxPTest_q, maxNegValueS_uid44_fpToFxPTest_q, maxNegValueU_uid55_fpToFxPTest_q)
    BEGIN
        CASE (finalOut_uid56_fpToFxPTest_s) IS
            WHEN "00" => finalOut_uid56_fpToFxPTest_q <= redist0_sPostRnd_uid49_fpToFxPTest_b_1_q;
            WHEN "01" => finalOut_uid56_fpToFxPTest_q <= maxPosValueS_uid43_fpToFxPTest_q;
            WHEN "10" => finalOut_uid56_fpToFxPTest_q <= maxNegValueS_uid44_fpToFxPTest_q;
            WHEN "11" => finalOut_uid56_fpToFxPTest_q <= maxNegValueU_uid55_fpToFxPTest_q;
            WHEN OTHERS => finalOut_uid56_fpToFxPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xOut(GPOUT,4)@3
    q <= finalOut_uid56_fpToFxPTest_q;

END normal;
