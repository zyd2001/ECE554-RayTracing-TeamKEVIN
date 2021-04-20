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

-- VHDL created from Fix_Div_altera_fxp_functions_191_2oqd7oi
-- VHDL created on Mon Apr 19 21:20:44 2021


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

entity Fix_Div_altera_fxp_functions_191_2oqd7oi is
    port (
        numerator : in std_logic_vector(31 downto 0);  -- ufix32
        denominator : in std_logic_vector(31 downto 0);  -- ufix32
        en : in std_logic_vector(0 downto 0);  -- ufix1
        result : out std_logic_vector(31 downto 0);  -- ufix32
        clk : in std_logic;
        rst : in std_logic
    );
end Fix_Div_altera_fxp_functions_191_2oqd7oi;

architecture normal of Fix_Div_altera_fxp_functions_191_2oqd7oi is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYNoLeadOne_uid11_divider_in : STD_LOGIC_VECTOR (30 downto 0);
    signal normYNoLeadOne_uid11_divider_b : STD_LOGIC_VECTOR (30 downto 0);
    signal paddingY_uid12_divider_q : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedY_uid13_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid12_divider_a : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid12_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid15_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid16_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid16_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid17_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yIsZero_uid17_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid22_divider_in : STD_LOGIC_VECTOR (38 downto 0);
    signal fxpInverseRes_uid22_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal oneInvRes_uid23_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invResPostOneHandling2_uid24_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal invResPostOneHandling2_uid24_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal cWOut_uid25_divider_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rShiftCount_uid26_divider_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid26_divider_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid26_divider_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid26_divider_q : STD_LOGIC_VECTOR (6 downto 0);
    signal prodPostRightShiftPost_uid29_divider_in : STD_LOGIC_VECTOR (63 downto 0);
    signal prodPostRightShiftPost_uid29_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal allOnes_uid30_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal allOnes_uid30_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAllOnes_uid32_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addOp2_uid33_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRndRange_uid35_divider_in : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRndRange_uid35_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvf_uid36_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinal_uid37_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinal_uid37_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prod_qy_GT_x_uid39_divider_a : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_GT_x_uid39_divider_b : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_GT_x_uid39_divider_o : STD_LOGIC_VECTOR (65 downto 0);
    signal prod_qy_GT_x_uid39_divider_c : STD_LOGIC_VECTOR (0 downto 0);
    signal zs_uid46_zCount_uid9_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid48_zCount_uid9_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid48_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid51_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid51_zCount_uid9_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid52_zCount_uid9_divider_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid54_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid57_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid57_zCount_uid9_divider_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid58_zCount_uid9_divider_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid60_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid63_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid63_zCount_uid9_divider_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid64_zCount_uid9_divider_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid66_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid69_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid69_zCount_uid9_divider_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid70_zCount_uid9_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid72_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid75_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid75_zCount_uid9_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid77_zCount_uid9_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid78_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid79_zCount_uid9_divider_q : STD_LOGIC_VECTOR (5 downto 0);
    signal yT1_uid97_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid99_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid99_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid100_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal s1sumAHighB_uid101_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid101_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid101_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid101_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid102_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yT2_uid103_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lowRangeB_uid105_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid105_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid106_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid107_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid107_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid107_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid107_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s2_uid108_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal lowRangeB_uid111_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid111_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid112_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s3sumAHighB_uid113_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid113_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid113_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid113_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal s3_uid114_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal osig_uid117_pT1_uid98_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal osig_uid120_pT2_uid104_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal nx_mergedSignalTM_uid134_pT3_uid110_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomExtension_uid139_pT3_uid110_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_mergedSignalTM_uid141_pT3_uid110_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid143_pT3_uid110_invPolyEval_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_mergedSignalTM_uid145_pT3_uid110_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid151_pT3_uid110_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid151_pT3_uid110_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid152_pT3_uid110_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid154_pT3_uid110_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid155_pT3_uid110_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid155_pT3_uid110_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid160_normY_uid10_divider_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid160_normY_uid10_divider_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid161_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid165_normY_uid10_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid165_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng4_uid167_normY_uid10_divider_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng4_uid167_normY_uid10_divider_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1_uid168_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Rng8_uid170_normY_uid10_divider_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng8_uid170_normY_uid10_divider_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid171_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng12_uid173_normY_uid10_divider_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage1Idx3Rng12_uid173_normY_uid10_divider_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage1Idx3_uid174_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid176_normY_uid10_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid176_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx1Rng1_uid178_normY_uid10_divider_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1Rng1_uid178_normY_uid10_divider_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1_uid179_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx2Rng2_uid181_normY_uid10_divider_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage2Idx2Rng2_uid181_normY_uid10_divider_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage2Idx2_uid182_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx3Pad3_uid183_normY_uid10_divider_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2Idx3Rng3_uid184_normY_uid10_divider_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage2Idx3Rng3_uid184_normY_uid10_divider_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage2Idx3_uid185_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2_uid187_normY_uid10_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid187_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid27_divider_bs1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid27_divider_bjA2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_bs3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_bjB4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXInvY_uid27_divider_bs6_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_bs6_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_bs7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_bs8_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid27_divider_bs9_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_bs9_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_sums_join_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid27_divider_sums_align_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXInvY_uid27_divider_sums_align_1_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_a : STD_LOGIC_VECTOR (68 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_b : STD_LOGIC_VECTOR (68 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_o : STD_LOGIC_VECTOR (68 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal rightShiftStage0Idx1Rng1_uid208_prodPostRightShift_uid28_divider_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx1Rng1_uid208_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1_uid210_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng2_uid211_prodPostRightShift_uid28_divider_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng2_uid211_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage0Idx2_uid213_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng3_uid214_prodPostRightShift_uid28_divider_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng3_uid214_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (61 downto 0);
    signal rightShiftStage0Idx3_uid216_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0_uid218_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx1Rng4_uid219_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (60 downto 0);
    signal rightShiftStage1Idx1_uid221_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx2Rng8_uid222_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStage1Idx2_uid224_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx3Rng12_uid225_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage1Idx3_uid227_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1_uid229_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx1Rng16_uid230_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx1_uid232_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx2Rng32_uid233_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage2Idx2_uid235_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx3Rng48_uid236_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage2Idx3Pad48_uid237_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx3_uid238_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2_uid240_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage3Idx1Rng64_uid241_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3Idx1Pad64_uid242_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage3Idx1_uid243_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage3_uid245_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid245_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal prodResY_uid38_divider_bs1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid38_divider_bjA2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodResY_uid38_divider_bs3_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid38_divider_bjB4_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodResY_uid38_divider_bs6_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_bs6_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid38_divider_bs8_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid38_divider_bs9_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_bs9_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_sums_join_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal prodResY_uid38_divider_sums_align_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodResY_uid38_divider_sums_align_1_qint : STD_LOGIC_VECTOR (50 downto 0);
    signal prodResY_uid38_divider_sums_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal prodResY_uid38_divider_sums_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal prodResY_uid38_divider_sums_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal prodResY_uid38_divider_sums_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_i : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_a1 : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_b1 : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_q : STD_LOGIC_VECTOR (31 downto 0);
    signal memoryC0_uid81_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid81_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC0_uid81_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid81_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid81_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC0_uid81_invTabGen_lutmem_r : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC1_uid84_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid84_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid84_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid84_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid84_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid84_invTabGen_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC2_uid87_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid87_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid87_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid87_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid87_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid87_invTabGen_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC3_uid90_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid90_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid90_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid90_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid90_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid90_invTabGen_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_reset : std_logic;
    type prodXY_uid116_pT1_uid98_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_ah : prodXY_uid116_pT1_uid98_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of prodXY_uid116_pT1_uid98_invPolyEval_cma_ah : signal is true;
    type prodXY_uid116_pT1_uid98_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_ch : prodXY_uid116_pT1_uid98_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid116_pT1_uid98_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid116_pT1_uid98_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_reset : std_logic;
    type prodXY_uid119_pT2_uid104_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(20 downto 0);
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_ah : prodXY_uid119_pT2_uid104_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid119_pT2_uid104_invPolyEval_cma_ah : signal is true;
    type prodXY_uid119_pT2_uid104_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(22 downto 0);
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_ch : prodXY_uid119_pT2_uid104_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid119_pT2_uid104_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (20 downto 0);
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_qq : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_q : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid119_pT2_uid104_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_reset : std_logic;
    type sm0_uid148_pT3_uid110_invPolyEval_cma_ahtype is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_ah : sm0_uid148_pT3_uid110_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid148_pT3_uid110_invPolyEval_cma_ah : signal is true;
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_ch : sm0_uid148_pT3_uid110_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid148_pT3_uid110_invPolyEval_cma_ch : signal is true;
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid148_pT3_uid110_invPolyEval_cma_ena2 : std_logic;
    signal prodXInvY_uid27_divider_im0_cma_reset : std_logic;
    type prodXInvY_uid27_divider_im0_cma_ahtype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_ah : prodXInvY_uid27_divider_im0_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im0_cma_ah : signal is true;
    type prodXInvY_uid27_divider_im0_cma_chtype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_ch : prodXInvY_uid27_divider_im0_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im0_cma_ch : signal is true;
    signal prodXInvY_uid27_divider_im0_cma_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_c0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_s0 : STD_LOGIC_VECTOR (30 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_qq : STD_LOGIC_VECTOR (30 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_q : STD_LOGIC_VECTOR (30 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_ena0 : std_logic;
    signal prodXInvY_uid27_divider_im0_cma_ena1 : std_logic;
    signal prodXInvY_uid27_divider_im0_cma_ena2 : std_logic;
    signal prodXInvY_uid27_divider_im10_cma_reset : std_logic;
    type prodXInvY_uid27_divider_im10_cma_ahtype is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_ah : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im10_cma_ah : signal is true;
    signal prodXInvY_uid27_divider_im10_cma_ch : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im10_cma_ch : signal is true;
    signal prodXInvY_uid27_divider_im10_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_ena0 : std_logic;
    signal prodXInvY_uid27_divider_im10_cma_ena1 : std_logic;
    signal prodXInvY_uid27_divider_im10_cma_ena2 : std_logic;
    signal prodResY_uid38_divider_im0_cma_reset : std_logic;
    signal prodResY_uid38_divider_im0_cma_ah : prodXInvY_uid27_divider_im0_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodResY_uid38_divider_im0_cma_ah : signal is true;
    signal prodResY_uid38_divider_im0_cma_ch : prodXInvY_uid27_divider_im0_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodResY_uid38_divider_im0_cma_ch : signal is true;
    signal prodResY_uid38_divider_im0_cma_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodResY_uid38_divider_im0_cma_c0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodResY_uid38_divider_im0_cma_s0 : STD_LOGIC_VECTOR (29 downto 0);
    signal prodResY_uid38_divider_im0_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal prodResY_uid38_divider_im0_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal prodResY_uid38_divider_im0_cma_ena0 : std_logic;
    signal prodResY_uid38_divider_im0_cma_ena1 : std_logic;
    signal prodResY_uid38_divider_im0_cma_ena2 : std_logic;
    signal prodResY_uid38_divider_im10_cma_reset : std_logic;
    signal prodResY_uid38_divider_im10_cma_ah : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodResY_uid38_divider_im10_cma_ah : signal is true;
    signal prodResY_uid38_divider_im10_cma_ch : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodResY_uid38_divider_im10_cma_ch : signal is true;
    signal prodResY_uid38_divider_im10_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_im10_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_im10_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid38_divider_im10_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid38_divider_im10_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodResY_uid38_divider_im10_cma_ena0 : std_logic;
    signal prodResY_uid38_divider_im10_cma_ena1 : std_logic;
    signal prodResY_uid38_divider_im10_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ah : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ah : signal is true;
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ch : sm0_uid148_pT3_uid110_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ch : signal is true;
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena2 : std_logic;
    signal prodXInvY_uid27_divider_ma5_cma_reset : std_logic;
    type prodXInvY_uid27_divider_ma5_cma_ahtype is array(NATURAL range <>) of UNSIGNED(14 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_ah : prodXInvY_uid27_divider_ma5_cma_ahtype(0 to 1);
    attribute preserve_syn_only of prodXInvY_uid27_divider_ma5_cma_ah : signal is true;
    signal prodXInvY_uid27_divider_ma5_cma_ch : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 1);
    attribute preserve_syn_only of prodXInvY_uid27_divider_ma5_cma_ch : signal is true;
    signal prodXInvY_uid27_divider_ma5_cma_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_a1 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_s0 : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_ena0 : std_logic;
    signal prodXInvY_uid27_divider_ma5_cma_ena1 : std_logic;
    signal prodXInvY_uid27_divider_ma5_cma_ena2 : std_logic;
    signal prodResY_uid38_divider_ma5_cma_reset : std_logic;
    signal prodResY_uid38_divider_ma5_cma_ah : prodXY_uid116_pT1_uid98_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of prodResY_uid38_divider_ma5_cma_ah : signal is true;
    signal prodResY_uid38_divider_ma5_cma_ch : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 1);
    attribute preserve_syn_only of prodResY_uid38_divider_ma5_cma_ch : signal is true;
    signal prodResY_uid38_divider_ma5_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid38_divider_ma5_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_ma5_cma_a1 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodResY_uid38_divider_ma5_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodResY_uid38_divider_ma5_cma_s0 : STD_LOGIC_VECTOR (32 downto 0);
    signal prodResY_uid38_divider_ma5_cma_qq : STD_LOGIC_VECTOR (32 downto 0);
    signal prodResY_uid38_divider_ma5_cma_q : STD_LOGIC_VECTOR (32 downto 0);
    signal prodResY_uid38_divider_ma5_cma_ena0 : std_logic;
    signal prodResY_uid38_divider_ma5_cma_ena1 : std_logic;
    signal prodResY_uid38_divider_ma5_cma_ena2 : std_logic;
    signal yAddr_uid19_divider_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid19_divider_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid53_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid53_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid59_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid59_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid65_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid65_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid71_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid71_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_b_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_b_10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_yAddr_uid19_divider_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist6_yAddr_uid19_divider_merged_bit_select_c_2_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist7_yAddr_uid19_divider_merged_bit_select_c_7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_1 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_2 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid19_divider_merged_bit_select_c_13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_1 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_2 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_lowRangeB_uid105_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_vCount_uid66_zCount_uid9_divider_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_vCount_uid60_zCount_uid9_divider_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_vCount_uid54_zCount_uid9_divider_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_vCount_uid54_zCount_uid9_divider_q_2_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_vCount_uid48_zCount_uid9_divider_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_vCount_uid48_zCount_uid9_divider_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_prodPostRightShiftPost_uid29_divider_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist17_fxpInverseRes_uid22_divider_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist18_normYIsOne_uid16_divider_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_normYIsOneC2_uid15_divider_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_normYNoLeadOne_uid11_divider_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist23_in_rsrvd_fix_denominator_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_in_rsrvd_fix_denominator_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_in_rsrvd_fix_denominator_3_delay_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_b_16_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_yAddr_uid19_divider_merged_bit_select_c_7_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid19_divider_merged_bit_select_c_13_inputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_yAddr_uid19_divider_merged_bit_select_c_13_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_mem_reset0 : std_logic;
    signal redist10_r_uid79_zCount_uid9_divider_q_24_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i : signal is true;
    signal redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_eq : signal is true;
    signal redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena_q : signal is true;
    signal redist10_r_uid79_zCount_uid9_divider_q_24_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_inputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_mem_reset0 : std_logic;
    signal redist15_resFinal_uid37_divider_q_6_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist15_resFinal_uid37_divider_q_6_rdcnt_i : signal is true;
    signal redist15_resFinal_uid37_divider_q_6_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist15_resFinal_uid37_divider_q_6_rdcnt_eq : signal is true;
    signal redist15_resFinal_uid37_divider_q_6_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_resFinal_uid37_divider_q_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist15_resFinal_uid37_divider_q_6_sticky_ena_q : signal is true;
    signal redist15_resFinal_uid37_divider_q_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_inputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_mem_reset0 : std_logic;
    signal redist21_in_rsrvd_fix_numerator_22_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist21_in_rsrvd_fix_numerator_22_rdcnt_i : signal is true;
    signal redist21_in_rsrvd_fix_numerator_22_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist21_in_rsrvd_fix_numerator_22_rdcnt_eq : signal is true;
    signal redist21_in_rsrvd_fix_numerator_22_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_22_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist21_in_rsrvd_fix_numerator_22_sticky_ena_q : signal is true;
    signal redist21_in_rsrvd_fix_numerator_22_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_inputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_outputreg1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_mem_reset0 : std_logic;
    signal redist22_in_rsrvd_fix_numerator_35_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist22_in_rsrvd_fix_numerator_35_rdcnt_i : signal is true;
    signal redist22_in_rsrvd_fix_numerator_35_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist22_in_rsrvd_fix_numerator_35_rdcnt_eq : signal is true;
    signal redist22_in_rsrvd_fix_numerator_35_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_in_rsrvd_fix_numerator_35_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist22_in_rsrvd_fix_numerator_35_sticky_ena_q : signal is true;
    signal redist22_in_rsrvd_fix_numerator_35_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_mem_reset0 : std_logic;
    signal redist25_in_rsrvd_fix_denominator_29_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist25_in_rsrvd_fix_denominator_29_rdcnt_i : signal is true;
    signal redist25_in_rsrvd_fix_denominator_29_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist25_in_rsrvd_fix_denominator_29_rdcnt_eq : signal is true;
    signal redist25_in_rsrvd_fix_denominator_29_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_in_rsrvd_fix_denominator_29_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist25_in_rsrvd_fix_denominator_29_sticky_ena_q : signal is true;
    signal redist25_in_rsrvd_fix_denominator_29_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstValOvf_uid36_divider(CONSTANT,35)
    cstValOvf_uid36_divider_q <= "11111111111111111111111111111111";

    -- rightShiftStage3Idx1Pad64_uid242_prodPostRightShift_uid28_divider(CONSTANT,241)
    rightShiftStage3Idx1Pad64_uid242_prodPostRightShift_uid28_divider_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage3Idx1Rng64_uid241_prodPostRightShift_uid28_divider(BITSELECT,240)@28
    rightShiftStage3Idx1Rng64_uid241_prodPostRightShift_uid28_divider_b <= rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q(64 downto 64);

    -- rightShiftStage3Idx1_uid243_prodPostRightShift_uid28_divider(BITJOIN,242)@28
    rightShiftStage3Idx1_uid243_prodPostRightShift_uid28_divider_q <= rightShiftStage3Idx1Pad64_uid242_prodPostRightShift_uid28_divider_q & rightShiftStage3Idx1Rng64_uid241_prodPostRightShift_uid28_divider_b;

    -- rightShiftStage2Idx3Pad48_uid237_prodPostRightShift_uid28_divider(CONSTANT,236)
    rightShiftStage2Idx3Pad48_uid237_prodPostRightShift_uid28_divider_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage2Idx3Rng48_uid236_prodPostRightShift_uid28_divider(BITSELECT,235)@28
    rightShiftStage2Idx3Rng48_uid236_prodPostRightShift_uid28_divider_b <= rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q(64 downto 48);

    -- rightShiftStage2Idx3_uid238_prodPostRightShift_uid28_divider(BITJOIN,237)@28
    rightShiftStage2Idx3_uid238_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx3Pad48_uid237_prodPostRightShift_uid28_divider_q & rightShiftStage2Idx3Rng48_uid236_prodPostRightShift_uid28_divider_b;

    -- zs_uid46_zCount_uid9_divider(CONSTANT,45)
    zs_uid46_zCount_uid9_divider_q <= "00000000000000000000000000000000";

    -- rightShiftStage2Idx2Rng32_uid233_prodPostRightShift_uid28_divider(BITSELECT,232)@28
    rightShiftStage2Idx2Rng32_uid233_prodPostRightShift_uid28_divider_b <= rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q(64 downto 32);

    -- rightShiftStage2Idx2_uid235_prodPostRightShift_uid28_divider(BITJOIN,234)@28
    rightShiftStage2Idx2_uid235_prodPostRightShift_uid28_divider_q <= zs_uid46_zCount_uid9_divider_q & rightShiftStage2Idx2Rng32_uid233_prodPostRightShift_uid28_divider_b;

    -- zs_uid52_zCount_uid9_divider(CONSTANT,51)
    zs_uid52_zCount_uid9_divider_q <= "0000000000000000";

    -- rightShiftStage2Idx1Rng16_uid230_prodPostRightShift_uid28_divider(BITSELECT,229)@28
    rightShiftStage2Idx1Rng16_uid230_prodPostRightShift_uid28_divider_b <= rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q(64 downto 16);

    -- rightShiftStage2Idx1_uid232_prodPostRightShift_uid28_divider(BITJOIN,231)@28
    rightShiftStage2Idx1_uid232_prodPostRightShift_uid28_divider_q <= zs_uid52_zCount_uid9_divider_q & rightShiftStage2Idx1Rng16_uid230_prodPostRightShift_uid28_divider_b;

    -- rightBottomX_bottomExtension_uid143_pT3_uid110_invPolyEval(CONSTANT,142)
    rightBottomX_bottomExtension_uid143_pT3_uid110_invPolyEval_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid225_prodPostRightShift_uid28_divider(BITSELECT,224)@28
    rightShiftStage1Idx3Rng12_uid225_prodPostRightShift_uid28_divider_b <= rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q(64 downto 12);

    -- rightShiftStage1Idx3_uid227_prodPostRightShift_uid28_divider(BITJOIN,226)@28
    rightShiftStage1Idx3_uid227_prodPostRightShift_uid28_divider_q <= rightBottomX_bottomExtension_uid143_pT3_uid110_invPolyEval_q & rightShiftStage1Idx3Rng12_uid225_prodPostRightShift_uid28_divider_b;

    -- zs_uid58_zCount_uid9_divider(CONSTANT,57)
    zs_uid58_zCount_uid9_divider_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid222_prodPostRightShift_uid28_divider(BITSELECT,221)@28
    rightShiftStage1Idx2Rng8_uid222_prodPostRightShift_uid28_divider_b <= rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q(64 downto 8);

    -- rightShiftStage1Idx2_uid224_prodPostRightShift_uid28_divider(BITJOIN,223)@28
    rightShiftStage1Idx2_uid224_prodPostRightShift_uid28_divider_q <= zs_uid58_zCount_uid9_divider_q & rightShiftStage1Idx2Rng8_uid222_prodPostRightShift_uid28_divider_b;

    -- zs_uid64_zCount_uid9_divider(CONSTANT,63)
    zs_uid64_zCount_uid9_divider_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid219_prodPostRightShift_uid28_divider(BITSELECT,218)@28
    rightShiftStage1Idx1Rng4_uid219_prodPostRightShift_uid28_divider_b <= rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q(64 downto 4);

    -- rightShiftStage1Idx1_uid221_prodPostRightShift_uid28_divider(BITJOIN,220)@28
    rightShiftStage1Idx1_uid221_prodPostRightShift_uid28_divider_q <= zs_uid64_zCount_uid9_divider_q & rightShiftStage1Idx1Rng4_uid219_prodPostRightShift_uid28_divider_b;

    -- leftShiftStage2Idx3Pad3_uid183_normY_uid10_divider(CONSTANT,182)
    leftShiftStage2Idx3Pad3_uid183_normY_uid10_divider_q <= "000";

    -- rightShiftStage0Idx3Rng3_uid214_prodPostRightShift_uid28_divider(BITSELECT,213)@27
    rightShiftStage0Idx3Rng3_uid214_prodPostRightShift_uid28_divider_in <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
    rightShiftStage0Idx3Rng3_uid214_prodPostRightShift_uid28_divider_b <= rightShiftStage0Idx3Rng3_uid214_prodPostRightShift_uid28_divider_in(64 downto 3);

    -- rightShiftStage0Idx3_uid216_prodPostRightShift_uid28_divider(BITJOIN,215)@27
    rightShiftStage0Idx3_uid216_prodPostRightShift_uid28_divider_q <= leftShiftStage2Idx3Pad3_uid183_normY_uid10_divider_q & rightShiftStage0Idx3Rng3_uid214_prodPostRightShift_uid28_divider_b;

    -- zs_uid70_zCount_uid9_divider(CONSTANT,69)
    zs_uid70_zCount_uid9_divider_q <= "00";

    -- rightShiftStage0Idx2Rng2_uid211_prodPostRightShift_uid28_divider(BITSELECT,210)@27
    rightShiftStage0Idx2Rng2_uid211_prodPostRightShift_uid28_divider_in <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
    rightShiftStage0Idx2Rng2_uid211_prodPostRightShift_uid28_divider_b <= rightShiftStage0Idx2Rng2_uid211_prodPostRightShift_uid28_divider_in(64 downto 2);

    -- rightShiftStage0Idx2_uid213_prodPostRightShift_uid28_divider(BITJOIN,212)@27
    rightShiftStage0Idx2_uid213_prodPostRightShift_uid28_divider_q <= zs_uid70_zCount_uid9_divider_q & rightShiftStage0Idx2Rng2_uid211_prodPostRightShift_uid28_divider_b;

    -- rightShiftStage0Idx1Rng1_uid208_prodPostRightShift_uid28_divider(BITSELECT,207)@27
    rightShiftStage0Idx1Rng1_uid208_prodPostRightShift_uid28_divider_in <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
    rightShiftStage0Idx1Rng1_uid208_prodPostRightShift_uid28_divider_b <= rightShiftStage0Idx1Rng1_uid208_prodPostRightShift_uid28_divider_in(64 downto 1);

    -- rightShiftStage0Idx1_uid210_prodPostRightShift_uid28_divider(BITJOIN,209)@27
    rightShiftStage0Idx1_uid210_prodPostRightShift_uid28_divider_q <= GND_q & rightShiftStage0Idx1Rng1_uid208_prodPostRightShift_uid28_divider_b;

    -- redist21_in_rsrvd_fix_numerator_22_notEnable(LOGICAL,350)
    redist21_in_rsrvd_fix_numerator_22_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist21_in_rsrvd_fix_numerator_22_nor(LOGICAL,351)
    redist21_in_rsrvd_fix_numerator_22_nor_q <= not (redist21_in_rsrvd_fix_numerator_22_notEnable_q or redist21_in_rsrvd_fix_numerator_22_sticky_ena_q);

    -- redist21_in_rsrvd_fix_numerator_22_mem_last(CONSTANT,347)
    redist21_in_rsrvd_fix_numerator_22_mem_last_q <= "010001";

    -- redist21_in_rsrvd_fix_numerator_22_cmp(LOGICAL,348)
    redist21_in_rsrvd_fix_numerator_22_cmp_b <= STD_LOGIC_VECTOR("0" & redist21_in_rsrvd_fix_numerator_22_rdmux_q);
    redist21_in_rsrvd_fix_numerator_22_cmp_q <= "1" WHEN redist21_in_rsrvd_fix_numerator_22_mem_last_q = redist21_in_rsrvd_fix_numerator_22_cmp_b ELSE "0";

    -- redist21_in_rsrvd_fix_numerator_22_cmpReg(REG,349)
    redist21_in_rsrvd_fix_numerator_22_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_22_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist21_in_rsrvd_fix_numerator_22_cmpReg_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_22_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_22_sticky_ena(REG,352)
    redist21_in_rsrvd_fix_numerator_22_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_22_sticky_ena_q <= "0";
            ELSE
                IF (redist21_in_rsrvd_fix_numerator_22_nor_q = "1") THEN
                    redist21_in_rsrvd_fix_numerator_22_sticky_ena_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_22_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_22_enaAnd(LOGICAL,353)
    redist21_in_rsrvd_fix_numerator_22_enaAnd_q <= redist21_in_rsrvd_fix_numerator_22_sticky_ena_q and en;

    -- redist21_in_rsrvd_fix_numerator_22_rdcnt(COUNTER,344)
    -- low=0, high=18, step=1, init=0
    redist21_in_rsrvd_fix_numerator_22_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_22_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist21_in_rsrvd_fix_numerator_22_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist21_in_rsrvd_fix_numerator_22_rdcnt_i = TO_UNSIGNED(17, 5)) THEN
                        redist21_in_rsrvd_fix_numerator_22_rdcnt_eq <= '1';
                    ELSE
                        redist21_in_rsrvd_fix_numerator_22_rdcnt_eq <= '0';
                    END IF;
                    IF (redist21_in_rsrvd_fix_numerator_22_rdcnt_eq = '1') THEN
                        redist21_in_rsrvd_fix_numerator_22_rdcnt_i <= redist21_in_rsrvd_fix_numerator_22_rdcnt_i + 14;
                    ELSE
                        redist21_in_rsrvd_fix_numerator_22_rdcnt_i <= redist21_in_rsrvd_fix_numerator_22_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist21_in_rsrvd_fix_numerator_22_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist21_in_rsrvd_fix_numerator_22_rdcnt_i, 5)));

    -- redist21_in_rsrvd_fix_numerator_22_rdmux(MUX,345)
    redist21_in_rsrvd_fix_numerator_22_rdmux_s <= en;
    redist21_in_rsrvd_fix_numerator_22_rdmux_combproc: PROCESS (redist21_in_rsrvd_fix_numerator_22_rdmux_s, redist21_in_rsrvd_fix_numerator_22_wraddr_q, redist21_in_rsrvd_fix_numerator_22_rdcnt_q)
    BEGIN
        CASE (redist21_in_rsrvd_fix_numerator_22_rdmux_s) IS
            WHEN "0" => redist21_in_rsrvd_fix_numerator_22_rdmux_q <= redist21_in_rsrvd_fix_numerator_22_wraddr_q;
            WHEN "1" => redist21_in_rsrvd_fix_numerator_22_rdmux_q <= redist21_in_rsrvd_fix_numerator_22_rdcnt_q;
            WHEN OTHERS => redist21_in_rsrvd_fix_numerator_22_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_22_inputreg0(DELAY,341)
    redist21_in_rsrvd_fix_numerator_22_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_22_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist21_in_rsrvd_fix_numerator_22_inputreg0_q <= STD_LOGIC_VECTOR(numerator);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_22_wraddr(REG,346)
    redist21_in_rsrvd_fix_numerator_22_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_22_wraddr_q <= "10010";
            ELSE
                redist21_in_rsrvd_fix_numerator_22_wraddr_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_22_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_22_mem(DUALMEM,343)
    redist21_in_rsrvd_fix_numerator_22_mem_ia <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_22_inputreg0_q);
    redist21_in_rsrvd_fix_numerator_22_mem_aa <= redist21_in_rsrvd_fix_numerator_22_wraddr_q;
    redist21_in_rsrvd_fix_numerator_22_mem_ab <= redist21_in_rsrvd_fix_numerator_22_rdmux_q;
    redist21_in_rsrvd_fix_numerator_22_mem_reset0 <= rst;
    redist21_in_rsrvd_fix_numerator_22_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 19,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist21_in_rsrvd_fix_numerator_22_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist21_in_rsrvd_fix_numerator_22_mem_reset0,
        clock1 => clk,
        address_a => redist21_in_rsrvd_fix_numerator_22_mem_aa,
        data_a => redist21_in_rsrvd_fix_numerator_22_mem_ia,
        wren_a => en(0),
        address_b => redist21_in_rsrvd_fix_numerator_22_mem_ab,
        q_b => redist21_in_rsrvd_fix_numerator_22_mem_iq
    );
    redist21_in_rsrvd_fix_numerator_22_mem_q <= redist21_in_rsrvd_fix_numerator_22_mem_iq(31 downto 0);

    -- redist21_in_rsrvd_fix_numerator_22_outputreg0(DELAY,342)
    redist21_in_rsrvd_fix_numerator_22_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_22_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist21_in_rsrvd_fix_numerator_22_outputreg0_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_22_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- prodXInvY_uid27_divider_bs6(BITSELECT,194)@22
    prodXInvY_uid27_divider_bs6_in <= redist21_in_rsrvd_fix_numerator_22_outputreg0_q(17 downto 0);
    prodXInvY_uid27_divider_bs6_b <= prodXInvY_uid27_divider_bs6_in(17 downto 0);

    -- oneInvRes_uid23_divider(CONSTANT,22)
    oneInvRes_uid23_divider_q <= "100000000000000000000000000000000";

    -- leftShiftStage2Idx3Rng3_uid184_normY_uid10_divider(BITSELECT,183)@3
    leftShiftStage2Idx3Rng3_uid184_normY_uid10_divider_in <= leftShiftStage1_uid176_normY_uid10_divider_q(28 downto 0);
    leftShiftStage2Idx3Rng3_uid184_normY_uid10_divider_b <= leftShiftStage2Idx3Rng3_uid184_normY_uid10_divider_in(28 downto 0);

    -- leftShiftStage2Idx3_uid185_normY_uid10_divider(BITJOIN,184)@3
    leftShiftStage2Idx3_uid185_normY_uid10_divider_q <= leftShiftStage2Idx3Rng3_uid184_normY_uid10_divider_b & leftShiftStage2Idx3Pad3_uid183_normY_uid10_divider_q;

    -- leftShiftStage2Idx2Rng2_uid181_normY_uid10_divider(BITSELECT,180)@3
    leftShiftStage2Idx2Rng2_uid181_normY_uid10_divider_in <= leftShiftStage1_uid176_normY_uid10_divider_q(29 downto 0);
    leftShiftStage2Idx2Rng2_uid181_normY_uid10_divider_b <= leftShiftStage2Idx2Rng2_uid181_normY_uid10_divider_in(29 downto 0);

    -- leftShiftStage2Idx2_uid182_normY_uid10_divider(BITJOIN,181)@3
    leftShiftStage2Idx2_uid182_normY_uid10_divider_q <= leftShiftStage2Idx2Rng2_uid181_normY_uid10_divider_b & zs_uid70_zCount_uid9_divider_q;

    -- leftShiftStage2Idx1Rng1_uid178_normY_uid10_divider(BITSELECT,177)@3
    leftShiftStage2Idx1Rng1_uid178_normY_uid10_divider_in <= leftShiftStage1_uid176_normY_uid10_divider_q(30 downto 0);
    leftShiftStage2Idx1Rng1_uid178_normY_uid10_divider_b <= leftShiftStage2Idx1Rng1_uid178_normY_uid10_divider_in(30 downto 0);

    -- leftShiftStage2Idx1_uid179_normY_uid10_divider(BITJOIN,178)@3
    leftShiftStage2Idx1_uid179_normY_uid10_divider_q <= leftShiftStage2Idx1Rng1_uid178_normY_uid10_divider_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid173_normY_uid10_divider(BITSELECT,172)@3
    leftShiftStage1Idx3Rng12_uid173_normY_uid10_divider_in <= leftShiftStage0_uid165_normY_uid10_divider_q(19 downto 0);
    leftShiftStage1Idx3Rng12_uid173_normY_uid10_divider_b <= leftShiftStage1Idx3Rng12_uid173_normY_uid10_divider_in(19 downto 0);

    -- leftShiftStage1Idx3_uid174_normY_uid10_divider(BITJOIN,173)@3
    leftShiftStage1Idx3_uid174_normY_uid10_divider_q <= leftShiftStage1Idx3Rng12_uid173_normY_uid10_divider_b & rightBottomX_bottomExtension_uid143_pT3_uid110_invPolyEval_q;

    -- leftShiftStage1Idx2Rng8_uid170_normY_uid10_divider(BITSELECT,169)@3
    leftShiftStage1Idx2Rng8_uid170_normY_uid10_divider_in <= leftShiftStage0_uid165_normY_uid10_divider_q(23 downto 0);
    leftShiftStage1Idx2Rng8_uid170_normY_uid10_divider_b <= leftShiftStage1Idx2Rng8_uid170_normY_uid10_divider_in(23 downto 0);

    -- leftShiftStage1Idx2_uid171_normY_uid10_divider(BITJOIN,170)@3
    leftShiftStage1Idx2_uid171_normY_uid10_divider_q <= leftShiftStage1Idx2Rng8_uid170_normY_uid10_divider_b & zs_uid58_zCount_uid9_divider_q;

    -- leftShiftStage1Idx1Rng4_uid167_normY_uid10_divider(BITSELECT,166)@3
    leftShiftStage1Idx1Rng4_uid167_normY_uid10_divider_in <= leftShiftStage0_uid165_normY_uid10_divider_q(27 downto 0);
    leftShiftStage1Idx1Rng4_uid167_normY_uid10_divider_b <= leftShiftStage1Idx1Rng4_uid167_normY_uid10_divider_in(27 downto 0);

    -- leftShiftStage1Idx1_uid168_normY_uid10_divider(BITJOIN,167)@3
    leftShiftStage1Idx1_uid168_normY_uid10_divider_q <= leftShiftStage1Idx1Rng4_uid167_normY_uid10_divider_b & zs_uid64_zCount_uid9_divider_q;

    -- leftShiftStage0Idx1Rng16_uid160_normY_uid10_divider(BITSELECT,159)@3
    leftShiftStage0Idx1Rng16_uid160_normY_uid10_divider_in <= redist24_in_rsrvd_fix_denominator_3_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid160_normY_uid10_divider_b <= leftShiftStage0Idx1Rng16_uid160_normY_uid10_divider_in(15 downto 0);

    -- leftShiftStage0Idx1_uid161_normY_uid10_divider(BITJOIN,160)@3
    leftShiftStage0Idx1_uid161_normY_uid10_divider_q <= leftShiftStage0Idx1Rng16_uid160_normY_uid10_divider_b & zs_uid52_zCount_uid9_divider_q;

    -- redist23_in_rsrvd_fix_denominator_1(DELAY,310)
    redist23_in_rsrvd_fix_denominator_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist23_in_rsrvd_fix_denominator_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist23_in_rsrvd_fix_denominator_1_q <= STD_LOGIC_VECTOR(denominator);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist24_in_rsrvd_fix_denominator_3(DELAY,311)
    redist24_in_rsrvd_fix_denominator_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist24_in_rsrvd_fix_denominator_3_delay_0 <= (others => '0');
                redist24_in_rsrvd_fix_denominator_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist24_in_rsrvd_fix_denominator_3_delay_0 <= STD_LOGIC_VECTOR(redist23_in_rsrvd_fix_denominator_1_q);
                    redist24_in_rsrvd_fix_denominator_3_q <= redist24_in_rsrvd_fix_denominator_3_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage0_uid165_normY_uid10_divider(MUX,164)@3
    leftShiftStage0_uid165_normY_uid10_divider_s <= leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_b;
    leftShiftStage0_uid165_normY_uid10_divider_combproc: PROCESS (leftShiftStage0_uid165_normY_uid10_divider_s, redist24_in_rsrvd_fix_denominator_3_q, leftShiftStage0Idx1_uid161_normY_uid10_divider_q, zs_uid46_zCount_uid9_divider_q)
    BEGIN
        CASE (leftShiftStage0_uid165_normY_uid10_divider_s) IS
            WHEN "00" => leftShiftStage0_uid165_normY_uid10_divider_q <= redist24_in_rsrvd_fix_denominator_3_q;
            WHEN "01" => leftShiftStage0_uid165_normY_uid10_divider_q <= leftShiftStage0Idx1_uid161_normY_uid10_divider_q;
            WHEN "10" => leftShiftStage0_uid165_normY_uid10_divider_q <= zs_uid46_zCount_uid9_divider_q;
            WHEN "11" => leftShiftStage0_uid165_normY_uid10_divider_q <= zs_uid46_zCount_uid9_divider_q;
            WHEN OTHERS => leftShiftStage0_uid165_normY_uid10_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid176_normY_uid10_divider(MUX,175)@3
    leftShiftStage1_uid176_normY_uid10_divider_s <= leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_c;
    leftShiftStage1_uid176_normY_uid10_divider_combproc: PROCESS (leftShiftStage1_uid176_normY_uid10_divider_s, leftShiftStage0_uid165_normY_uid10_divider_q, leftShiftStage1Idx1_uid168_normY_uid10_divider_q, leftShiftStage1Idx2_uid171_normY_uid10_divider_q, leftShiftStage1Idx3_uid174_normY_uid10_divider_q)
    BEGIN
        CASE (leftShiftStage1_uid176_normY_uid10_divider_s) IS
            WHEN "00" => leftShiftStage1_uid176_normY_uid10_divider_q <= leftShiftStage0_uid165_normY_uid10_divider_q;
            WHEN "01" => leftShiftStage1_uid176_normY_uid10_divider_q <= leftShiftStage1Idx1_uid168_normY_uid10_divider_q;
            WHEN "10" => leftShiftStage1_uid176_normY_uid10_divider_q <= leftShiftStage1Idx2_uid171_normY_uid10_divider_q;
            WHEN "11" => leftShiftStage1_uid176_normY_uid10_divider_q <= leftShiftStage1Idx3_uid174_normY_uid10_divider_q;
            WHEN OTHERS => leftShiftStage1_uid176_normY_uid10_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- vCount_uid48_zCount_uid9_divider(LOGICAL,47)@0 + 1
    vCount_uid48_zCount_uid9_divider_qi <= "1" WHEN denominator = zs_uid46_zCount_uid9_divider_q ELSE "0";
    vCount_uid48_zCount_uid9_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid48_zCount_uid9_divider_qi, xout => vCount_uid48_zCount_uid9_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- redist14_vCount_uid48_zCount_uid9_divider_q_3(DELAY,301)
    redist14_vCount_uid48_zCount_uid9_divider_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist14_vCount_uid48_zCount_uid9_divider_q_3_delay_0 <= (others => '0');
                redist14_vCount_uid48_zCount_uid9_divider_q_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist14_vCount_uid48_zCount_uid9_divider_q_3_delay_0 <= STD_LOGIC_VECTOR(vCount_uid48_zCount_uid9_divider_q);
                    redist14_vCount_uid48_zCount_uid9_divider_q_3_q <= redist14_vCount_uid48_zCount_uid9_divider_q_3_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid51_zCount_uid9_divider(MUX,50)@1
    vStagei_uid51_zCount_uid9_divider_s <= vCount_uid48_zCount_uid9_divider_q;
    vStagei_uid51_zCount_uid9_divider_combproc: PROCESS (vStagei_uid51_zCount_uid9_divider_s, redist23_in_rsrvd_fix_denominator_1_q, cstValOvf_uid36_divider_q)
    BEGIN
        CASE (vStagei_uid51_zCount_uid9_divider_s) IS
            WHEN "0" => vStagei_uid51_zCount_uid9_divider_q <= redist23_in_rsrvd_fix_denominator_1_q;
            WHEN "1" => vStagei_uid51_zCount_uid9_divider_q <= cstValOvf_uid36_divider_q;
            WHEN OTHERS => vStagei_uid51_zCount_uid9_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid53_zCount_uid9_divider_merged_bit_select(BITSELECT,280)@1
    rVStage_uid53_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid51_zCount_uid9_divider_q(31 downto 16);
    rVStage_uid53_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid51_zCount_uid9_divider_q(15 downto 0);

    -- vCount_uid54_zCount_uid9_divider(LOGICAL,53)@1
    vCount_uid54_zCount_uid9_divider_q <= "1" WHEN rVStage_uid53_zCount_uid9_divider_merged_bit_select_b = zs_uid52_zCount_uid9_divider_q ELSE "0";

    -- redist13_vCount_uid54_zCount_uid9_divider_q_2(DELAY,300)
    redist13_vCount_uid54_zCount_uid9_divider_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist13_vCount_uid54_zCount_uid9_divider_q_2_delay_0 <= (others => '0');
                redist13_vCount_uid54_zCount_uid9_divider_q_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist13_vCount_uid54_zCount_uid9_divider_q_2_delay_0 <= STD_LOGIC_VECTOR(vCount_uid54_zCount_uid9_divider_q);
                    redist13_vCount_uid54_zCount_uid9_divider_q_2_q <= redist13_vCount_uid54_zCount_uid9_divider_q_2_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid57_zCount_uid9_divider(MUX,56)@1 + 1
    vStagei_uid57_zCount_uid9_divider_s <= vCount_uid54_zCount_uid9_divider_q;
    vStagei_uid57_zCount_uid9_divider_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                vStagei_uid57_zCount_uid9_divider_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (vStagei_uid57_zCount_uid9_divider_s) IS
                        WHEN "0" => vStagei_uid57_zCount_uid9_divider_q <= rVStage_uid53_zCount_uid9_divider_merged_bit_select_b;
                        WHEN "1" => vStagei_uid57_zCount_uid9_divider_q <= rVStage_uid53_zCount_uid9_divider_merged_bit_select_c;
                        WHEN OTHERS => vStagei_uid57_zCount_uid9_divider_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid59_zCount_uid9_divider_merged_bit_select(BITSELECT,281)@2
    rVStage_uid59_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid57_zCount_uid9_divider_q(15 downto 8);
    rVStage_uid59_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid57_zCount_uid9_divider_q(7 downto 0);

    -- vCount_uid60_zCount_uid9_divider(LOGICAL,59)@2
    vCount_uid60_zCount_uid9_divider_q <= "1" WHEN rVStage_uid59_zCount_uid9_divider_merged_bit_select_b = zs_uid58_zCount_uid9_divider_q ELSE "0";

    -- redist12_vCount_uid60_zCount_uid9_divider_q_1(DELAY,299)
    redist12_vCount_uid60_zCount_uid9_divider_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist12_vCount_uid60_zCount_uid9_divider_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist12_vCount_uid60_zCount_uid9_divider_q_1_q <= STD_LOGIC_VECTOR(vCount_uid60_zCount_uid9_divider_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid63_zCount_uid9_divider(MUX,62)@2
    vStagei_uid63_zCount_uid9_divider_s <= vCount_uid60_zCount_uid9_divider_q;
    vStagei_uid63_zCount_uid9_divider_combproc: PROCESS (vStagei_uid63_zCount_uid9_divider_s, rVStage_uid59_zCount_uid9_divider_merged_bit_select_b, rVStage_uid59_zCount_uid9_divider_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid63_zCount_uid9_divider_s) IS
            WHEN "0" => vStagei_uid63_zCount_uid9_divider_q <= rVStage_uid59_zCount_uid9_divider_merged_bit_select_b;
            WHEN "1" => vStagei_uid63_zCount_uid9_divider_q <= rVStage_uid59_zCount_uid9_divider_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid63_zCount_uid9_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid65_zCount_uid9_divider_merged_bit_select(BITSELECT,282)@2
    rVStage_uid65_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid63_zCount_uid9_divider_q(7 downto 4);
    rVStage_uid65_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid63_zCount_uid9_divider_q(3 downto 0);

    -- vCount_uid66_zCount_uid9_divider(LOGICAL,65)@2
    vCount_uid66_zCount_uid9_divider_q <= "1" WHEN rVStage_uid65_zCount_uid9_divider_merged_bit_select_b = zs_uid64_zCount_uid9_divider_q ELSE "0";

    -- redist11_vCount_uid66_zCount_uid9_divider_q_1(DELAY,298)
    redist11_vCount_uid66_zCount_uid9_divider_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist11_vCount_uid66_zCount_uid9_divider_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist11_vCount_uid66_zCount_uid9_divider_q_1_q <= STD_LOGIC_VECTOR(vCount_uid66_zCount_uid9_divider_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid69_zCount_uid9_divider(MUX,68)@2 + 1
    vStagei_uid69_zCount_uid9_divider_s <= vCount_uid66_zCount_uid9_divider_q;
    vStagei_uid69_zCount_uid9_divider_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                vStagei_uid69_zCount_uid9_divider_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (vStagei_uid69_zCount_uid9_divider_s) IS
                        WHEN "0" => vStagei_uid69_zCount_uid9_divider_q <= rVStage_uid65_zCount_uid9_divider_merged_bit_select_b;
                        WHEN "1" => vStagei_uid69_zCount_uid9_divider_q <= rVStage_uid65_zCount_uid9_divider_merged_bit_select_c;
                        WHEN OTHERS => vStagei_uid69_zCount_uid9_divider_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid71_zCount_uid9_divider_merged_bit_select(BITSELECT,283)@3
    rVStage_uid71_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid69_zCount_uid9_divider_q(3 downto 2);
    rVStage_uid71_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid69_zCount_uid9_divider_q(1 downto 0);

    -- vCount_uid72_zCount_uid9_divider(LOGICAL,71)@3
    vCount_uid72_zCount_uid9_divider_q <= "1" WHEN rVStage_uid71_zCount_uid9_divider_merged_bit_select_b = zs_uid70_zCount_uid9_divider_q ELSE "0";

    -- vStagei_uid75_zCount_uid9_divider(MUX,74)@3
    vStagei_uid75_zCount_uid9_divider_s <= vCount_uid72_zCount_uid9_divider_q;
    vStagei_uid75_zCount_uid9_divider_combproc: PROCESS (vStagei_uid75_zCount_uid9_divider_s, rVStage_uid71_zCount_uid9_divider_merged_bit_select_b, rVStage_uid71_zCount_uid9_divider_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid75_zCount_uid9_divider_s) IS
            WHEN "0" => vStagei_uid75_zCount_uid9_divider_q <= rVStage_uid71_zCount_uid9_divider_merged_bit_select_b;
            WHEN "1" => vStagei_uid75_zCount_uid9_divider_q <= rVStage_uid71_zCount_uid9_divider_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid75_zCount_uid9_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid77_zCount_uid9_divider(BITSELECT,76)@3
    rVStage_uid77_zCount_uid9_divider_b <= vStagei_uid75_zCount_uid9_divider_q(1 downto 1);

    -- vCount_uid78_zCount_uid9_divider(LOGICAL,77)@3
    vCount_uid78_zCount_uid9_divider_q <= "1" WHEN rVStage_uid77_zCount_uid9_divider_b = GND_q ELSE "0";

    -- r_uid79_zCount_uid9_divider(BITJOIN,78)@3
    r_uid79_zCount_uid9_divider_q <= redist14_vCount_uid48_zCount_uid9_divider_q_3_q & redist13_vCount_uid54_zCount_uid9_divider_q_2_q & redist12_vCount_uid60_zCount_uid9_divider_q_1_q & redist11_vCount_uid66_zCount_uid9_divider_q_1_q & vCount_uid72_zCount_uid9_divider_q & vCount_uid78_zCount_uid9_divider_q;

    -- leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select(BITSELECT,284)@3
    leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_b <= r_uid79_zCount_uid9_divider_q(5 downto 4);
    leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_c <= r_uid79_zCount_uid9_divider_q(3 downto 2);
    leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_d <= r_uid79_zCount_uid9_divider_q(1 downto 0);

    -- leftShiftStage2_uid187_normY_uid10_divider(MUX,186)@3
    leftShiftStage2_uid187_normY_uid10_divider_s <= leftShiftStageSel0Dto4_uid164_normY_uid10_divider_merged_bit_select_d;
    leftShiftStage2_uid187_normY_uid10_divider_combproc: PROCESS (leftShiftStage2_uid187_normY_uid10_divider_s, leftShiftStage1_uid176_normY_uid10_divider_q, leftShiftStage2Idx1_uid179_normY_uid10_divider_q, leftShiftStage2Idx2_uid182_normY_uid10_divider_q, leftShiftStage2Idx3_uid185_normY_uid10_divider_q)
    BEGIN
        CASE (leftShiftStage2_uid187_normY_uid10_divider_s) IS
            WHEN "00" => leftShiftStage2_uid187_normY_uid10_divider_q <= leftShiftStage1_uid176_normY_uid10_divider_q;
            WHEN "01" => leftShiftStage2_uid187_normY_uid10_divider_q <= leftShiftStage2Idx1_uid179_normY_uid10_divider_q;
            WHEN "10" => leftShiftStage2_uid187_normY_uid10_divider_q <= leftShiftStage2Idx2_uid182_normY_uid10_divider_q;
            WHEN "11" => leftShiftStage2_uid187_normY_uid10_divider_q <= leftShiftStage2Idx3_uid185_normY_uid10_divider_q;
            WHEN OTHERS => leftShiftStage2_uid187_normY_uid10_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- normYNoLeadOne_uid11_divider(BITSELECT,10)@3
    normYNoLeadOne_uid11_divider_in <= leftShiftStage2_uid187_normY_uid10_divider_q(30 downto 0);
    normYNoLeadOne_uid11_divider_b <= normYNoLeadOne_uid11_divider_in(30 downto 0);

    -- yAddr_uid19_divider_merged_bit_select(BITSELECT,278)@3
    yAddr_uid19_divider_merged_bit_select_b <= normYNoLeadOne_uid11_divider_b(30 downto 23);
    yAddr_uid19_divider_merged_bit_select_c <= normYNoLeadOne_uid11_divider_b(22 downto 0);

    -- redist6_yAddr_uid19_divider_merged_bit_select_c_2(DELAY,293)
    redist6_yAddr_uid19_divider_merged_bit_select_c_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist6_yAddr_uid19_divider_merged_bit_select_c_2_delay_0 <= (others => '0');
                redist6_yAddr_uid19_divider_merged_bit_select_c_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist6_yAddr_uid19_divider_merged_bit_select_c_2_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid19_divider_merged_bit_select_c);
                    redist6_yAddr_uid19_divider_merged_bit_select_c_2_q <= redist6_yAddr_uid19_divider_merged_bit_select_c_2_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist7_yAddr_uid19_divider_merged_bit_select_c_7(DELAY,294)
    redist7_yAddr_uid19_divider_merged_bit_select_c_7_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_0 <= (others => '0');
                redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_1 <= (others => '0');
                redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_2 <= (others => '0');
                redist7_yAddr_uid19_divider_merged_bit_select_c_7_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_0 <= STD_LOGIC_VECTOR(redist6_yAddr_uid19_divider_merged_bit_select_c_2_q);
                    redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_1 <= redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_0;
                    redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_2 <= redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_1;
                    redist7_yAddr_uid19_divider_merged_bit_select_c_7_q <= redist7_yAddr_uid19_divider_merged_bit_select_c_7_delay_2;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist7_yAddr_uid19_divider_merged_bit_select_c_7_outputreg0(DELAY,314)
    redist7_yAddr_uid19_divider_merged_bit_select_c_7_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist7_yAddr_uid19_divider_merged_bit_select_c_7_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist7_yAddr_uid19_divider_merged_bit_select_c_7_outputreg0_q <= STD_LOGIC_VECTOR(redist7_yAddr_uid19_divider_merged_bit_select_c_7_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist8_yAddr_uid19_divider_merged_bit_select_c_13_inputreg0(DELAY,315)
    redist8_yAddr_uid19_divider_merged_bit_select_c_13_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist8_yAddr_uid19_divider_merged_bit_select_c_13_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist8_yAddr_uid19_divider_merged_bit_select_c_13_inputreg0_q <= STD_LOGIC_VECTOR(redist7_yAddr_uid19_divider_merged_bit_select_c_7_outputreg0_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist8_yAddr_uid19_divider_merged_bit_select_c_13(DELAY,295)
    redist8_yAddr_uid19_divider_merged_bit_select_c_13_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_0 <= (others => '0');
                redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_1 <= (others => '0');
                redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_2 <= (others => '0');
                redist8_yAddr_uid19_divider_merged_bit_select_c_13_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_0 <= STD_LOGIC_VECTOR(redist8_yAddr_uid19_divider_merged_bit_select_c_13_inputreg0_q);
                    redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_1 <= redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_0;
                    redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_2 <= redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_1;
                    redist8_yAddr_uid19_divider_merged_bit_select_c_13_q <= redist8_yAddr_uid19_divider_merged_bit_select_c_13_delay_2;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist8_yAddr_uid19_divider_merged_bit_select_c_13_outputreg0(DELAY,316)
    redist8_yAddr_uid19_divider_merged_bit_select_c_13_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist8_yAddr_uid19_divider_merged_bit_select_c_13_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist8_yAddr_uid19_divider_merged_bit_select_c_13_outputreg0_q <= STD_LOGIC_VECTOR(redist8_yAddr_uid19_divider_merged_bit_select_c_13_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- nx_mergedSignalTM_uid134_pT3_uid110_invPolyEval(BITJOIN,133)@16
    nx_mergedSignalTM_uid134_pT3_uid110_invPolyEval_q <= GND_q & redist8_yAddr_uid19_divider_merged_bit_select_c_13_outputreg0_q;

    -- topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select(BITSELECT,286)@16
    topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid134_pT3_uid110_invPolyEval_q(23 downto 6));
    topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid134_pT3_uid110_invPolyEval_q(5 downto 0));

    -- aboveLeftY_bottomExtension_uid139_pT3_uid110_invPolyEval(CONSTANT,138)
    aboveLeftY_bottomExtension_uid139_pT3_uid110_invPolyEval_q <= "00000";

    -- aboveLeftY_mergedSignalTM_uid141_pT3_uid110_invPolyEval(BITJOIN,140)@16
    aboveLeftY_mergedSignalTM_uid141_pT3_uid110_invPolyEval_q <= topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select_c & aboveLeftY_bottomExtension_uid139_pT3_uid110_invPolyEval_q;

    -- memoryC3_uid90_invTabGen_lutmem(DUALMEM,267)@3 + 2
    -- in j@20000000
    memoryC3_uid90_invTabGen_lutmem_aa <= yAddr_uid19_divider_merged_bit_select_b;
    memoryC3_uid90_invTabGen_lutmem_reset0 <= rst;
    memoryC3_uid90_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 14,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_2oqd7oi_memoryC3_uid90_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC3_uid90_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid90_invTabGen_lutmem_aa,
        q_a => memoryC3_uid90_invTabGen_lutmem_ir
    );
    memoryC3_uid90_invTabGen_lutmem_r <= memoryC3_uid90_invTabGen_lutmem_ir(13 downto 0);

    -- yT1_uid97_invPolyEval(BITSELECT,96)@5
    yT1_uid97_invPolyEval_b <= redist6_yAddr_uid19_divider_merged_bit_select_c_2_q(22 downto 9);

    -- prodXY_uid116_pT1_uid98_invPolyEval_cma(CHAINMULTADD,268)@5 + 4
    -- out q@10
    prodXY_uid116_pT1_uid98_invPolyEval_cma_reset <= rst;
    prodXY_uid116_pT1_uid98_invPolyEval_cma_ena0 <= en(0) or prodXY_uid116_pT1_uid98_invPolyEval_cma_reset;
    prodXY_uid116_pT1_uid98_invPolyEval_cma_ena1 <= prodXY_uid116_pT1_uid98_invPolyEval_cma_ena0;
    prodXY_uid116_pT1_uid98_invPolyEval_cma_ena2 <= prodXY_uid116_pT1_uid98_invPolyEval_cma_ena0;
    prodXY_uid116_pT1_uid98_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid116_pT1_uid98_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid97_invPolyEval_b),14);
                    prodXY_uid116_pT1_uid98_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(memoryC3_uid90_invTabGen_lutmem_r),14);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid116_pT1_uid98_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid116_pT1_uid98_invPolyEval_cma_ah(0));
    prodXY_uid116_pT1_uid98_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid116_pT1_uid98_invPolyEval_cma_ch(0));
    prodXY_uid116_pT1_uid98_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 14,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 28,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid116_pT1_uid98_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid116_pT1_uid98_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid116_pT1_uid98_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid116_pT1_uid98_invPolyEval_cma_reset,
        clr(1) => prodXY_uid116_pT1_uid98_invPolyEval_cma_reset,
        ay => prodXY_uid116_pT1_uid98_invPolyEval_cma_a0,
        ax => prodXY_uid116_pT1_uid98_invPolyEval_cma_c0,
        resulta => prodXY_uid116_pT1_uid98_invPolyEval_cma_s0
    );
    prodXY_uid116_pT1_uid98_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid116_pT1_uid98_invPolyEval_cma_s0, xout => prodXY_uid116_pT1_uid98_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXY_uid116_pT1_uid98_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid116_pT1_uid98_invPolyEval_cma_qq(27 downto 0));

    -- osig_uid117_pT1_uid98_invPolyEval(BITSELECT,116)@10
    osig_uid117_pT1_uid98_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid116_pT1_uid98_invPolyEval_cma_q(27 downto 14));

    -- highBBits_uid100_invPolyEval(BITSELECT,99)@10
    highBBits_uid100_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid117_pT1_uid98_invPolyEval_b(13 downto 1));

    -- redist3_yAddr_uid19_divider_merged_bit_select_b_5(DELAY,290)
    redist3_yAddr_uid19_divider_merged_bit_select_b_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_0 <= (others => '0');
                redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_1 <= (others => '0');
                redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_2 <= (others => '0');
                redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_3 <= (others => '0');
                redist3_yAddr_uid19_divider_merged_bit_select_b_5_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid19_divider_merged_bit_select_b);
                    redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_1 <= redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_0;
                    redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_2 <= redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_1;
                    redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_3 <= redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_2;
                    redist3_yAddr_uid19_divider_merged_bit_select_b_5_q <= redist3_yAddr_uid19_divider_merged_bit_select_b_5_delay_3;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid87_invTabGen_lutmem(DUALMEM,266)@8 + 2
    -- in j@20000000
    memoryC2_uid87_invTabGen_lutmem_aa <= redist3_yAddr_uid19_divider_merged_bit_select_b_5_q;
    memoryC2_uid87_invTabGen_lutmem_reset0 <= rst;
    memoryC2_uid87_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_2oqd7oi_memoryC2_uid87_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC2_uid87_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid87_invTabGen_lutmem_aa,
        q_a => memoryC2_uid87_invTabGen_lutmem_ir
    );
    memoryC2_uid87_invTabGen_lutmem_r <= memoryC2_uid87_invTabGen_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid101_invPolyEval(ADD,100)@10
    s1sumAHighB_uid101_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC2_uid87_invTabGen_lutmem_r(20)) & memoryC2_uid87_invTabGen_lutmem_r));
    s1sumAHighB_uid101_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid100_invPolyEval_b(12)) & highBBits_uid100_invPolyEval_b));
    s1sumAHighB_uid101_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid101_invPolyEval_a) + SIGNED(s1sumAHighB_uid101_invPolyEval_b));
    s1sumAHighB_uid101_invPolyEval_q <= s1sumAHighB_uid101_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid99_invPolyEval(BITSELECT,98)@10
    lowRangeB_uid99_invPolyEval_in <= osig_uid117_pT1_uid98_invPolyEval_b(0 downto 0);
    lowRangeB_uid99_invPolyEval_b <= lowRangeB_uid99_invPolyEval_in(0 downto 0);

    -- s1_uid102_invPolyEval(BITJOIN,101)@10
    s1_uid102_invPolyEval_q <= s1sumAHighB_uid101_invPolyEval_q & lowRangeB_uid99_invPolyEval_b;

    -- yT2_uid103_invPolyEval(BITSELECT,102)@10
    yT2_uid103_invPolyEval_b <= redist7_yAddr_uid19_divider_merged_bit_select_c_7_outputreg0_q(22 downto 2);

    -- prodXY_uid119_pT2_uid104_invPolyEval_cma(CHAINMULTADD,269)@10 + 4
    -- out q@15
    prodXY_uid119_pT2_uid104_invPolyEval_cma_reset <= rst;
    prodXY_uid119_pT2_uid104_invPolyEval_cma_ena0 <= en(0) or prodXY_uid119_pT2_uid104_invPolyEval_cma_reset;
    prodXY_uid119_pT2_uid104_invPolyEval_cma_ena1 <= prodXY_uid119_pT2_uid104_invPolyEval_cma_ena0;
    prodXY_uid119_pT2_uid104_invPolyEval_cma_ena2 <= prodXY_uid119_pT2_uid104_invPolyEval_cma_ena0;
    prodXY_uid119_pT2_uid104_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid119_pT2_uid104_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT2_uid103_invPolyEval_b),21);
                    prodXY_uid119_pT2_uid104_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(s1_uid102_invPolyEval_q),23);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid119_pT2_uid104_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid119_pT2_uid104_invPolyEval_cma_ah(0));
    prodXY_uid119_pT2_uid104_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid119_pT2_uid104_invPolyEval_cma_ch(0));
    prodXY_uid119_pT2_uid104_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 21,
        ax_clock => "0",
        ax_width => 23,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 44
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid119_pT2_uid104_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid119_pT2_uid104_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid119_pT2_uid104_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid119_pT2_uid104_invPolyEval_cma_reset,
        clr(1) => prodXY_uid119_pT2_uid104_invPolyEval_cma_reset,
        ay => prodXY_uid119_pT2_uid104_invPolyEval_cma_a0,
        ax => prodXY_uid119_pT2_uid104_invPolyEval_cma_c0,
        resulta => prodXY_uid119_pT2_uid104_invPolyEval_cma_s0
    );
    prodXY_uid119_pT2_uid104_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 44, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid119_pT2_uid104_invPolyEval_cma_s0, xout => prodXY_uid119_pT2_uid104_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXY_uid119_pT2_uid104_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid119_pT2_uid104_invPolyEval_cma_qq(43 downto 0));

    -- osig_uid120_pT2_uid104_invPolyEval(BITSELECT,119)@15
    osig_uid120_pT2_uid104_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid119_pT2_uid104_invPolyEval_cma_q(43 downto 21));

    -- highBBits_uid106_invPolyEval(BITSELECT,105)@15
    highBBits_uid106_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid120_pT2_uid104_invPolyEval_b(22 downto 1));

    -- redist4_yAddr_uid19_divider_merged_bit_select_b_10(DELAY,291)
    redist4_yAddr_uid19_divider_merged_bit_select_b_10_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_0 <= (others => '0');
                redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_1 <= (others => '0');
                redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_2 <= (others => '0');
                redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_3 <= (others => '0');
                redist4_yAddr_uid19_divider_merged_bit_select_b_10_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_0 <= STD_LOGIC_VECTOR(redist3_yAddr_uid19_divider_merged_bit_select_b_5_q);
                    redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_1 <= redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_0;
                    redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_2 <= redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_1;
                    redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_3 <= redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_2;
                    redist4_yAddr_uid19_divider_merged_bit_select_b_10_q <= redist4_yAddr_uid19_divider_merged_bit_select_b_10_delay_3;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid84_invTabGen_lutmem(DUALMEM,265)@13 + 2
    -- in j@20000000
    memoryC1_uid84_invTabGen_lutmem_aa <= redist4_yAddr_uid19_divider_merged_bit_select_b_10_q;
    memoryC1_uid84_invTabGen_lutmem_reset0 <= rst;
    memoryC1_uid84_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_2oqd7oi_memoryC1_uid84_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC1_uid84_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid84_invTabGen_lutmem_aa,
        q_a => memoryC1_uid84_invTabGen_lutmem_ir
    );
    memoryC1_uid84_invTabGen_lutmem_r <= memoryC1_uid84_invTabGen_lutmem_ir(28 downto 0);

    -- s2sumAHighB_uid107_invPolyEval(ADD,106)@15 + 1
    s2sumAHighB_uid107_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC1_uid84_invTabGen_lutmem_r(28)) & memoryC1_uid84_invTabGen_lutmem_r));
    s2sumAHighB_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid106_invPolyEval_b(21)) & highBBits_uid106_invPolyEval_b));
    s2sumAHighB_uid107_invPolyEval_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                s2sumAHighB_uid107_invPolyEval_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    s2sumAHighB_uid107_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid107_invPolyEval_a) + SIGNED(s2sumAHighB_uid107_invPolyEval_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    s2sumAHighB_uid107_invPolyEval_q <= s2sumAHighB_uid107_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid105_invPolyEval(BITSELECT,104)@15
    lowRangeB_uid105_invPolyEval_in <= osig_uid120_pT2_uid104_invPolyEval_b(0 downto 0);
    lowRangeB_uid105_invPolyEval_b <= lowRangeB_uid105_invPolyEval_in(0 downto 0);

    -- redist9_lowRangeB_uid105_invPolyEval_b_1(DELAY,296)
    redist9_lowRangeB_uid105_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist9_lowRangeB_uid105_invPolyEval_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist9_lowRangeB_uid105_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid105_invPolyEval_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- s2_uid108_invPolyEval(BITJOIN,107)@16
    s2_uid108_invPolyEval_q <= s2sumAHighB_uid107_invPolyEval_q & redist9_lowRangeB_uid105_invPolyEval_b_1_q;

    -- topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select(BITSELECT,285)@16
    topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s2_uid108_invPolyEval_q(30 downto 13));
    topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s2_uid108_invPolyEval_q(12 downto 0));

    -- rightBottomX_mergedSignalTM_uid145_pT3_uid110_invPolyEval(BITJOIN,144)@16
    rightBottomX_mergedSignalTM_uid145_pT3_uid110_invPolyEval_q <= topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select_c & rightBottomX_bottomExtension_uid143_pT3_uid110_invPolyEval_q;

    -- multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma(CHAINMULTADD,275)@16 + 4
    -- out q@21
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_reset <= rst;
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena0 <= en(0) or multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_reset;
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid145_pT3_uid110_invPolyEval_q),18);
                    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid141_pT3_uid110_invPolyEval_q),18);
                    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select_b),18);
                    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ch(1) <= RESIZE(SIGNED(topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ah(0));
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ch(0));
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ah(1));
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ch(1));
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        by_clock => "0",
        by_width => 18,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "true",
        signed_mbx => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_a1,
        by => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_c1,
        bx => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_c0,
        resulta => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid152_pT3_uid110_invPolyEval(BITSELECT,151)@21
    highBBits_uid152_pT3_uid110_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_q(36 downto 18));

    -- sm0_uid148_pT3_uid110_invPolyEval_cma(CHAINMULTADD,270)@16 + 4
    -- out q@21
    sm0_uid148_pT3_uid110_invPolyEval_cma_reset <= rst;
    sm0_uid148_pT3_uid110_invPolyEval_cma_ena0 <= en(0) or sm0_uid148_pT3_uid110_invPolyEval_cma_reset;
    sm0_uid148_pT3_uid110_invPolyEval_cma_ena1 <= sm0_uid148_pT3_uid110_invPolyEval_cma_ena0;
    sm0_uid148_pT3_uid110_invPolyEval_cma_ena2 <= sm0_uid148_pT3_uid110_invPolyEval_cma_ena0;
    sm0_uid148_pT3_uid110_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    sm0_uid148_pT3_uid110_invPolyEval_cma_ah(0) <= RESIZE(SIGNED(topRangeX_uid136_pT3_uid110_invPolyEval_merged_bit_select_b),18);
                    sm0_uid148_pT3_uid110_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid137_pT3_uid110_invPolyEval_merged_bit_select_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    sm0_uid148_pT3_uid110_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid148_pT3_uid110_invPolyEval_cma_ah(0));
    sm0_uid148_pT3_uid110_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid148_pT3_uid110_invPolyEval_cma_ch(0));
    sm0_uid148_pT3_uid110_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid148_pT3_uid110_invPolyEval_cma_ena0,
        ena(1) => sm0_uid148_pT3_uid110_invPolyEval_cma_ena1,
        ena(2) => sm0_uid148_pT3_uid110_invPolyEval_cma_ena2,
        clr(0) => sm0_uid148_pT3_uid110_invPolyEval_cma_reset,
        clr(1) => sm0_uid148_pT3_uid110_invPolyEval_cma_reset,
        ay => sm0_uid148_pT3_uid110_invPolyEval_cma_a0,
        ax => sm0_uid148_pT3_uid110_invPolyEval_cma_c0,
        resulta => sm0_uid148_pT3_uid110_invPolyEval_cma_s0
    );
    sm0_uid148_pT3_uid110_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid148_pT3_uid110_invPolyEval_cma_s0, xout => sm0_uid148_pT3_uid110_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    sm0_uid148_pT3_uid110_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid148_pT3_uid110_invPolyEval_cma_qq(35 downto 0));

    -- lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval(ADD,152)@21
    lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => sm0_uid148_pT3_uid110_invPolyEval_cma_q(35)) & sm0_uid148_pT3_uid110_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 19 => highBBits_uid152_pT3_uid110_invPolyEval_b(18)) & highBBits_uid152_pT3_uid110_invPolyEval_b));
    lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_b));
    lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_q <= lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid151_pT3_uid110_invPolyEval(BITSELECT,150)@21
    lowRangeB_uid151_pT3_uid110_invPolyEval_in <= multSumOfTwoTS_uid149_pT3_uid110_invPolyEval_cma_q(17 downto 0);
    lowRangeB_uid151_pT3_uid110_invPolyEval_b <= lowRangeB_uid151_pT3_uid110_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid154_pT3_uid110_invPolyEval(BITJOIN,153)@21
    lev1_a0_uid154_pT3_uid110_invPolyEval_q <= lev1_a0sumAHighB_uid153_pT3_uid110_invPolyEval_q & lowRangeB_uid151_pT3_uid110_invPolyEval_b;

    -- os_uid155_pT3_uid110_invPolyEval(BITSELECT,154)@21
    os_uid155_pT3_uid110_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid154_pT3_uid110_invPolyEval_q(52 downto 0));
    os_uid155_pT3_uid110_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid155_pT3_uid110_invPolyEval_in(52 downto 21));

    -- highBBits_uid112_invPolyEval(BITSELECT,111)@21
    highBBits_uid112_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid155_pT3_uid110_invPolyEval_b(31 downto 2));

    -- redist5_yAddr_uid19_divider_merged_bit_select_b_16(DELAY,292)
    redist5_yAddr_uid19_divider_merged_bit_select_b_16_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_0 <= (others => '0');
                redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_1 <= (others => '0');
                redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_2 <= (others => '0');
                redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_3 <= (others => '0');
                redist5_yAddr_uid19_divider_merged_bit_select_b_16_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_0 <= STD_LOGIC_VECTOR(redist4_yAddr_uid19_divider_merged_bit_select_b_10_q);
                    redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_1 <= redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_0;
                    redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_2 <= redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_1;
                    redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_3 <= redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_2;
                    redist5_yAddr_uid19_divider_merged_bit_select_b_16_q <= redist5_yAddr_uid19_divider_merged_bit_select_b_16_delay_3;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yAddr_uid19_divider_merged_bit_select_b_16_outputreg0(DELAY,313)
    redist5_yAddr_uid19_divider_merged_bit_select_b_16_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_b_16_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_yAddr_uid19_divider_merged_bit_select_b_16_outputreg0_q <= STD_LOGIC_VECTOR(redist5_yAddr_uid19_divider_merged_bit_select_b_16_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid81_invTabGen_lutmem(DUALMEM,264)@19 + 2
    -- in j@20000000
    memoryC0_uid81_invTabGen_lutmem_aa <= redist5_yAddr_uid19_divider_merged_bit_select_b_16_outputreg0_q;
    memoryC0_uid81_invTabGen_lutmem_reset0 <= rst;
    memoryC0_uid81_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 38,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_2oqd7oi_memoryC0_uid81_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC0_uid81_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid81_invTabGen_lutmem_aa,
        q_a => memoryC0_uid81_invTabGen_lutmem_ir
    );
    memoryC0_uid81_invTabGen_lutmem_r <= memoryC0_uid81_invTabGen_lutmem_ir(37 downto 0);

    -- s3sumAHighB_uid113_invPolyEval(ADD,112)@21
    s3sumAHighB_uid113_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => memoryC0_uid81_invTabGen_lutmem_r(37)) & memoryC0_uid81_invTabGen_lutmem_r));
    s3sumAHighB_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 30 => highBBits_uid112_invPolyEval_b(29)) & highBBits_uid112_invPolyEval_b));
    s3sumAHighB_uid113_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid113_invPolyEval_a) + SIGNED(s3sumAHighB_uid113_invPolyEval_b));
    s3sumAHighB_uid113_invPolyEval_q <= s3sumAHighB_uid113_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid111_invPolyEval(BITSELECT,110)@21
    lowRangeB_uid111_invPolyEval_in <= os_uid155_pT3_uid110_invPolyEval_b(1 downto 0);
    lowRangeB_uid111_invPolyEval_b <= lowRangeB_uid111_invPolyEval_in(1 downto 0);

    -- s3_uid114_invPolyEval(BITJOIN,113)@21
    s3_uid114_invPolyEval_q <= s3sumAHighB_uid113_invPolyEval_q & lowRangeB_uid111_invPolyEval_b;

    -- fxpInverseRes_uid22_divider(BITSELECT,21)@21
    fxpInverseRes_uid22_divider_in <= s3_uid114_invPolyEval_q(38 downto 0);
    fxpInverseRes_uid22_divider_b <= fxpInverseRes_uid22_divider_in(38 downto 6);

    -- redist17_fxpInverseRes_uid22_divider_b_1(DELAY,304)
    redist17_fxpInverseRes_uid22_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist17_fxpInverseRes_uid22_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist17_fxpInverseRes_uid22_divider_b_1_q <= STD_LOGIC_VECTOR(fxpInverseRes_uid22_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- paddingY_uid12_divider(CONSTANT,11)
    paddingY_uid12_divider_q <= "0000000000000000000000000000000";

    -- updatedY_uid13_divider(BITJOIN,12)@4
    updatedY_uid13_divider_q <= GND_q & paddingY_uid12_divider_q;

    -- redist20_normYNoLeadOne_uid11_divider_b_1(DELAY,307)
    redist20_normYNoLeadOne_uid11_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist20_normYNoLeadOne_uid11_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist20_normYNoLeadOne_uid11_divider_b_1_q <= STD_LOGIC_VECTOR(normYNoLeadOne_uid11_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- normYIsOneC2_uid12_divider(LOGICAL,13)@4
    normYIsOneC2_uid12_divider_a <= STD_LOGIC_VECTOR("0" & redist20_normYNoLeadOne_uid11_divider_b_1_q);
    normYIsOneC2_uid12_divider_q <= "1" WHEN normYIsOneC2_uid12_divider_a = updatedY_uid13_divider_q ELSE "0";

    -- normYIsOneC2_uid15_divider(BITSELECT,14)@3
    normYIsOneC2_uid15_divider_b <= STD_LOGIC_VECTOR(leftShiftStage2_uid187_normY_uid10_divider_q(31 downto 31));

    -- redist19_normYIsOneC2_uid15_divider_b_1(DELAY,306)
    redist19_normYIsOneC2_uid15_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist19_normYIsOneC2_uid15_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist19_normYIsOneC2_uid15_divider_b_1_q <= STD_LOGIC_VECTOR(normYIsOneC2_uid15_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- normYIsOne_uid16_divider(LOGICAL,15)@4 + 1
    normYIsOne_uid16_divider_qi <= redist19_normYIsOneC2_uid15_divider_b_1_q and normYIsOneC2_uid12_divider_q;
    normYIsOne_uid16_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => normYIsOne_uid16_divider_qi, xout => normYIsOne_uid16_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- redist18_normYIsOne_uid16_divider_q_18(DELAY,305)
    redist18_normYIsOne_uid16_divider_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => normYIsOne_uid16_divider_q, xout => redist18_normYIsOne_uid16_divider_q_18_q, ena => en(0), clk => clk, aclr => rst );

    -- invResPostOneHandling2_uid24_divider(MUX,23)@22
    invResPostOneHandling2_uid24_divider_s <= redist18_normYIsOne_uid16_divider_q_18_q;
    invResPostOneHandling2_uid24_divider_combproc: PROCESS (invResPostOneHandling2_uid24_divider_s, redist17_fxpInverseRes_uid22_divider_b_1_q, oneInvRes_uid23_divider_q)
    BEGIN
        CASE (invResPostOneHandling2_uid24_divider_s) IS
            WHEN "0" => invResPostOneHandling2_uid24_divider_q <= redist17_fxpInverseRes_uid22_divider_b_1_q;
            WHEN "1" => invResPostOneHandling2_uid24_divider_q <= oneInvRes_uid23_divider_q;
            WHEN OTHERS => invResPostOneHandling2_uid24_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodXInvY_uid27_divider_bs7(BITSELECT,195)@22
    prodXInvY_uid27_divider_bs7_b <= invResPostOneHandling2_uid24_divider_q(32 downto 18);

    -- prodXInvY_uid27_divider_bs9(BITSELECT,197)@22
    prodXInvY_uid27_divider_bs9_in <= invResPostOneHandling2_uid24_divider_q(17 downto 0);
    prodXInvY_uid27_divider_bs9_b <= prodXInvY_uid27_divider_bs9_in(17 downto 0);

    -- prodXInvY_uid27_divider_bs8(BITSELECT,196)@22
    prodXInvY_uid27_divider_bs8_b <= redist21_in_rsrvd_fix_numerator_22_outputreg0_q(31 downto 18);

    -- prodXInvY_uid27_divider_ma5_cma(CHAINMULTADD,276)@22 + 4
    -- out q@27
    prodXInvY_uid27_divider_ma5_cma_reset <= rst;
    prodXInvY_uid27_divider_ma5_cma_ena0 <= en(0) or prodXInvY_uid27_divider_ma5_cma_reset;
    prodXInvY_uid27_divider_ma5_cma_ena1 <= prodXInvY_uid27_divider_ma5_cma_ena0;
    prodXInvY_uid27_divider_ma5_cma_ena2 <= prodXInvY_uid27_divider_ma5_cma_ena0;
    prodXInvY_uid27_divider_ma5_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXInvY_uid27_divider_ma5_cma_ah(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs8_b),15);
                    prodXInvY_uid27_divider_ma5_cma_ah(1) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs7_b),15);
                    prodXInvY_uid27_divider_ma5_cma_ch(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs9_b),18);
                    prodXInvY_uid27_divider_ma5_cma_ch(1) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs6_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXInvY_uid27_divider_ma5_cma_a0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ah(0));
    prodXInvY_uid27_divider_ma5_cma_c0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ch(0));
    prodXInvY_uid27_divider_ma5_cma_a1 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ah(1));
    prodXInvY_uid27_divider_ma5_cma_c1 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ch(1));
    prodXInvY_uid27_divider_ma5_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 15,
        by_clock => "0",
        by_width => 15,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "false",
        signed_mbx => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 34
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid27_divider_ma5_cma_ena0,
        ena(1) => prodXInvY_uid27_divider_ma5_cma_ena1,
        ena(2) => prodXInvY_uid27_divider_ma5_cma_ena2,
        clr(0) => prodXInvY_uid27_divider_ma5_cma_reset,
        clr(1) => prodXInvY_uid27_divider_ma5_cma_reset,
        ay => prodXInvY_uid27_divider_ma5_cma_a1,
        by => prodXInvY_uid27_divider_ma5_cma_a0,
        ax => prodXInvY_uid27_divider_ma5_cma_c1,
        bx => prodXInvY_uid27_divider_ma5_cma_c0,
        resulta => prodXInvY_uid27_divider_ma5_cma_s0
    );
    prodXInvY_uid27_divider_ma5_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid27_divider_ma5_cma_s0, xout => prodXInvY_uid27_divider_ma5_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid27_divider_ma5_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_qq(33 downto 0));

    -- prodXInvY_uid27_divider_sums_align_1(BITSHIFT,202)@27
    prodXInvY_uid27_divider_sums_align_1_qint <= prodXInvY_uid27_divider_ma5_cma_q & "000000000000000000";
    prodXInvY_uid27_divider_sums_align_1_q <= prodXInvY_uid27_divider_sums_align_1_qint(51 downto 0);

    -- prodXInvY_uid27_divider_bs1(BITSELECT,189)@22
    prodXInvY_uid27_divider_bs1_b <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_22_outputreg0_q(31 downto 18));

    -- prodXInvY_uid27_divider_bjA2(BITJOIN,190)@22
    prodXInvY_uid27_divider_bjA2_q <= GND_q & prodXInvY_uid27_divider_bs1_b;

    -- prodXInvY_uid27_divider_bs3(BITSELECT,191)@22
    prodXInvY_uid27_divider_bs3_b <= STD_LOGIC_VECTOR(invResPostOneHandling2_uid24_divider_q(32 downto 18));

    -- prodXInvY_uid27_divider_bjB4(BITJOIN,192)@22
    prodXInvY_uid27_divider_bjB4_q <= GND_q & prodXInvY_uid27_divider_bs3_b;

    -- prodXInvY_uid27_divider_im0_cma(CHAINMULTADD,271)@22 + 4
    -- out q@27
    prodXInvY_uid27_divider_im0_cma_reset <= rst;
    prodXInvY_uid27_divider_im0_cma_ena0 <= en(0) or prodXInvY_uid27_divider_im0_cma_reset;
    prodXInvY_uid27_divider_im0_cma_ena1 <= prodXInvY_uid27_divider_im0_cma_ena0;
    prodXInvY_uid27_divider_im0_cma_ena2 <= prodXInvY_uid27_divider_im0_cma_ena0;
    prodXInvY_uid27_divider_im0_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXInvY_uid27_divider_im0_cma_ah(0) <= RESIZE(SIGNED(prodXInvY_uid27_divider_bjB4_q),16);
                    prodXInvY_uid27_divider_im0_cma_ch(0) <= RESIZE(SIGNED(prodXInvY_uid27_divider_bjA2_q),15);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXInvY_uid27_divider_im0_cma_a0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im0_cma_ah(0));
    prodXInvY_uid27_divider_im0_cma_c0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im0_cma_ch(0));
    prodXInvY_uid27_divider_im0_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 16,
        ax_clock => "0",
        ax_width => 15,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 31,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid27_divider_im0_cma_ena0,
        ena(1) => prodXInvY_uid27_divider_im0_cma_ena1,
        ena(2) => prodXInvY_uid27_divider_im0_cma_ena2,
        clr(0) => prodXInvY_uid27_divider_im0_cma_reset,
        clr(1) => prodXInvY_uid27_divider_im0_cma_reset,
        ay => prodXInvY_uid27_divider_im0_cma_a0,
        ax => prodXInvY_uid27_divider_im0_cma_c0,
        resulta => prodXInvY_uid27_divider_im0_cma_s0
    );
    prodXInvY_uid27_divider_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 31, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid27_divider_im0_cma_s0, xout => prodXInvY_uid27_divider_im0_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid27_divider_im0_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im0_cma_qq(30 downto 0));

    -- prodXInvY_uid27_divider_im10_cma(CHAINMULTADD,272)@22 + 4
    -- out q@27
    prodXInvY_uid27_divider_im10_cma_reset <= rst;
    prodXInvY_uid27_divider_im10_cma_ena0 <= en(0) or prodXInvY_uid27_divider_im10_cma_reset;
    prodXInvY_uid27_divider_im10_cma_ena1 <= prodXInvY_uid27_divider_im10_cma_ena0;
    prodXInvY_uid27_divider_im10_cma_ena2 <= prodXInvY_uid27_divider_im10_cma_ena0;
    prodXInvY_uid27_divider_im10_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXInvY_uid27_divider_im10_cma_ah(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs6_b),18);
                    prodXInvY_uid27_divider_im10_cma_ch(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs9_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXInvY_uid27_divider_im10_cma_a0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im10_cma_ah(0));
    prodXInvY_uid27_divider_im10_cma_c0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im10_cma_ch(0));
    prodXInvY_uid27_divider_im10_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid27_divider_im10_cma_ena0,
        ena(1) => prodXInvY_uid27_divider_im10_cma_ena1,
        ena(2) => prodXInvY_uid27_divider_im10_cma_ena2,
        clr(0) => prodXInvY_uid27_divider_im10_cma_reset,
        clr(1) => prodXInvY_uid27_divider_im10_cma_reset,
        ay => prodXInvY_uid27_divider_im10_cma_a0,
        ax => prodXInvY_uid27_divider_im10_cma_c0,
        resulta => prodXInvY_uid27_divider_im10_cma_s0
    );
    prodXInvY_uid27_divider_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid27_divider_im10_cma_s0, xout => prodXInvY_uid27_divider_im10_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid27_divider_im10_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im10_cma_qq(35 downto 0));

    -- prodXInvY_uid27_divider_sums_join_0(BITJOIN,201)@27
    prodXInvY_uid27_divider_sums_join_0_q <= prodXInvY_uid27_divider_im0_cma_q & prodXInvY_uid27_divider_im10_cma_q;

    -- prodXInvY_uid27_divider_sums_result_add_0_0(ADD,204)@27
    prodXInvY_uid27_divider_sums_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => prodXInvY_uid27_divider_sums_join_0_q(66)) & prodXInvY_uid27_divider_sums_join_0_q));
    prodXInvY_uid27_divider_sums_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000" & prodXInvY_uid27_divider_sums_align_1_q));
    prodXInvY_uid27_divider_sums_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodXInvY_uid27_divider_sums_result_add_0_0_a) + SIGNED(prodXInvY_uid27_divider_sums_result_add_0_0_b));
    prodXInvY_uid27_divider_sums_result_add_0_0_q <= prodXInvY_uid27_divider_sums_result_add_0_0_o(67 downto 0);

    -- redist10_r_uid79_zCount_uid9_divider_q_24_notEnable(LOGICAL,324)
    redist10_r_uid79_zCount_uid9_divider_q_24_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist10_r_uid79_zCount_uid9_divider_q_24_nor(LOGICAL,325)
    redist10_r_uid79_zCount_uid9_divider_q_24_nor_q <= not (redist10_r_uid79_zCount_uid9_divider_q_24_notEnable_q or redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena_q);

    -- redist10_r_uid79_zCount_uid9_divider_q_24_mem_last(CONSTANT,321)
    redist10_r_uid79_zCount_uid9_divider_q_24_mem_last_q <= "010101";

    -- redist10_r_uid79_zCount_uid9_divider_q_24_cmp(LOGICAL,322)
    redist10_r_uid79_zCount_uid9_divider_q_24_cmp_b <= STD_LOGIC_VECTOR("0" & redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_q);
    redist10_r_uid79_zCount_uid9_divider_q_24_cmp_q <= "1" WHEN redist10_r_uid79_zCount_uid9_divider_q_24_mem_last_q = redist10_r_uid79_zCount_uid9_divider_q_24_cmp_b ELSE "0";

    -- redist10_r_uid79_zCount_uid9_divider_q_24_cmpReg(REG,323)
    redist10_r_uid79_zCount_uid9_divider_q_24_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist10_r_uid79_zCount_uid9_divider_q_24_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist10_r_uid79_zCount_uid9_divider_q_24_cmpReg_q <= STD_LOGIC_VECTOR(redist10_r_uid79_zCount_uid9_divider_q_24_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena(REG,326)
    redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena_q <= "0";
            ELSE
                IF (redist10_r_uid79_zCount_uid9_divider_q_24_nor_q = "1") THEN
                    redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena_q <= STD_LOGIC_VECTOR(redist10_r_uid79_zCount_uid9_divider_q_24_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist10_r_uid79_zCount_uid9_divider_q_24_enaAnd(LOGICAL,327)
    redist10_r_uid79_zCount_uid9_divider_q_24_enaAnd_q <= redist10_r_uid79_zCount_uid9_divider_q_24_sticky_ena_q and en;

    -- redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt(COUNTER,318)
    -- low=0, high=22, step=1, init=0
    redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i = TO_UNSIGNED(21, 5)) THEN
                        redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_eq <= '1';
                    ELSE
                        redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_eq <= '0';
                    END IF;
                    IF (redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_eq = '1') THEN
                        redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i <= redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i + 10;
                    ELSE
                        redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i <= redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_i, 5)));

    -- redist10_r_uid79_zCount_uid9_divider_q_24_rdmux(MUX,319)
    redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_s <= en;
    redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_combproc: PROCESS (redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_s, redist10_r_uid79_zCount_uid9_divider_q_24_wraddr_q, redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_q)
    BEGIN
        CASE (redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_s) IS
            WHEN "0" => redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_q <= redist10_r_uid79_zCount_uid9_divider_q_24_wraddr_q;
            WHEN "1" => redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_q <= redist10_r_uid79_zCount_uid9_divider_q_24_rdcnt_q;
            WHEN OTHERS => redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist10_r_uid79_zCount_uid9_divider_q_24_wraddr(REG,320)
    redist10_r_uid79_zCount_uid9_divider_q_24_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist10_r_uid79_zCount_uid9_divider_q_24_wraddr_q <= "10110";
            ELSE
                redist10_r_uid79_zCount_uid9_divider_q_24_wraddr_q <= STD_LOGIC_VECTOR(redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_r_uid79_zCount_uid9_divider_q_24_mem(DUALMEM,317)
    redist10_r_uid79_zCount_uid9_divider_q_24_mem_ia <= STD_LOGIC_VECTOR(r_uid79_zCount_uid9_divider_q);
    redist10_r_uid79_zCount_uid9_divider_q_24_mem_aa <= redist10_r_uid79_zCount_uid9_divider_q_24_wraddr_q;
    redist10_r_uid79_zCount_uid9_divider_q_24_mem_ab <= redist10_r_uid79_zCount_uid9_divider_q_24_rdmux_q;
    redist10_r_uid79_zCount_uid9_divider_q_24_mem_reset0 <= rst;
    redist10_r_uid79_zCount_uid9_divider_q_24_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 6,
        widthad_b => 5,
        numwords_b => 23,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist10_r_uid79_zCount_uid9_divider_q_24_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist10_r_uid79_zCount_uid9_divider_q_24_mem_reset0,
        clock1 => clk,
        address_a => redist10_r_uid79_zCount_uid9_divider_q_24_mem_aa,
        data_a => redist10_r_uid79_zCount_uid9_divider_q_24_mem_ia,
        wren_a => en(0),
        address_b => redist10_r_uid79_zCount_uid9_divider_q_24_mem_ab,
        q_b => redist10_r_uid79_zCount_uid9_divider_q_24_mem_iq
    );
    redist10_r_uid79_zCount_uid9_divider_q_24_mem_q <= redist10_r_uid79_zCount_uid9_divider_q_24_mem_iq(5 downto 0);

    -- cWOut_uid25_divider(CONSTANT,24)
    cWOut_uid25_divider_q <= "11111";

    -- rShiftCount_uid26_divider(SUB,25)@27
    rShiftCount_uid26_divider_a <= STD_LOGIC_VECTOR("00" & cWOut_uid25_divider_q);
    rShiftCount_uid26_divider_b <= STD_LOGIC_VECTOR("0" & redist10_r_uid79_zCount_uid9_divider_q_24_mem_q);
    rShiftCount_uid26_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(rShiftCount_uid26_divider_a) - UNSIGNED(rShiftCount_uid26_divider_b));
    rShiftCount_uid26_divider_q <= rShiftCount_uid26_divider_o(6 downto 0);

    -- rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select(BITSELECT,279)@27
    rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_b <= rShiftCount_uid26_divider_q(1 downto 0);
    rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c <= rShiftCount_uid26_divider_q(3 downto 2);
    rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d <= rShiftCount_uid26_divider_q(5 downto 4);
    rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e <= rShiftCount_uid26_divider_q(6 downto 6);

    -- rightShiftStage0_uid218_prodPostRightShift_uid28_divider(MUX,217)@27 + 1
    rightShiftStage0_uid218_prodPostRightShift_uid28_divider_s <= rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_b;
    rightShiftStage0_uid218_prodPostRightShift_uid28_divider_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (rightShiftStage0_uid218_prodPostRightShift_uid28_divider_s) IS
                        WHEN "00" => rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
                        WHEN "01" => rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q <= rightShiftStage0Idx1_uid210_prodPostRightShift_uid28_divider_q;
                        WHEN "10" => rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q <= rightShiftStage0Idx2_uid213_prodPostRightShift_uid28_divider_q;
                        WHEN "11" => rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q <= rightShiftStage0Idx3_uid216_prodPostRightShift_uid28_divider_q;
                        WHEN OTHERS => rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist0_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c_1(DELAY,287)
    redist0_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist0_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist0_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage1_uid229_prodPostRightShift_uid28_divider(MUX,228)@28
    rightShiftStage1_uid229_prodPostRightShift_uid28_divider_s <= redist0_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_c_1_q;
    rightShiftStage1_uid229_prodPostRightShift_uid28_divider_combproc: PROCESS (rightShiftStage1_uid229_prodPostRightShift_uid28_divider_s, rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q, rightShiftStage1Idx1_uid221_prodPostRightShift_uid28_divider_q, rightShiftStage1Idx2_uid224_prodPostRightShift_uid28_divider_q, rightShiftStage1Idx3_uid227_prodPostRightShift_uid28_divider_q)
    BEGIN
        CASE (rightShiftStage1_uid229_prodPostRightShift_uid28_divider_s) IS
            WHEN "00" => rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q <= rightShiftStage0_uid218_prodPostRightShift_uid28_divider_q;
            WHEN "01" => rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q <= rightShiftStage1Idx1_uid221_prodPostRightShift_uid28_divider_q;
            WHEN "10" => rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q <= rightShiftStage1Idx2_uid224_prodPostRightShift_uid28_divider_q;
            WHEN "11" => rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q <= rightShiftStage1Idx3_uid227_prodPostRightShift_uid28_divider_q;
            WHEN OTHERS => rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d_1(DELAY,288)
    redist1_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist1_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid240_prodPostRightShift_uid28_divider(MUX,239)@28
    rightShiftStage2_uid240_prodPostRightShift_uid28_divider_s <= redist1_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_d_1_q;
    rightShiftStage2_uid240_prodPostRightShift_uid28_divider_combproc: PROCESS (rightShiftStage2_uid240_prodPostRightShift_uid28_divider_s, rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q, rightShiftStage2Idx1_uid232_prodPostRightShift_uid28_divider_q, rightShiftStage2Idx2_uid235_prodPostRightShift_uid28_divider_q, rightShiftStage2Idx3_uid238_prodPostRightShift_uid28_divider_q)
    BEGIN
        CASE (rightShiftStage2_uid240_prodPostRightShift_uid28_divider_s) IS
            WHEN "00" => rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q <= rightShiftStage1_uid229_prodPostRightShift_uid28_divider_q;
            WHEN "01" => rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx1_uid232_prodPostRightShift_uid28_divider_q;
            WHEN "10" => rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx2_uid235_prodPostRightShift_uid28_divider_q;
            WHEN "11" => rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx3_uid238_prodPostRightShift_uid28_divider_q;
            WHEN OTHERS => rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e_1(DELAY,289)
    redist2_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist2_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage3_uid245_prodPostRightShift_uid28_divider(MUX,244)@28
    rightShiftStage3_uid245_prodPostRightShift_uid28_divider_s <= redist2_rightShiftStageSel0Dto0_uid217_prodPostRightShift_uid28_divider_merged_bit_select_e_1_q;
    rightShiftStage3_uid245_prodPostRightShift_uid28_divider_combproc: PROCESS (rightShiftStage3_uid245_prodPostRightShift_uid28_divider_s, rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q, rightShiftStage3Idx1_uid243_prodPostRightShift_uid28_divider_q)
    BEGIN
        CASE (rightShiftStage3_uid245_prodPostRightShift_uid28_divider_s) IS
            WHEN "0" => rightShiftStage3_uid245_prodPostRightShift_uid28_divider_q <= rightShiftStage2_uid240_prodPostRightShift_uid28_divider_q;
            WHEN "1" => rightShiftStage3_uid245_prodPostRightShift_uid28_divider_q <= rightShiftStage3Idx1_uid243_prodPostRightShift_uid28_divider_q;
            WHEN OTHERS => rightShiftStage3_uid245_prodPostRightShift_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodPostRightShiftPost_uid29_divider(BITSELECT,28)@28
    prodPostRightShiftPost_uid29_divider_in <= rightShiftStage3_uid245_prodPostRightShift_uid28_divider_q(63 downto 0);
    prodPostRightShiftPost_uid29_divider_b <= prodPostRightShiftPost_uid29_divider_in(63 downto 31);

    -- allOnes_uid30_divider(LOGICAL,29)@28 + 1
    allOnes_uid30_divider_qi <= "1" WHEN prodPostRightShiftPost_uid29_divider_b = "111111111111111111111111111111111" ELSE "0";
    allOnes_uid30_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => allOnes_uid30_divider_qi, xout => allOnes_uid30_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- invAllOnes_uid32_divider(LOGICAL,31)@29
    invAllOnes_uid32_divider_q <= not (allOnes_uid30_divider_q);

    -- addOp2_uid33_divider(LOGICAL,32)@29
    addOp2_uid33_divider_q <= invAllOnes_uid32_divider_q and VCC_q;

    -- redist16_prodPostRightShiftPost_uid29_divider_b_1(DELAY,303)
    redist16_prodPostRightShiftPost_uid29_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist16_prodPostRightShiftPost_uid29_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist16_prodPostRightShiftPost_uid29_divider_b_1_q <= STD_LOGIC_VECTOR(prodPostRightShiftPost_uid29_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- prodPostRightShiftPostRnd_uid34_divider(ADD,33)@29
    prodPostRightShiftPostRnd_uid34_divider_a <= STD_LOGIC_VECTOR("0" & redist16_prodPostRightShiftPost_uid29_divider_b_1_q);
    prodPostRightShiftPostRnd_uid34_divider_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & addOp2_uid33_divider_q);
    prodPostRightShiftPostRnd_uid34_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(prodPostRightShiftPostRnd_uid34_divider_a) + UNSIGNED(prodPostRightShiftPostRnd_uid34_divider_b));
    prodPostRightShiftPostRnd_uid34_divider_q <= prodPostRightShiftPostRnd_uid34_divider_o(33 downto 0);

    -- prodPostRightShiftPostRndRange_uid35_divider(BITSELECT,34)@29
    prodPostRightShiftPostRndRange_uid35_divider_in <= prodPostRightShiftPostRnd_uid34_divider_q(32 downto 0);
    prodPostRightShiftPostRndRange_uid35_divider_b <= prodPostRightShiftPostRndRange_uid35_divider_in(32 downto 1);

    -- redist25_in_rsrvd_fix_denominator_29_notEnable(LOGICAL,376)
    redist25_in_rsrvd_fix_denominator_29_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist25_in_rsrvd_fix_denominator_29_nor(LOGICAL,377)
    redist25_in_rsrvd_fix_denominator_29_nor_q <= not (redist25_in_rsrvd_fix_denominator_29_notEnable_q or redist25_in_rsrvd_fix_denominator_29_sticky_ena_q);

    -- redist25_in_rsrvd_fix_denominator_29_mem_last(CONSTANT,373)
    redist25_in_rsrvd_fix_denominator_29_mem_last_q <= "010110";

    -- redist25_in_rsrvd_fix_denominator_29_cmp(LOGICAL,374)
    redist25_in_rsrvd_fix_denominator_29_cmp_b <= STD_LOGIC_VECTOR("0" & redist25_in_rsrvd_fix_denominator_29_rdmux_q);
    redist25_in_rsrvd_fix_denominator_29_cmp_q <= "1" WHEN redist25_in_rsrvd_fix_denominator_29_mem_last_q = redist25_in_rsrvd_fix_denominator_29_cmp_b ELSE "0";

    -- redist25_in_rsrvd_fix_denominator_29_cmpReg(REG,375)
    redist25_in_rsrvd_fix_denominator_29_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist25_in_rsrvd_fix_denominator_29_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist25_in_rsrvd_fix_denominator_29_cmpReg_q <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_denominator_29_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist25_in_rsrvd_fix_denominator_29_sticky_ena(REG,378)
    redist25_in_rsrvd_fix_denominator_29_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist25_in_rsrvd_fix_denominator_29_sticky_ena_q <= "0";
            ELSE
                IF (redist25_in_rsrvd_fix_denominator_29_nor_q = "1") THEN
                    redist25_in_rsrvd_fix_denominator_29_sticky_ena_q <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_denominator_29_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist25_in_rsrvd_fix_denominator_29_enaAnd(LOGICAL,379)
    redist25_in_rsrvd_fix_denominator_29_enaAnd_q <= redist25_in_rsrvd_fix_denominator_29_sticky_ena_q and en;

    -- redist25_in_rsrvd_fix_denominator_29_rdcnt(COUNTER,370)
    -- low=0, high=23, step=1, init=0
    redist25_in_rsrvd_fix_denominator_29_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist25_in_rsrvd_fix_denominator_29_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist25_in_rsrvd_fix_denominator_29_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist25_in_rsrvd_fix_denominator_29_rdcnt_i = TO_UNSIGNED(22, 5)) THEN
                        redist25_in_rsrvd_fix_denominator_29_rdcnt_eq <= '1';
                    ELSE
                        redist25_in_rsrvd_fix_denominator_29_rdcnt_eq <= '0';
                    END IF;
                    IF (redist25_in_rsrvd_fix_denominator_29_rdcnt_eq = '1') THEN
                        redist25_in_rsrvd_fix_denominator_29_rdcnt_i <= redist25_in_rsrvd_fix_denominator_29_rdcnt_i + 9;
                    ELSE
                        redist25_in_rsrvd_fix_denominator_29_rdcnt_i <= redist25_in_rsrvd_fix_denominator_29_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist25_in_rsrvd_fix_denominator_29_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist25_in_rsrvd_fix_denominator_29_rdcnt_i, 5)));

    -- redist25_in_rsrvd_fix_denominator_29_rdmux(MUX,371)
    redist25_in_rsrvd_fix_denominator_29_rdmux_s <= en;
    redist25_in_rsrvd_fix_denominator_29_rdmux_combproc: PROCESS (redist25_in_rsrvd_fix_denominator_29_rdmux_s, redist25_in_rsrvd_fix_denominator_29_wraddr_q, redist25_in_rsrvd_fix_denominator_29_rdcnt_q)
    BEGIN
        CASE (redist25_in_rsrvd_fix_denominator_29_rdmux_s) IS
            WHEN "0" => redist25_in_rsrvd_fix_denominator_29_rdmux_q <= redist25_in_rsrvd_fix_denominator_29_wraddr_q;
            WHEN "1" => redist25_in_rsrvd_fix_denominator_29_rdmux_q <= redist25_in_rsrvd_fix_denominator_29_rdcnt_q;
            WHEN OTHERS => redist25_in_rsrvd_fix_denominator_29_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist25_in_rsrvd_fix_denominator_29_wraddr(REG,372)
    redist25_in_rsrvd_fix_denominator_29_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist25_in_rsrvd_fix_denominator_29_wraddr_q <= "10111";
            ELSE
                redist25_in_rsrvd_fix_denominator_29_wraddr_q <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_denominator_29_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_in_rsrvd_fix_denominator_29_mem(DUALMEM,369)
    redist25_in_rsrvd_fix_denominator_29_mem_ia <= STD_LOGIC_VECTOR(redist24_in_rsrvd_fix_denominator_3_q);
    redist25_in_rsrvd_fix_denominator_29_mem_aa <= redist25_in_rsrvd_fix_denominator_29_wraddr_q;
    redist25_in_rsrvd_fix_denominator_29_mem_ab <= redist25_in_rsrvd_fix_denominator_29_rdmux_q;
    redist25_in_rsrvd_fix_denominator_29_mem_reset0 <= rst;
    redist25_in_rsrvd_fix_denominator_29_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 24,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 24,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist25_in_rsrvd_fix_denominator_29_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist25_in_rsrvd_fix_denominator_29_mem_reset0,
        clock1 => clk,
        address_a => redist25_in_rsrvd_fix_denominator_29_mem_aa,
        data_a => redist25_in_rsrvd_fix_denominator_29_mem_ia,
        wren_a => en(0),
        address_b => redist25_in_rsrvd_fix_denominator_29_mem_ab,
        q_b => redist25_in_rsrvd_fix_denominator_29_mem_iq
    );
    redist25_in_rsrvd_fix_denominator_29_mem_q <= redist25_in_rsrvd_fix_denominator_29_mem_iq(31 downto 0);

    -- redist25_in_rsrvd_fix_denominator_29_outputreg0(DELAY,368)
    redist25_in_rsrvd_fix_denominator_29_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist25_in_rsrvd_fix_denominator_29_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist25_in_rsrvd_fix_denominator_29_outputreg0_q <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_denominator_29_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- yIsZero_uid17_divider(LOGICAL,16)@29
    yIsZero_uid17_divider_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000" & GND_q);
    yIsZero_uid17_divider_q <= "1" WHEN redist25_in_rsrvd_fix_denominator_29_outputreg0_q = yIsZero_uid17_divider_b ELSE "0";

    -- resFinal_uid37_divider(MUX,36)@29
    resFinal_uid37_divider_s <= yIsZero_uid17_divider_q;
    resFinal_uid37_divider_combproc: PROCESS (resFinal_uid37_divider_s, prodPostRightShiftPostRndRange_uid35_divider_b, cstValOvf_uid36_divider_q)
    BEGIN
        CASE (resFinal_uid37_divider_s) IS
            WHEN "0" => resFinal_uid37_divider_q <= prodPostRightShiftPostRndRange_uid35_divider_b;
            WHEN "1" => resFinal_uid37_divider_q <= cstValOvf_uid36_divider_q;
            WHEN OTHERS => resFinal_uid37_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodResY_uid38_divider_bs6(BITSELECT,252)@29
    prodResY_uid38_divider_bs6_in <= resFinal_uid37_divider_q(17 downto 0);
    prodResY_uid38_divider_bs6_b <= prodResY_uid38_divider_bs6_in(17 downto 0);

    -- prodResY_uid38_divider_bs7(BITSELECT,253)@29
    prodResY_uid38_divider_bs7_b <= redist25_in_rsrvd_fix_denominator_29_outputreg0_q(31 downto 18);

    -- prodResY_uid38_divider_bs9(BITSELECT,255)@29
    prodResY_uid38_divider_bs9_in <= redist25_in_rsrvd_fix_denominator_29_outputreg0_q(17 downto 0);
    prodResY_uid38_divider_bs9_b <= prodResY_uid38_divider_bs9_in(17 downto 0);

    -- prodResY_uid38_divider_bs8(BITSELECT,254)@29
    prodResY_uid38_divider_bs8_b <= resFinal_uid37_divider_q(31 downto 18);

    -- prodResY_uid38_divider_ma5_cma(CHAINMULTADD,277)@29 + 4
    -- out q@34
    prodResY_uid38_divider_ma5_cma_reset <= rst;
    prodResY_uid38_divider_ma5_cma_ena0 <= en(0) or prodResY_uid38_divider_ma5_cma_reset;
    prodResY_uid38_divider_ma5_cma_ena1 <= prodResY_uid38_divider_ma5_cma_ena0;
    prodResY_uid38_divider_ma5_cma_ena2 <= prodResY_uid38_divider_ma5_cma_ena0;
    prodResY_uid38_divider_ma5_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodResY_uid38_divider_ma5_cma_ah(0) <= RESIZE(UNSIGNED(prodResY_uid38_divider_bs8_b),14);
                    prodResY_uid38_divider_ma5_cma_ah(1) <= RESIZE(UNSIGNED(prodResY_uid38_divider_bs7_b),14);
                    prodResY_uid38_divider_ma5_cma_ch(0) <= RESIZE(UNSIGNED(prodResY_uid38_divider_bs9_b),18);
                    prodResY_uid38_divider_ma5_cma_ch(1) <= RESIZE(UNSIGNED(prodResY_uid38_divider_bs6_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodResY_uid38_divider_ma5_cma_a0 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_ma5_cma_ah(0));
    prodResY_uid38_divider_ma5_cma_c0 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_ma5_cma_ch(0));
    prodResY_uid38_divider_ma5_cma_a1 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_ma5_cma_ah(1));
    prodResY_uid38_divider_ma5_cma_c1 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_ma5_cma_ch(1));
    prodResY_uid38_divider_ma5_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        by_clock => "0",
        by_width => 14,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "false",
        signed_mbx => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 33
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodResY_uid38_divider_ma5_cma_ena0,
        ena(1) => prodResY_uid38_divider_ma5_cma_ena1,
        ena(2) => prodResY_uid38_divider_ma5_cma_ena2,
        clr(0) => prodResY_uid38_divider_ma5_cma_reset,
        clr(1) => prodResY_uid38_divider_ma5_cma_reset,
        ay => prodResY_uid38_divider_ma5_cma_a1,
        by => prodResY_uid38_divider_ma5_cma_a0,
        ax => prodResY_uid38_divider_ma5_cma_c1,
        bx => prodResY_uid38_divider_ma5_cma_c0,
        resulta => prodResY_uid38_divider_ma5_cma_s0
    );
    prodResY_uid38_divider_ma5_cma_delay : dspba_delay
    GENERIC MAP ( width => 33, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodResY_uid38_divider_ma5_cma_s0, xout => prodResY_uid38_divider_ma5_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodResY_uid38_divider_ma5_cma_q <= STD_LOGIC_VECTOR(prodResY_uid38_divider_ma5_cma_qq(32 downto 0));

    -- prodResY_uid38_divider_sums_align_1(BITSHIFT,260)@34
    prodResY_uid38_divider_sums_align_1_qint <= prodResY_uid38_divider_ma5_cma_q & "000000000000000000";
    prodResY_uid38_divider_sums_align_1_q <= prodResY_uid38_divider_sums_align_1_qint(50 downto 0);

    -- prodResY_uid38_divider_bs3(BITSELECT,249)@29
    prodResY_uid38_divider_bs3_b <= STD_LOGIC_VECTOR(redist25_in_rsrvd_fix_denominator_29_outputreg0_q(31 downto 18));

    -- prodResY_uid38_divider_bjB4(BITJOIN,250)@29
    prodResY_uid38_divider_bjB4_q <= GND_q & prodResY_uid38_divider_bs3_b;

    -- prodResY_uid38_divider_bs1(BITSELECT,247)@29
    prodResY_uid38_divider_bs1_b <= STD_LOGIC_VECTOR(resFinal_uid37_divider_q(31 downto 18));

    -- prodResY_uid38_divider_bjA2(BITJOIN,248)@29
    prodResY_uid38_divider_bjA2_q <= GND_q & prodResY_uid38_divider_bs1_b;

    -- prodResY_uid38_divider_im0_cma(CHAINMULTADD,273)@29 + 4
    -- out q@34
    prodResY_uid38_divider_im0_cma_reset <= rst;
    prodResY_uid38_divider_im0_cma_ena0 <= en(0) or prodResY_uid38_divider_im0_cma_reset;
    prodResY_uid38_divider_im0_cma_ena1 <= prodResY_uid38_divider_im0_cma_ena0;
    prodResY_uid38_divider_im0_cma_ena2 <= prodResY_uid38_divider_im0_cma_ena0;
    prodResY_uid38_divider_im0_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodResY_uid38_divider_im0_cma_ah(0) <= RESIZE(SIGNED(prodResY_uid38_divider_bjA2_q),15);
                    prodResY_uid38_divider_im0_cma_ch(0) <= RESIZE(SIGNED(prodResY_uid38_divider_bjB4_q),15);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodResY_uid38_divider_im0_cma_a0 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_im0_cma_ah(0));
    prodResY_uid38_divider_im0_cma_c0 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_im0_cma_ch(0));
    prodResY_uid38_divider_im0_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 15,
        ax_clock => "0",
        ax_width => 15,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 30,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodResY_uid38_divider_im0_cma_ena0,
        ena(1) => prodResY_uid38_divider_im0_cma_ena1,
        ena(2) => prodResY_uid38_divider_im0_cma_ena2,
        clr(0) => prodResY_uid38_divider_im0_cma_reset,
        clr(1) => prodResY_uid38_divider_im0_cma_reset,
        ay => prodResY_uid38_divider_im0_cma_a0,
        ax => prodResY_uid38_divider_im0_cma_c0,
        resulta => prodResY_uid38_divider_im0_cma_s0
    );
    prodResY_uid38_divider_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodResY_uid38_divider_im0_cma_s0, xout => prodResY_uid38_divider_im0_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodResY_uid38_divider_im0_cma_q <= STD_LOGIC_VECTOR(prodResY_uid38_divider_im0_cma_qq(29 downto 0));

    -- prodResY_uid38_divider_im10_cma(CHAINMULTADD,274)@29 + 4
    -- out q@34
    prodResY_uid38_divider_im10_cma_reset <= rst;
    prodResY_uid38_divider_im10_cma_ena0 <= en(0) or prodResY_uid38_divider_im10_cma_reset;
    prodResY_uid38_divider_im10_cma_ena1 <= prodResY_uid38_divider_im10_cma_ena0;
    prodResY_uid38_divider_im10_cma_ena2 <= prodResY_uid38_divider_im10_cma_ena0;
    prodResY_uid38_divider_im10_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodResY_uid38_divider_im10_cma_ah(0) <= RESIZE(UNSIGNED(prodResY_uid38_divider_bs6_b),18);
                    prodResY_uid38_divider_im10_cma_ch(0) <= RESIZE(UNSIGNED(prodResY_uid38_divider_bs9_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodResY_uid38_divider_im10_cma_a0 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_im10_cma_ah(0));
    prodResY_uid38_divider_im10_cma_c0 <= STD_LOGIC_VECTOR(prodResY_uid38_divider_im10_cma_ch(0));
    prodResY_uid38_divider_im10_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodResY_uid38_divider_im10_cma_ena0,
        ena(1) => prodResY_uid38_divider_im10_cma_ena1,
        ena(2) => prodResY_uid38_divider_im10_cma_ena2,
        clr(0) => prodResY_uid38_divider_im10_cma_reset,
        clr(1) => prodResY_uid38_divider_im10_cma_reset,
        ay => prodResY_uid38_divider_im10_cma_a0,
        ax => prodResY_uid38_divider_im10_cma_c0,
        resulta => prodResY_uid38_divider_im10_cma_s0
    );
    prodResY_uid38_divider_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodResY_uid38_divider_im10_cma_s0, xout => prodResY_uid38_divider_im10_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodResY_uid38_divider_im10_cma_q <= STD_LOGIC_VECTOR(prodResY_uid38_divider_im10_cma_qq(35 downto 0));

    -- prodResY_uid38_divider_sums_join_0(BITJOIN,259)@34
    prodResY_uid38_divider_sums_join_0_q <= prodResY_uid38_divider_im0_cma_q & prodResY_uid38_divider_im10_cma_q;

    -- prodResY_uid38_divider_sums_result_add_0_0(ADD,262)@34 + 1
    prodResY_uid38_divider_sums_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((67 downto 66 => prodResY_uid38_divider_sums_join_0_q(65)) & prodResY_uid38_divider_sums_join_0_q));
    prodResY_uid38_divider_sums_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000" & prodResY_uid38_divider_sums_align_1_q));
    prodResY_uid38_divider_sums_result_add_0_0_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                prodResY_uid38_divider_sums_result_add_0_0_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    prodResY_uid38_divider_sums_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodResY_uid38_divider_sums_result_add_0_0_a) + SIGNED(prodResY_uid38_divider_sums_result_add_0_0_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    prodResY_uid38_divider_sums_result_add_0_0_q <= prodResY_uid38_divider_sums_result_add_0_0_o(66 downto 0);

    -- redist22_in_rsrvd_fix_numerator_35_notEnable(LOGICAL,364)
    redist22_in_rsrvd_fix_numerator_35_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist22_in_rsrvd_fix_numerator_35_nor(LOGICAL,365)
    redist22_in_rsrvd_fix_numerator_35_nor_q <= not (redist22_in_rsrvd_fix_numerator_35_notEnable_q or redist22_in_rsrvd_fix_numerator_35_sticky_ena_q);

    -- redist22_in_rsrvd_fix_numerator_35_mem_last(CONSTANT,361)
    redist22_in_rsrvd_fix_numerator_35_mem_last_q <= "0111";

    -- redist22_in_rsrvd_fix_numerator_35_cmp(LOGICAL,362)
    redist22_in_rsrvd_fix_numerator_35_cmp_q <= "1" WHEN redist22_in_rsrvd_fix_numerator_35_mem_last_q = redist22_in_rsrvd_fix_numerator_35_rdmux_q ELSE "0";

    -- redist22_in_rsrvd_fix_numerator_35_cmpReg(REG,363)
    redist22_in_rsrvd_fix_numerator_35_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_numerator_35_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist22_in_rsrvd_fix_numerator_35_cmpReg_q <= STD_LOGIC_VECTOR(redist22_in_rsrvd_fix_numerator_35_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist22_in_rsrvd_fix_numerator_35_sticky_ena(REG,366)
    redist22_in_rsrvd_fix_numerator_35_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_numerator_35_sticky_ena_q <= "0";
            ELSE
                IF (redist22_in_rsrvd_fix_numerator_35_nor_q = "1") THEN
                    redist22_in_rsrvd_fix_numerator_35_sticky_ena_q <= STD_LOGIC_VECTOR(redist22_in_rsrvd_fix_numerator_35_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist22_in_rsrvd_fix_numerator_35_enaAnd(LOGICAL,367)
    redist22_in_rsrvd_fix_numerator_35_enaAnd_q <= redist22_in_rsrvd_fix_numerator_35_sticky_ena_q and en;

    -- redist22_in_rsrvd_fix_numerator_35_rdcnt(COUNTER,358)
    -- low=0, high=8, step=1, init=0
    redist22_in_rsrvd_fix_numerator_35_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_numerator_35_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist22_in_rsrvd_fix_numerator_35_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist22_in_rsrvd_fix_numerator_35_rdcnt_i = TO_UNSIGNED(7, 4)) THEN
                        redist22_in_rsrvd_fix_numerator_35_rdcnt_eq <= '1';
                    ELSE
                        redist22_in_rsrvd_fix_numerator_35_rdcnt_eq <= '0';
                    END IF;
                    IF (redist22_in_rsrvd_fix_numerator_35_rdcnt_eq = '1') THEN
                        redist22_in_rsrvd_fix_numerator_35_rdcnt_i <= redist22_in_rsrvd_fix_numerator_35_rdcnt_i + 8;
                    ELSE
                        redist22_in_rsrvd_fix_numerator_35_rdcnt_i <= redist22_in_rsrvd_fix_numerator_35_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist22_in_rsrvd_fix_numerator_35_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist22_in_rsrvd_fix_numerator_35_rdcnt_i, 4)));

    -- redist22_in_rsrvd_fix_numerator_35_rdmux(MUX,359)
    redist22_in_rsrvd_fix_numerator_35_rdmux_s <= en;
    redist22_in_rsrvd_fix_numerator_35_rdmux_combproc: PROCESS (redist22_in_rsrvd_fix_numerator_35_rdmux_s, redist22_in_rsrvd_fix_numerator_35_wraddr_q, redist22_in_rsrvd_fix_numerator_35_rdcnt_q)
    BEGIN
        CASE (redist22_in_rsrvd_fix_numerator_35_rdmux_s) IS
            WHEN "0" => redist22_in_rsrvd_fix_numerator_35_rdmux_q <= redist22_in_rsrvd_fix_numerator_35_wraddr_q;
            WHEN "1" => redist22_in_rsrvd_fix_numerator_35_rdmux_q <= redist22_in_rsrvd_fix_numerator_35_rdcnt_q;
            WHEN OTHERS => redist22_in_rsrvd_fix_numerator_35_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist22_in_rsrvd_fix_numerator_35_inputreg0(DELAY,354)
    redist22_in_rsrvd_fix_numerator_35_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_numerator_35_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist22_in_rsrvd_fix_numerator_35_inputreg0_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_22_outputreg0_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist22_in_rsrvd_fix_numerator_35_wraddr(REG,360)
    redist22_in_rsrvd_fix_numerator_35_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_numerator_35_wraddr_q <= "1000";
            ELSE
                redist22_in_rsrvd_fix_numerator_35_wraddr_q <= STD_LOGIC_VECTOR(redist22_in_rsrvd_fix_numerator_35_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_in_rsrvd_fix_numerator_35_mem(DUALMEM,357)
    redist22_in_rsrvd_fix_numerator_35_mem_ia <= STD_LOGIC_VECTOR(redist22_in_rsrvd_fix_numerator_35_inputreg0_q);
    redist22_in_rsrvd_fix_numerator_35_mem_aa <= redist22_in_rsrvd_fix_numerator_35_wraddr_q;
    redist22_in_rsrvd_fix_numerator_35_mem_ab <= redist22_in_rsrvd_fix_numerator_35_rdmux_q;
    redist22_in_rsrvd_fix_numerator_35_mem_reset0 <= rst;
    redist22_in_rsrvd_fix_numerator_35_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 9,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist22_in_rsrvd_fix_numerator_35_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist22_in_rsrvd_fix_numerator_35_mem_reset0,
        clock1 => clk,
        address_a => redist22_in_rsrvd_fix_numerator_35_mem_aa,
        data_a => redist22_in_rsrvd_fix_numerator_35_mem_ia,
        wren_a => en(0),
        address_b => redist22_in_rsrvd_fix_numerator_35_mem_ab,
        q_b => redist22_in_rsrvd_fix_numerator_35_mem_iq
    );
    redist22_in_rsrvd_fix_numerator_35_mem_q <= redist22_in_rsrvd_fix_numerator_35_mem_iq(31 downto 0);

    -- redist22_in_rsrvd_fix_numerator_35_outputreg0(DELAY,356)
    redist22_in_rsrvd_fix_numerator_35_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_numerator_35_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist22_in_rsrvd_fix_numerator_35_outputreg0_q <= STD_LOGIC_VECTOR(redist22_in_rsrvd_fix_numerator_35_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist22_in_rsrvd_fix_numerator_35_outputreg1(DELAY,355)
    redist22_in_rsrvd_fix_numerator_35_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_numerator_35_outputreg1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist22_in_rsrvd_fix_numerator_35_outputreg1_q <= STD_LOGIC_VECTOR(redist22_in_rsrvd_fix_numerator_35_outputreg0_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- prod_qy_GT_x_uid39_divider(COMPARE,38)@35
    prod_qy_GT_x_uid39_divider_a <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & redist22_in_rsrvd_fix_numerator_35_outputreg1_q);
    prod_qy_GT_x_uid39_divider_b <= prodResY_uid38_divider_sums_result_add_0_0_q(65 downto 0);
    prod_qy_GT_x_uid39_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_qy_GT_x_uid39_divider_a) - UNSIGNED(prod_qy_GT_x_uid39_divider_b));
    prod_qy_GT_x_uid39_divider_c(0) <= prod_qy_GT_x_uid39_divider_o(65);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist15_resFinal_uid37_divider_q_6_notEnable(LOGICAL,337)
    redist15_resFinal_uid37_divider_q_6_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist15_resFinal_uid37_divider_q_6_nor(LOGICAL,338)
    redist15_resFinal_uid37_divider_q_6_nor_q <= not (redist15_resFinal_uid37_divider_q_6_notEnable_q or redist15_resFinal_uid37_divider_q_6_sticky_ena_q);

    -- redist15_resFinal_uid37_divider_q_6_mem_last(CONSTANT,334)
    redist15_resFinal_uid37_divider_q_6_mem_last_q <= "01";

    -- redist15_resFinal_uid37_divider_q_6_cmp(LOGICAL,335)
    redist15_resFinal_uid37_divider_q_6_cmp_q <= "1" WHEN redist15_resFinal_uid37_divider_q_6_mem_last_q = redist15_resFinal_uid37_divider_q_6_rdmux_q ELSE "0";

    -- redist15_resFinal_uid37_divider_q_6_cmpReg(REG,336)
    redist15_resFinal_uid37_divider_q_6_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_resFinal_uid37_divider_q_6_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist15_resFinal_uid37_divider_q_6_cmpReg_q <= STD_LOGIC_VECTOR(redist15_resFinal_uid37_divider_q_6_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist15_resFinal_uid37_divider_q_6_sticky_ena(REG,339)
    redist15_resFinal_uid37_divider_q_6_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_resFinal_uid37_divider_q_6_sticky_ena_q <= "0";
            ELSE
                IF (redist15_resFinal_uid37_divider_q_6_nor_q = "1") THEN
                    redist15_resFinal_uid37_divider_q_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_resFinal_uid37_divider_q_6_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist15_resFinal_uid37_divider_q_6_enaAnd(LOGICAL,340)
    redist15_resFinal_uid37_divider_q_6_enaAnd_q <= redist15_resFinal_uid37_divider_q_6_sticky_ena_q and en;

    -- redist15_resFinal_uid37_divider_q_6_rdcnt(COUNTER,331)
    -- low=0, high=2, step=1, init=0
    redist15_resFinal_uid37_divider_q_6_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_resFinal_uid37_divider_q_6_rdcnt_i <= TO_UNSIGNED(0, 2);
                redist15_resFinal_uid37_divider_q_6_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist15_resFinal_uid37_divider_q_6_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                        redist15_resFinal_uid37_divider_q_6_rdcnt_eq <= '1';
                    ELSE
                        redist15_resFinal_uid37_divider_q_6_rdcnt_eq <= '0';
                    END IF;
                    IF (redist15_resFinal_uid37_divider_q_6_rdcnt_eq = '1') THEN
                        redist15_resFinal_uid37_divider_q_6_rdcnt_i <= redist15_resFinal_uid37_divider_q_6_rdcnt_i + 2;
                    ELSE
                        redist15_resFinal_uid37_divider_q_6_rdcnt_i <= redist15_resFinal_uid37_divider_q_6_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist15_resFinal_uid37_divider_q_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_resFinal_uid37_divider_q_6_rdcnt_i, 2)));

    -- redist15_resFinal_uid37_divider_q_6_rdmux(MUX,332)
    redist15_resFinal_uid37_divider_q_6_rdmux_s <= en;
    redist15_resFinal_uid37_divider_q_6_rdmux_combproc: PROCESS (redist15_resFinal_uid37_divider_q_6_rdmux_s, redist15_resFinal_uid37_divider_q_6_wraddr_q, redist15_resFinal_uid37_divider_q_6_rdcnt_q)
    BEGIN
        CASE (redist15_resFinal_uid37_divider_q_6_rdmux_s) IS
            WHEN "0" => redist15_resFinal_uid37_divider_q_6_rdmux_q <= redist15_resFinal_uid37_divider_q_6_wraddr_q;
            WHEN "1" => redist15_resFinal_uid37_divider_q_6_rdmux_q <= redist15_resFinal_uid37_divider_q_6_rdcnt_q;
            WHEN OTHERS => redist15_resFinal_uid37_divider_q_6_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist15_resFinal_uid37_divider_q_6_inputreg0(DELAY,328)
    redist15_resFinal_uid37_divider_q_6_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_resFinal_uid37_divider_q_6_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist15_resFinal_uid37_divider_q_6_inputreg0_q <= STD_LOGIC_VECTOR(resFinal_uid37_divider_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist15_resFinal_uid37_divider_q_6_wraddr(REG,333)
    redist15_resFinal_uid37_divider_q_6_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_resFinal_uid37_divider_q_6_wraddr_q <= "10";
            ELSE
                redist15_resFinal_uid37_divider_q_6_wraddr_q <= STD_LOGIC_VECTOR(redist15_resFinal_uid37_divider_q_6_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_resFinal_uid37_divider_q_6_mem(DUALMEM,330)
    redist15_resFinal_uid37_divider_q_6_mem_ia <= STD_LOGIC_VECTOR(redist15_resFinal_uid37_divider_q_6_inputreg0_q);
    redist15_resFinal_uid37_divider_q_6_mem_aa <= redist15_resFinal_uid37_divider_q_6_wraddr_q;
    redist15_resFinal_uid37_divider_q_6_mem_ab <= redist15_resFinal_uid37_divider_q_6_rdmux_q;
    redist15_resFinal_uid37_divider_q_6_mem_reset0 <= rst;
    redist15_resFinal_uid37_divider_q_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist15_resFinal_uid37_divider_q_6_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist15_resFinal_uid37_divider_q_6_mem_reset0,
        clock1 => clk,
        address_a => redist15_resFinal_uid37_divider_q_6_mem_aa,
        data_a => redist15_resFinal_uid37_divider_q_6_mem_ia,
        wren_a => en(0),
        address_b => redist15_resFinal_uid37_divider_q_6_mem_ab,
        q_b => redist15_resFinal_uid37_divider_q_6_mem_iq
    );
    redist15_resFinal_uid37_divider_q_6_mem_q <= redist15_resFinal_uid37_divider_q_6_mem_iq(31 downto 0);

    -- redist15_resFinal_uid37_divider_q_6_outputreg0(DELAY,329)
    redist15_resFinal_uid37_divider_q_6_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_resFinal_uid37_divider_q_6_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist15_resFinal_uid37_divider_q_6_outputreg0_q <= STD_LOGIC_VECTOR(redist15_resFinal_uid37_divider_q_6_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged(SUB,263)@35
    resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_a <= STD_LOGIC_VECTOR("0" & redist15_resFinal_uid37_divider_q_6_outputreg0_q);
    resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
    resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_i <= resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_a;
    resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_a1 <= resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_i;
    resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_b1 <= (others => '0') WHEN prod_qy_GT_x_uid39_divider_c = "0" ELSE resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_b;
    resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_a1) - UNSIGNED(resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_b1));
    resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_q <= resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_o(31 downto 0);

    -- out_rsrvd_fix(GPOUT,5)@35
    result <= resFinalM1_uid42_divider_resFinalIntDiv_uid44_divider_merged_q;

END normal;
