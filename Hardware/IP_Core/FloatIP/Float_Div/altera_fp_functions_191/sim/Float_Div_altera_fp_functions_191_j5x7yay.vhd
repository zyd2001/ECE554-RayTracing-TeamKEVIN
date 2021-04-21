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

-- VHDL created from Float_Div_altera_fp_functions_191_j5x7yay
-- VHDL created on Tue Apr 20 23:09:55 2021


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

entity Float_Div_altera_fp_functions_191_j5x7yay is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end Float_Div_altera_fp_functions_191_j5x7yay;

architecture normal of Float_Div_altera_fp_functions_191_j5x7yay is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracYPostZ_uid56_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPostZ_uid56_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid58_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracXSE_bottomExtension_uid61_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oFracXSE_mergedSignalTM_uid63_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal norm_uid67_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal normFracRnd_uid70_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid70_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracRnd_uid71_fpDivTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndOp_uid75_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal fracRPreExc_uid78_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid78_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excRPreExc_uid79_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal excRPreExc_uid79_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRExt_uid80_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid81_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid84_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid85_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid86_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid87_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid88_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid88_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid89_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid90_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid91_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid92_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid93_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid95_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid96_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid98_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid99_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid100_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid103_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid103_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid108_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid109_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid110_fpDivTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid124_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid126_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid126_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid127_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid129_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid132_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid132_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid133_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid135_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal osig_uid141_pT1_uid125_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid144_pT2_uid131_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC0_uid112_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid112_invTables_lutmem_ia : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ir : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_r : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC1_uid115_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid115_invTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid118_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid118_invTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset : std_logic;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ahtype is array(NATURAL range <>) of UNSIGNED(25 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah : signal is true;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_chtype is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch : signal is true;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0 : std_logic;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1 : std_logic;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_reset : std_logic;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ah : prodXY_uid140_pT1_uid125_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid140_pT1_uid125_invPolyEval_cma_ah : signal is true;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ch : prodXY_uid140_pT1_uid125_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid140_pT1_uid125_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_reset : std_logic;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ah : prodXY_uid143_pT2_uid131_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid143_pT2_uid131_invPolyEval_cma_ah : signal is true;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(22 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ch : prodXY_uid143_pT2_uid131_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid143_pT2_uid131_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2 : std_logic;
    signal invY_uid54_fpDivTest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal invY_uid54_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal invY_uid54_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist1_memoryC2_uid118_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist2_lowRangeB_uid126_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_excRPreExc_uid79_fpDivTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_fracRPreExc_uid78_fpDivTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_norm_uid67_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_fracYPostZ_uid56_fpDivTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_yPE_uid52_fpDivTest_b_3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist8_yPE_uid52_fpDivTest_b_3_delay_0 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist8_yPE_uid52_fpDivTest_b_3_delay_1 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist13_signR_uid46_fpDivTest_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fracXIsZero_uid39_fpDivTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expXIsMax_uid38_fpDivTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_excZ_y_uid37_fpDivTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_excZ_y_uid37_fpDivTest_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_excR_x_uid31_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_excI_x_uid27_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_fracXIsZero_uid25_fpDivTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_expXIsMax_uid24_fpDivTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_excZ_x_uid23_fpDivTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_excZ_x_uid23_fpDivTest_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_fracYZero_uid15_fpDivTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_mem_reset0 : std_logic;
    signal redist6_lOAdded_uid58_fpDivTest_q_6_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i : signal is true;
    signal redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_eq : signal is true;
    signal redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena_q : signal is true;
    signal redist6_lOAdded_uid58_fpDivTest_q_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_outputreg0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_mem_reset0 : std_logic;
    signal redist9_yPE_uid52_fpDivTest_b_10_mem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_mem_iq : STD_LOGIC_VECTOR (13 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_mem_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i : signal is true;
    signal redist9_yPE_uid52_fpDivTest_b_10_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist9_yPE_uid52_fpDivTest_b_10_rdcnt_eq : signal is true;
    signal redist9_yPE_uid52_fpDivTest_b_10_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yPE_uid52_fpDivTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist9_yPE_uid52_fpDivTest_b_10_sticky_ena_q : signal is true;
    signal redist9_yPE_uid52_fpDivTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_outputreg0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_mem_reset0 : std_logic;
    signal redist10_yAddr_uid51_fpDivTest_b_7_mem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_mem_iq : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_mem_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i : signal is true;
    signal redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_eq : signal is true;
    signal redist10_yAddr_uid51_fpDivTest_b_7_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena_q : signal is true;
    signal redist10_yAddr_uid51_fpDivTest_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_outputreg0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_mem_reset0 : std_logic;
    signal redist11_yAddr_uid51_fpDivTest_b_14_mem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_mem_iq : STD_LOGIC_VECTOR (8 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_mem_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i : signal is true;
    signal redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_eq : signal is true;
    signal redist11_yAddr_uid51_fpDivTest_b_14_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena_q : signal is true;
    signal redist11_yAddr_uid51_fpDivTest_b_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_mem_reset0 : std_logic;
    signal redist12_expXmY_uid47_fpDivTest_q_23_mem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_mem_iq : STD_LOGIC_VECTOR (8 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_mem_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i : signal is true;
    signal redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_eq : signal is true;
    signal redist12_expXmY_uid47_fpDivTest_q_23_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena_q : signal is true;
    signal redist12_expXmY_uid47_fpDivTest_q_23_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_mem_reset0 : std_logic;
    signal redist25_fracX_uid10_fpDivTest_b_17_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i : signal is true;
    signal redist25_fracX_uid10_fpDivTest_b_17_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist25_fracX_uid10_fpDivTest_b_17_rdcnt_eq : signal is true;
    signal redist25_fracX_uid10_fpDivTest_b_17_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracX_uid10_fpDivTest_b_17_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist25_fracX_uid10_fpDivTest_b_17_sticky_ena_q : signal is true;
    signal redist25_fracX_uid10_fpDivTest_b_17_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_b <= b(22 downto 0);

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_fpDivTest(LOGICAL,38)@0 + 1
    fracXIsZero_uid39_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = fracY_uid13_fpDivTest_b ELSE "0";
    fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_qi, xout => fracXIsZero_uid39_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist14_fracXIsZero_uid39_fpDivTest_q_24(DELAY,166)
    redist14_fracXIsZero_uid39_fpDivTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_q, xout => redist14_fracXIsZero_uid39_fpDivTest_q_24_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111";

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_b <= b(30 downto 23);

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@0 + 1
    expXIsMax_uid38_fpDivTest_qi <= "1" WHEN expY_uid12_fpDivTest_b = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid38_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_qi, xout => expXIsMax_uid38_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist15_expXIsMax_uid38_fpDivTest_q_24(DELAY,167)
    redist15_expXIsMax_uid38_fpDivTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_q, xout => redist15_expXIsMax_uid38_fpDivTest_q_24_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@24
    excI_y_uid41_fpDivTest_q <= redist15_expXIsMax_uid38_fpDivTest_q_24_q and redist14_fracXIsZero_uid39_fpDivTest_q_24_q;

    -- redist25_fracX_uid10_fpDivTest_b_17_notEnable(LOGICAL,244)
    redist25_fracX_uid10_fpDivTest_b_17_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist25_fracX_uid10_fpDivTest_b_17_nor(LOGICAL,245)
    redist25_fracX_uid10_fpDivTest_b_17_nor_q <= not (redist25_fracX_uid10_fpDivTest_b_17_notEnable_q or redist25_fracX_uid10_fpDivTest_b_17_sticky_ena_q);

    -- redist25_fracX_uid10_fpDivTest_b_17_mem_last(CONSTANT,241)
    redist25_fracX_uid10_fpDivTest_b_17_mem_last_q <= "01101";

    -- redist25_fracX_uid10_fpDivTest_b_17_cmp(LOGICAL,242)
    redist25_fracX_uid10_fpDivTest_b_17_cmp_b <= STD_LOGIC_VECTOR("0" & redist25_fracX_uid10_fpDivTest_b_17_rdmux_q);
    redist25_fracX_uid10_fpDivTest_b_17_cmp_q <= "1" WHEN redist25_fracX_uid10_fpDivTest_b_17_mem_last_q = redist25_fracX_uid10_fpDivTest_b_17_cmp_b ELSE "0";

    -- redist25_fracX_uid10_fpDivTest_b_17_cmpReg(REG,243)
    redist25_fracX_uid10_fpDivTest_b_17_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_fracX_uid10_fpDivTest_b_17_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist25_fracX_uid10_fpDivTest_b_17_cmpReg_q <= STD_LOGIC_VECTOR(redist25_fracX_uid10_fpDivTest_b_17_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist25_fracX_uid10_fpDivTest_b_17_sticky_ena(REG,246)
    redist25_fracX_uid10_fpDivTest_b_17_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_fracX_uid10_fpDivTest_b_17_sticky_ena_q <= "0";
            ELSE
                IF (redist25_fracX_uid10_fpDivTest_b_17_nor_q = "1") THEN
                    redist25_fracX_uid10_fpDivTest_b_17_sticky_ena_q <= STD_LOGIC_VECTOR(redist25_fracX_uid10_fpDivTest_b_17_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist25_fracX_uid10_fpDivTest_b_17_enaAnd(LOGICAL,247)
    redist25_fracX_uid10_fpDivTest_b_17_enaAnd_q <= redist25_fracX_uid10_fpDivTest_b_17_sticky_ena_q and en;

    -- redist25_fracX_uid10_fpDivTest_b_17_rdcnt(COUNTER,238)
    -- low=0, high=14, step=1, init=0
    redist25_fracX_uid10_fpDivTest_b_17_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist25_fracX_uid10_fpDivTest_b_17_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i = TO_UNSIGNED(13, 4)) THEN
                        redist25_fracX_uid10_fpDivTest_b_17_rdcnt_eq <= '1';
                    ELSE
                        redist25_fracX_uid10_fpDivTest_b_17_rdcnt_eq <= '0';
                    END IF;
                    IF (redist25_fracX_uid10_fpDivTest_b_17_rdcnt_eq = '1') THEN
                        redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i <= redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i + 2;
                    ELSE
                        redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i <= redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist25_fracX_uid10_fpDivTest_b_17_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist25_fracX_uid10_fpDivTest_b_17_rdcnt_i, 4)));

    -- redist25_fracX_uid10_fpDivTest_b_17_rdmux(MUX,239)
    redist25_fracX_uid10_fpDivTest_b_17_rdmux_s <= en;
    redist25_fracX_uid10_fpDivTest_b_17_rdmux_combproc: PROCESS (redist25_fracX_uid10_fpDivTest_b_17_rdmux_s, redist25_fracX_uid10_fpDivTest_b_17_wraddr_q, redist25_fracX_uid10_fpDivTest_b_17_rdcnt_q)
    BEGIN
        CASE (redist25_fracX_uid10_fpDivTest_b_17_rdmux_s) IS
            WHEN "0" => redist25_fracX_uid10_fpDivTest_b_17_rdmux_q <= redist25_fracX_uid10_fpDivTest_b_17_wraddr_q;
            WHEN "1" => redist25_fracX_uid10_fpDivTest_b_17_rdmux_q <= redist25_fracX_uid10_fpDivTest_b_17_rdcnt_q;
            WHEN OTHERS => redist25_fracX_uid10_fpDivTest_b_17_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_b <= a(22 downto 0);

    -- redist25_fracX_uid10_fpDivTest_b_17_wraddr(REG,240)
    redist25_fracX_uid10_fpDivTest_b_17_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_fracX_uid10_fpDivTest_b_17_wraddr_q <= "1110";
            ELSE
                redist25_fracX_uid10_fpDivTest_b_17_wraddr_q <= STD_LOGIC_VECTOR(redist25_fracX_uid10_fpDivTest_b_17_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_fracX_uid10_fpDivTest_b_17_mem(DUALMEM,237)
    redist25_fracX_uid10_fpDivTest_b_17_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist25_fracX_uid10_fpDivTest_b_17_mem_aa <= redist25_fracX_uid10_fpDivTest_b_17_wraddr_q;
    redist25_fracX_uid10_fpDivTest_b_17_mem_ab <= redist25_fracX_uid10_fpDivTest_b_17_rdmux_q;
    redist25_fracX_uid10_fpDivTest_b_17_mem_reset0 <= areset;
    redist25_fracX_uid10_fpDivTest_b_17_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 23,
        widthad_b => 4,
        numwords_b => 15,
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
        clocken1 => redist25_fracX_uid10_fpDivTest_b_17_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist25_fracX_uid10_fpDivTest_b_17_mem_reset0,
        clock1 => clk,
        address_a => redist25_fracX_uid10_fpDivTest_b_17_mem_aa,
        data_a => redist25_fracX_uid10_fpDivTest_b_17_mem_ia,
        wren_a => en(0),
        address_b => redist25_fracX_uid10_fpDivTest_b_17_mem_ab,
        q_b => redist25_fracX_uid10_fpDivTest_b_17_mem_iq
    );
    redist25_fracX_uid10_fpDivTest_b_17_mem_q <= redist25_fracX_uid10_fpDivTest_b_17_mem_iq(22 downto 0);

    -- redist25_fracX_uid10_fpDivTest_b_17_outputreg0(DELAY,236)
    redist25_fracX_uid10_fpDivTest_b_17_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_fracX_uid10_fpDivTest_b_17_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist25_fracX_uid10_fpDivTest_b_17_outputreg0_q <= STD_LOGIC_VECTOR(redist25_fracX_uid10_fpDivTest_b_17_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- fracXIsZero_uid25_fpDivTest(LOGICAL,24)@17 + 1
    fracXIsZero_uid25_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist25_fracX_uid10_fpDivTest_b_17_outputreg0_q ELSE "0";
    fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_qi, xout => fracXIsZero_uid25_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist20_fracXIsZero_uid25_fpDivTest_q_7(DELAY,172)
    redist20_fracXIsZero_uid25_fpDivTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_q, xout => redist20_fracXIsZero_uid25_fpDivTest_q_7_q, ena => en(0), clk => clk, aclr => areset );

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_b <= a(30 downto 23);

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@0 + 1
    expXIsMax_uid24_fpDivTest_qi <= "1" WHEN expX_uid9_fpDivTest_b = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid24_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_qi, xout => expXIsMax_uid24_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist21_expXIsMax_uid24_fpDivTest_q_24(DELAY,173)
    redist21_expXIsMax_uid24_fpDivTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_q, xout => redist21_expXIsMax_uid24_fpDivTest_q_24_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@24
    excI_x_uid27_fpDivTest_q <= redist21_expXIsMax_uid24_fpDivTest_q_24_q and redist20_fracXIsZero_uid25_fpDivTest_q_7_q;

    -- excXIYI_uid96_fpDivTest(LOGICAL,95)@24
    excXIYI_uid96_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@24
    fracXIsNotZero_uid40_fpDivTest_q <= not (redist14_fracXIsZero_uid39_fpDivTest_q_24_q);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@24
    excN_y_uid42_fpDivTest_q <= redist15_expXIsMax_uid38_fpDivTest_q_24_q and fracXIsNotZero_uid40_fpDivTest_q;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@24
    fracXIsNotZero_uid26_fpDivTest_q <= not (redist20_fracXIsZero_uid25_fpDivTest_q_7_q);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@24
    excN_x_uid28_fpDivTest_q <= redist21_expXIsMax_uid24_fpDivTest_q_24_q and fracXIsNotZero_uid26_fpDivTest_q;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@0 + 1
    excZ_y_uid37_fpDivTest_qi <= "1" WHEN expY_uid12_fpDivTest_b = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_y_uid37_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_qi, xout => excZ_y_uid37_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist16_excZ_y_uid37_fpDivTest_q_24(DELAY,168)
    redist16_excZ_y_uid37_fpDivTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_q, xout => redist16_excZ_y_uid37_fpDivTest_q_24_q, ena => en(0), clk => clk, aclr => areset );

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@0 + 1
    excZ_x_uid23_fpDivTest_qi <= "1" WHEN expX_uid9_fpDivTest_b = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_x_uid23_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_qi, xout => excZ_x_uid23_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist22_excZ_x_uid23_fpDivTest_q_24(DELAY,174)
    redist22_excZ_x_uid23_fpDivTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_q, xout => redist22_excZ_x_uid23_fpDivTest_q_24_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZYZ_uid95_fpDivTest(LOGICAL,94)@24
    excXZYZ_uid95_fpDivTest_q <= redist22_excZ_x_uid23_fpDivTest_q_24_q and redist16_excZ_y_uid37_fpDivTest_q_24_q;

    -- excRNaN_uid97_fpDivTest(LOGICAL,96)@24 + 1
    excRNaN_uid97_fpDivTest_qi <= excXZYZ_uid95_fpDivTest_q or excN_x_uid28_fpDivTest_q or excN_y_uid42_fpDivTest_q or excXIYI_uid96_fpDivTest_q;
    excRNaN_uid97_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRNaN_uid97_fpDivTest_qi, xout => excRNaN_uid97_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- invExcRNaN_uid108_fpDivTest(LOGICAL,107)@25
    invExcRNaN_uid108_fpDivTest_q <= not (excRNaN_uid97_fpDivTest_q);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_qi <= signX_uid11_fpDivTest_b xor signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist13_signR_uid46_fpDivTest_q_25(DELAY,165)
    redist13_signR_uid46_fpDivTest_q_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 24, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist13_signR_uid46_fpDivTest_q_25_q, ena => en(0), clk => clk, aclr => areset );

    -- sRPostExc_uid109_fpDivTest(LOGICAL,108)@25
    sRPostExc_uid109_fpDivTest_q <= redist13_signR_uid46_fpDivTest_q_25_q and invExcRNaN_uid108_fpDivTest_q;

    -- redist6_lOAdded_uid58_fpDivTest_q_6_notEnable(LOGICAL,185)
    redist6_lOAdded_uid58_fpDivTest_q_6_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist6_lOAdded_uid58_fpDivTest_q_6_nor(LOGICAL,186)
    redist6_lOAdded_uid58_fpDivTest_q_6_nor_q <= not (redist6_lOAdded_uid58_fpDivTest_q_6_notEnable_q or redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena_q);

    -- redist6_lOAdded_uid58_fpDivTest_q_6_mem_last(CONSTANT,182)
    redist6_lOAdded_uid58_fpDivTest_q_6_mem_last_q <= "011";

    -- redist6_lOAdded_uid58_fpDivTest_q_6_cmp(LOGICAL,183)
    redist6_lOAdded_uid58_fpDivTest_q_6_cmp_q <= "1" WHEN redist6_lOAdded_uid58_fpDivTest_q_6_mem_last_q = redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_q ELSE "0";

    -- redist6_lOAdded_uid58_fpDivTest_q_6_cmpReg(REG,184)
    redist6_lOAdded_uid58_fpDivTest_q_6_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_lOAdded_uid58_fpDivTest_q_6_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist6_lOAdded_uid58_fpDivTest_q_6_cmpReg_q <= STD_LOGIC_VECTOR(redist6_lOAdded_uid58_fpDivTest_q_6_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena(REG,187)
    redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena_q <= "0";
            ELSE
                IF (redist6_lOAdded_uid58_fpDivTest_q_6_nor_q = "1") THEN
                    redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_lOAdded_uid58_fpDivTest_q_6_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist6_lOAdded_uid58_fpDivTest_q_6_enaAnd(LOGICAL,188)
    redist6_lOAdded_uid58_fpDivTest_q_6_enaAnd_q <= redist6_lOAdded_uid58_fpDivTest_q_6_sticky_ena_q and en;

    -- redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt(COUNTER,179)
    -- low=0, high=4, step=1, init=0
    redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                        redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_eq <= '1';
                    ELSE
                        redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_eq <= '0';
                    END IF;
                    IF (redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_eq = '1') THEN
                        redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i <= redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i + 4;
                    ELSE
                        redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i <= redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_i, 3)));

    -- redist6_lOAdded_uid58_fpDivTest_q_6_rdmux(MUX,180)
    redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_s <= en;
    redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_combproc: PROCESS (redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_s, redist6_lOAdded_uid58_fpDivTest_q_6_wraddr_q, redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_q)
    BEGIN
        CASE (redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_s) IS
            WHEN "0" => redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_q <= redist6_lOAdded_uid58_fpDivTest_q_6_wraddr_q;
            WHEN "1" => redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_q <= redist6_lOAdded_uid58_fpDivTest_q_6_rdcnt_q;
            WHEN OTHERS => redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- lOAdded_uid58_fpDivTest(BITJOIN,57)@17
    lOAdded_uid58_fpDivTest_q <= VCC_q & redist25_fracX_uid10_fpDivTest_b_17_outputreg0_q;

    -- redist6_lOAdded_uid58_fpDivTest_q_6_wraddr(REG,181)
    redist6_lOAdded_uid58_fpDivTest_q_6_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_lOAdded_uid58_fpDivTest_q_6_wraddr_q <= "100";
            ELSE
                redist6_lOAdded_uid58_fpDivTest_q_6_wraddr_q <= STD_LOGIC_VECTOR(redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_lOAdded_uid58_fpDivTest_q_6_mem(DUALMEM,178)
    redist6_lOAdded_uid58_fpDivTest_q_6_mem_ia <= STD_LOGIC_VECTOR(lOAdded_uid58_fpDivTest_q);
    redist6_lOAdded_uid58_fpDivTest_q_6_mem_aa <= redist6_lOAdded_uid58_fpDivTest_q_6_wraddr_q;
    redist6_lOAdded_uid58_fpDivTest_q_6_mem_ab <= redist6_lOAdded_uid58_fpDivTest_q_6_rdmux_q;
    redist6_lOAdded_uid58_fpDivTest_q_6_mem_reset0 <= areset;
    redist6_lOAdded_uid58_fpDivTest_q_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 24,
        widthad_b => 3,
        numwords_b => 5,
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
        clocken1 => redist6_lOAdded_uid58_fpDivTest_q_6_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist6_lOAdded_uid58_fpDivTest_q_6_mem_reset0,
        clock1 => clk,
        address_a => redist6_lOAdded_uid58_fpDivTest_q_6_mem_aa,
        data_a => redist6_lOAdded_uid58_fpDivTest_q_6_mem_ia,
        wren_a => en(0),
        address_b => redist6_lOAdded_uid58_fpDivTest_q_6_mem_ab,
        q_b => redist6_lOAdded_uid58_fpDivTest_q_6_mem_iq
    );
    redist6_lOAdded_uid58_fpDivTest_q_6_mem_q <= redist6_lOAdded_uid58_fpDivTest_q_6_mem_iq(23 downto 0);

    -- oFracXSE_bottomExtension_uid61_fpDivTest(CONSTANT,60)
    oFracXSE_bottomExtension_uid61_fpDivTest_q <= "00";

    -- oFracXSE_mergedSignalTM_uid63_fpDivTest(BITJOIN,62)@23
    oFracXSE_mergedSignalTM_uid63_fpDivTest_q <= redist6_lOAdded_uid58_fpDivTest_q_6_mem_q & oFracXSE_bottomExtension_uid61_fpDivTest_q;

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_b <= fracY_uid13_fpDivTest_b(22 downto 14);

    -- memoryC2_uid118_invTables_lutmem(DUALMEM,147)@0 + 2
    -- in j@20000000
    memoryC2_uid118_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC2_uid118_invTables_lutmem_reset0 <= areset;
    memoryC2_uid118_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_j5x7yay_memoryC2_uid118_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC2_uid118_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid118_invTables_lutmem_aa,
        q_a => memoryC2_uid118_invTables_lutmem_ir
    );
    memoryC2_uid118_invTables_lutmem_r <= memoryC2_uid118_invTables_lutmem_ir(11 downto 0);

    -- redist1_memoryC2_uid118_invTables_lutmem_r_1(DELAY,153)
    redist1_memoryC2_uid118_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_memoryC2_uid118_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_memoryC2_uid118_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid118_invTables_lutmem_r);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_b <= b(13 downto 0);

    -- redist8_yPE_uid52_fpDivTest_b_3(DELAY,160)
    redist8_yPE_uid52_fpDivTest_b_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_yPE_uid52_fpDivTest_b_3_delay_0 <= (others => '0');
                redist8_yPE_uid52_fpDivTest_b_3_delay_1 <= (others => '0');
                redist8_yPE_uid52_fpDivTest_b_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist8_yPE_uid52_fpDivTest_b_3_delay_0 <= STD_LOGIC_VECTOR(yPE_uid52_fpDivTest_b);
                    redist8_yPE_uid52_fpDivTest_b_3_delay_1 <= redist8_yPE_uid52_fpDivTest_b_3_delay_0;
                    redist8_yPE_uid52_fpDivTest_b_3_q <= redist8_yPE_uid52_fpDivTest_b_3_delay_1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid124_invPolyEval(BITSELECT,123)@3
    yT1_uid124_invPolyEval_b <= redist8_yPE_uid52_fpDivTest_b_3_q(13 downto 2);

    -- prodXY_uid140_pT1_uid125_invPolyEval_cma(CHAINMULTADD,149)@3 + 5
    -- out q@9
    prodXY_uid140_pT1_uid125_invPolyEval_cma_reset <= areset;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0 <= en(0) or prodXY_uid140_pT1_uid125_invPolyEval_cma_reset;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid140_pT1_uid125_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid124_invPolyEval_b),12);
                    prodXY_uid140_pT1_uid125_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist1_memoryC2_uid118_invTables_lutmem_r_1_q),12);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_ah(0));
    prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_ch(0));
    prodXY_uid140_pT1_uid125_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 12,
        ax_clock => "0",
        ax_width => 12,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 24,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid140_pT1_uid125_invPolyEval_cma_reset,
        clr(1) => prodXY_uid140_pT1_uid125_invPolyEval_cma_reset,
        ay => prodXY_uid140_pT1_uid125_invPolyEval_cma_a0,
        ax => prodXY_uid140_pT1_uid125_invPolyEval_cma_c0,
        resulta => prodXY_uid140_pT1_uid125_invPolyEval_cma_s0
    );
    prodXY_uid140_pT1_uid125_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid140_pT1_uid125_invPolyEval_cma_s0, xout => prodXY_uid140_pT1_uid125_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid140_pT1_uid125_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_qq(23 downto 0));

    -- osig_uid141_pT1_uid125_invPolyEval(BITSELECT,140)@9
    osig_uid141_pT1_uid125_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_q(23 downto 11));

    -- highBBits_uid127_invPolyEval(BITSELECT,126)@9
    highBBits_uid127_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid141_pT1_uid125_invPolyEval_b(12 downto 1));

    -- redist10_yAddr_uid51_fpDivTest_b_7_notEnable(LOGICAL,209)
    redist10_yAddr_uid51_fpDivTest_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist10_yAddr_uid51_fpDivTest_b_7_nor(LOGICAL,210)
    redist10_yAddr_uid51_fpDivTest_b_7_nor_q <= not (redist10_yAddr_uid51_fpDivTest_b_7_notEnable_q or redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena_q);

    -- redist10_yAddr_uid51_fpDivTest_b_7_mem_last(CONSTANT,206)
    redist10_yAddr_uid51_fpDivTest_b_7_mem_last_q <= "011";

    -- redist10_yAddr_uid51_fpDivTest_b_7_cmp(LOGICAL,207)
    redist10_yAddr_uid51_fpDivTest_b_7_cmp_q <= "1" WHEN redist10_yAddr_uid51_fpDivTest_b_7_mem_last_q = redist10_yAddr_uid51_fpDivTest_b_7_rdmux_q ELSE "0";

    -- redist10_yAddr_uid51_fpDivTest_b_7_cmpReg(REG,208)
    redist10_yAddr_uid51_fpDivTest_b_7_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_yAddr_uid51_fpDivTest_b_7_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist10_yAddr_uid51_fpDivTest_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist10_yAddr_uid51_fpDivTest_b_7_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena(REG,211)
    redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena_q <= "0";
            ELSE
                IF (redist10_yAddr_uid51_fpDivTest_b_7_nor_q = "1") THEN
                    redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist10_yAddr_uid51_fpDivTest_b_7_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist10_yAddr_uid51_fpDivTest_b_7_enaAnd(LOGICAL,212)
    redist10_yAddr_uid51_fpDivTest_b_7_enaAnd_q <= redist10_yAddr_uid51_fpDivTest_b_7_sticky_ena_q and en;

    -- redist10_yAddr_uid51_fpDivTest_b_7_rdcnt(COUNTER,203)
    -- low=0, high=4, step=1, init=0
    redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                        redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_eq <= '1';
                    ELSE
                        redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_eq <= '0';
                    END IF;
                    IF (redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_eq = '1') THEN
                        redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i <= redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i + 4;
                    ELSE
                        redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i <= redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_i, 3)));

    -- redist10_yAddr_uid51_fpDivTest_b_7_rdmux(MUX,204)
    redist10_yAddr_uid51_fpDivTest_b_7_rdmux_s <= en;
    redist10_yAddr_uid51_fpDivTest_b_7_rdmux_combproc: PROCESS (redist10_yAddr_uid51_fpDivTest_b_7_rdmux_s, redist10_yAddr_uid51_fpDivTest_b_7_wraddr_q, redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_q)
    BEGIN
        CASE (redist10_yAddr_uid51_fpDivTest_b_7_rdmux_s) IS
            WHEN "0" => redist10_yAddr_uid51_fpDivTest_b_7_rdmux_q <= redist10_yAddr_uid51_fpDivTest_b_7_wraddr_q;
            WHEN "1" => redist10_yAddr_uid51_fpDivTest_b_7_rdmux_q <= redist10_yAddr_uid51_fpDivTest_b_7_rdcnt_q;
            WHEN OTHERS => redist10_yAddr_uid51_fpDivTest_b_7_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist10_yAddr_uid51_fpDivTest_b_7_wraddr(REG,205)
    redist10_yAddr_uid51_fpDivTest_b_7_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_yAddr_uid51_fpDivTest_b_7_wraddr_q <= "100";
            ELSE
                redist10_yAddr_uid51_fpDivTest_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist10_yAddr_uid51_fpDivTest_b_7_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_yAddr_uid51_fpDivTest_b_7_mem(DUALMEM,202)
    redist10_yAddr_uid51_fpDivTest_b_7_mem_ia <= STD_LOGIC_VECTOR(yAddr_uid51_fpDivTest_b);
    redist10_yAddr_uid51_fpDivTest_b_7_mem_aa <= redist10_yAddr_uid51_fpDivTest_b_7_wraddr_q;
    redist10_yAddr_uid51_fpDivTest_b_7_mem_ab <= redist10_yAddr_uid51_fpDivTest_b_7_rdmux_q;
    redist10_yAddr_uid51_fpDivTest_b_7_mem_reset0 <= areset;
    redist10_yAddr_uid51_fpDivTest_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 9,
        widthad_b => 3,
        numwords_b => 5,
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
        clocken1 => redist10_yAddr_uid51_fpDivTest_b_7_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist10_yAddr_uid51_fpDivTest_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist10_yAddr_uid51_fpDivTest_b_7_mem_aa,
        data_a => redist10_yAddr_uid51_fpDivTest_b_7_mem_ia,
        wren_a => en(0),
        address_b => redist10_yAddr_uid51_fpDivTest_b_7_mem_ab,
        q_b => redist10_yAddr_uid51_fpDivTest_b_7_mem_iq
    );
    redist10_yAddr_uid51_fpDivTest_b_7_mem_q <= redist10_yAddr_uid51_fpDivTest_b_7_mem_iq(8 downto 0);

    -- redist10_yAddr_uid51_fpDivTest_b_7_outputreg0(DELAY,201)
    redist10_yAddr_uid51_fpDivTest_b_7_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_yAddr_uid51_fpDivTest_b_7_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist10_yAddr_uid51_fpDivTest_b_7_outputreg0_q <= STD_LOGIC_VECTOR(redist10_yAddr_uid51_fpDivTest_b_7_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid115_invTables_lutmem(DUALMEM,146)@7 + 2
    -- in j@20000000
    memoryC1_uid115_invTables_lutmem_aa <= redist10_yAddr_uid51_fpDivTest_b_7_outputreg0_q;
    memoryC1_uid115_invTables_lutmem_reset0 <= areset;
    memoryC1_uid115_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_j5x7yay_memoryC1_uid115_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC1_uid115_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid115_invTables_lutmem_aa,
        q_a => memoryC1_uid115_invTables_lutmem_ir
    );
    memoryC1_uid115_invTables_lutmem_r <= memoryC1_uid115_invTables_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid128_invPolyEval(ADD,127)@9 + 1
    s1sumAHighB_uid128_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid115_invTables_lutmem_r(20)) & memoryC1_uid115_invTables_lutmem_r));
    s1sumAHighB_uid128_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid127_invPolyEval_b(11)) & highBBits_uid127_invPolyEval_b));
    s1sumAHighB_uid128_invPolyEval_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                s1sumAHighB_uid128_invPolyEval_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    s1sumAHighB_uid128_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid128_invPolyEval_a) + SIGNED(s1sumAHighB_uid128_invPolyEval_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    s1sumAHighB_uid128_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid126_invPolyEval(BITSELECT,125)@9
    lowRangeB_uid126_invPolyEval_in <= osig_uid141_pT1_uid125_invPolyEval_b(0 downto 0);
    lowRangeB_uid126_invPolyEval_b <= lowRangeB_uid126_invPolyEval_in(0 downto 0);

    -- redist2_lowRangeB_uid126_invPolyEval_b_1(DELAY,154)
    redist2_lowRangeB_uid126_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_lowRangeB_uid126_invPolyEval_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist2_lowRangeB_uid126_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid126_invPolyEval_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- s1_uid129_invPolyEval(BITJOIN,128)@10
    s1_uid129_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_q & redist2_lowRangeB_uid126_invPolyEval_b_1_q;

    -- redist9_yPE_uid52_fpDivTest_b_10_notEnable(LOGICAL,197)
    redist9_yPE_uid52_fpDivTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist9_yPE_uid52_fpDivTest_b_10_nor(LOGICAL,198)
    redist9_yPE_uid52_fpDivTest_b_10_nor_q <= not (redist9_yPE_uid52_fpDivTest_b_10_notEnable_q or redist9_yPE_uid52_fpDivTest_b_10_sticky_ena_q);

    -- redist9_yPE_uid52_fpDivTest_b_10_mem_last(CONSTANT,194)
    redist9_yPE_uid52_fpDivTest_b_10_mem_last_q <= "011";

    -- redist9_yPE_uid52_fpDivTest_b_10_cmp(LOGICAL,195)
    redist9_yPE_uid52_fpDivTest_b_10_cmp_q <= "1" WHEN redist9_yPE_uid52_fpDivTest_b_10_mem_last_q = redist9_yPE_uid52_fpDivTest_b_10_rdmux_q ELSE "0";

    -- redist9_yPE_uid52_fpDivTest_b_10_cmpReg(REG,196)
    redist9_yPE_uid52_fpDivTest_b_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_yPE_uid52_fpDivTest_b_10_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist9_yPE_uid52_fpDivTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist9_yPE_uid52_fpDivTest_b_10_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist9_yPE_uid52_fpDivTest_b_10_sticky_ena(REG,199)
    redist9_yPE_uid52_fpDivTest_b_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_yPE_uid52_fpDivTest_b_10_sticky_ena_q <= "0";
            ELSE
                IF (redist9_yPE_uid52_fpDivTest_b_10_nor_q = "1") THEN
                    redist9_yPE_uid52_fpDivTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist9_yPE_uid52_fpDivTest_b_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist9_yPE_uid52_fpDivTest_b_10_enaAnd(LOGICAL,200)
    redist9_yPE_uid52_fpDivTest_b_10_enaAnd_q <= redist9_yPE_uid52_fpDivTest_b_10_sticky_ena_q and en;

    -- redist9_yPE_uid52_fpDivTest_b_10_rdcnt(COUNTER,191)
    -- low=0, high=4, step=1, init=0
    redist9_yPE_uid52_fpDivTest_b_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist9_yPE_uid52_fpDivTest_b_10_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                        redist9_yPE_uid52_fpDivTest_b_10_rdcnt_eq <= '1';
                    ELSE
                        redist9_yPE_uid52_fpDivTest_b_10_rdcnt_eq <= '0';
                    END IF;
                    IF (redist9_yPE_uid52_fpDivTest_b_10_rdcnt_eq = '1') THEN
                        redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i <= redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i + 4;
                    ELSE
                        redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i <= redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist9_yPE_uid52_fpDivTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist9_yPE_uid52_fpDivTest_b_10_rdcnt_i, 3)));

    -- redist9_yPE_uid52_fpDivTest_b_10_rdmux(MUX,192)
    redist9_yPE_uid52_fpDivTest_b_10_rdmux_s <= en;
    redist9_yPE_uid52_fpDivTest_b_10_rdmux_combproc: PROCESS (redist9_yPE_uid52_fpDivTest_b_10_rdmux_s, redist9_yPE_uid52_fpDivTest_b_10_wraddr_q, redist9_yPE_uid52_fpDivTest_b_10_rdcnt_q)
    BEGIN
        CASE (redist9_yPE_uid52_fpDivTest_b_10_rdmux_s) IS
            WHEN "0" => redist9_yPE_uid52_fpDivTest_b_10_rdmux_q <= redist9_yPE_uid52_fpDivTest_b_10_wraddr_q;
            WHEN "1" => redist9_yPE_uid52_fpDivTest_b_10_rdmux_q <= redist9_yPE_uid52_fpDivTest_b_10_rdcnt_q;
            WHEN OTHERS => redist9_yPE_uid52_fpDivTest_b_10_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist9_yPE_uid52_fpDivTest_b_10_wraddr(REG,193)
    redist9_yPE_uid52_fpDivTest_b_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_yPE_uid52_fpDivTest_b_10_wraddr_q <= "100";
            ELSE
                redist9_yPE_uid52_fpDivTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist9_yPE_uid52_fpDivTest_b_10_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_yPE_uid52_fpDivTest_b_10_mem(DUALMEM,190)
    redist9_yPE_uid52_fpDivTest_b_10_mem_ia <= STD_LOGIC_VECTOR(redist8_yPE_uid52_fpDivTest_b_3_q);
    redist9_yPE_uid52_fpDivTest_b_10_mem_aa <= redist9_yPE_uid52_fpDivTest_b_10_wraddr_q;
    redist9_yPE_uid52_fpDivTest_b_10_mem_ab <= redist9_yPE_uid52_fpDivTest_b_10_rdmux_q;
    redist9_yPE_uid52_fpDivTest_b_10_mem_reset0 <= areset;
    redist9_yPE_uid52_fpDivTest_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 14,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 14,
        widthad_b => 3,
        numwords_b => 5,
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
        clocken1 => redist9_yPE_uid52_fpDivTest_b_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist9_yPE_uid52_fpDivTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist9_yPE_uid52_fpDivTest_b_10_mem_aa,
        data_a => redist9_yPE_uid52_fpDivTest_b_10_mem_ia,
        wren_a => en(0),
        address_b => redist9_yPE_uid52_fpDivTest_b_10_mem_ab,
        q_b => redist9_yPE_uid52_fpDivTest_b_10_mem_iq
    );
    redist9_yPE_uid52_fpDivTest_b_10_mem_q <= redist9_yPE_uid52_fpDivTest_b_10_mem_iq(13 downto 0);

    -- redist9_yPE_uid52_fpDivTest_b_10_outputreg0(DELAY,189)
    redist9_yPE_uid52_fpDivTest_b_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_yPE_uid52_fpDivTest_b_10_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist9_yPE_uid52_fpDivTest_b_10_outputreg0_q <= STD_LOGIC_VECTOR(redist9_yPE_uid52_fpDivTest_b_10_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- prodXY_uid143_pT2_uid131_invPolyEval_cma(CHAINMULTADD,150)@10 + 5
    -- out q@16
    prodXY_uid143_pT2_uid131_invPolyEval_cma_reset <= areset;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0 <= en(0) or prodXY_uid143_pT2_uid131_invPolyEval_cma_reset;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid143_pT2_uid131_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(redist9_yPE_uid52_fpDivTest_b_10_outputreg0_q),14);
                    prodXY_uid143_pT2_uid131_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(s1_uid129_invPolyEval_q),23);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_ah(0));
    prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_ch(0));
    prodXY_uid143_pT2_uid131_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 23,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid143_pT2_uid131_invPolyEval_cma_reset,
        clr(1) => prodXY_uid143_pT2_uid131_invPolyEval_cma_reset,
        ay => prodXY_uid143_pT2_uid131_invPolyEval_cma_a0,
        ax => prodXY_uid143_pT2_uid131_invPolyEval_cma_c0,
        resulta => prodXY_uid143_pT2_uid131_invPolyEval_cma_s0
    );
    prodXY_uid143_pT2_uid131_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid143_pT2_uid131_invPolyEval_cma_s0, xout => prodXY_uid143_pT2_uid131_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid143_pT2_uid131_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_qq(36 downto 0));

    -- osig_uid144_pT2_uid131_invPolyEval(BITSELECT,143)@16
    osig_uid144_pT2_uid131_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_q(36 downto 13));

    -- highBBits_uid133_invPolyEval(BITSELECT,132)@16
    highBBits_uid133_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid144_pT2_uid131_invPolyEval_b(23 downto 2));

    -- redist11_yAddr_uid51_fpDivTest_b_14_notEnable(LOGICAL,221)
    redist11_yAddr_uid51_fpDivTest_b_14_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist11_yAddr_uid51_fpDivTest_b_14_nor(LOGICAL,222)
    redist11_yAddr_uid51_fpDivTest_b_14_nor_q <= not (redist11_yAddr_uid51_fpDivTest_b_14_notEnable_q or redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena_q);

    -- redist11_yAddr_uid51_fpDivTest_b_14_mem_last(CONSTANT,218)
    redist11_yAddr_uid51_fpDivTest_b_14_mem_last_q <= "011";

    -- redist11_yAddr_uid51_fpDivTest_b_14_cmp(LOGICAL,219)
    redist11_yAddr_uid51_fpDivTest_b_14_cmp_q <= "1" WHEN redist11_yAddr_uid51_fpDivTest_b_14_mem_last_q = redist11_yAddr_uid51_fpDivTest_b_14_rdmux_q ELSE "0";

    -- redist11_yAddr_uid51_fpDivTest_b_14_cmpReg(REG,220)
    redist11_yAddr_uid51_fpDivTest_b_14_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_yAddr_uid51_fpDivTest_b_14_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist11_yAddr_uid51_fpDivTest_b_14_cmpReg_q <= STD_LOGIC_VECTOR(redist11_yAddr_uid51_fpDivTest_b_14_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena(REG,223)
    redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena_q <= "0";
            ELSE
                IF (redist11_yAddr_uid51_fpDivTest_b_14_nor_q = "1") THEN
                    redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena_q <= STD_LOGIC_VECTOR(redist11_yAddr_uid51_fpDivTest_b_14_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist11_yAddr_uid51_fpDivTest_b_14_enaAnd(LOGICAL,224)
    redist11_yAddr_uid51_fpDivTest_b_14_enaAnd_q <= redist11_yAddr_uid51_fpDivTest_b_14_sticky_ena_q and en;

    -- redist11_yAddr_uid51_fpDivTest_b_14_rdcnt(COUNTER,215)
    -- low=0, high=4, step=1, init=0
    redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                        redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_eq <= '1';
                    ELSE
                        redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_eq <= '0';
                    END IF;
                    IF (redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_eq = '1') THEN
                        redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i <= redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i + 4;
                    ELSE
                        redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i <= redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_i, 3)));

    -- redist11_yAddr_uid51_fpDivTest_b_14_rdmux(MUX,216)
    redist11_yAddr_uid51_fpDivTest_b_14_rdmux_s <= en;
    redist11_yAddr_uid51_fpDivTest_b_14_rdmux_combproc: PROCESS (redist11_yAddr_uid51_fpDivTest_b_14_rdmux_s, redist11_yAddr_uid51_fpDivTest_b_14_wraddr_q, redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_q)
    BEGIN
        CASE (redist11_yAddr_uid51_fpDivTest_b_14_rdmux_s) IS
            WHEN "0" => redist11_yAddr_uid51_fpDivTest_b_14_rdmux_q <= redist11_yAddr_uid51_fpDivTest_b_14_wraddr_q;
            WHEN "1" => redist11_yAddr_uid51_fpDivTest_b_14_rdmux_q <= redist11_yAddr_uid51_fpDivTest_b_14_rdcnt_q;
            WHEN OTHERS => redist11_yAddr_uid51_fpDivTest_b_14_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist11_yAddr_uid51_fpDivTest_b_14_wraddr(REG,217)
    redist11_yAddr_uid51_fpDivTest_b_14_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_yAddr_uid51_fpDivTest_b_14_wraddr_q <= "100";
            ELSE
                redist11_yAddr_uid51_fpDivTest_b_14_wraddr_q <= STD_LOGIC_VECTOR(redist11_yAddr_uid51_fpDivTest_b_14_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_yAddr_uid51_fpDivTest_b_14_mem(DUALMEM,214)
    redist11_yAddr_uid51_fpDivTest_b_14_mem_ia <= STD_LOGIC_VECTOR(redist10_yAddr_uid51_fpDivTest_b_7_outputreg0_q);
    redist11_yAddr_uid51_fpDivTest_b_14_mem_aa <= redist11_yAddr_uid51_fpDivTest_b_14_wraddr_q;
    redist11_yAddr_uid51_fpDivTest_b_14_mem_ab <= redist11_yAddr_uid51_fpDivTest_b_14_rdmux_q;
    redist11_yAddr_uid51_fpDivTest_b_14_mem_reset0 <= areset;
    redist11_yAddr_uid51_fpDivTest_b_14_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 9,
        widthad_b => 3,
        numwords_b => 5,
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
        clocken1 => redist11_yAddr_uid51_fpDivTest_b_14_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist11_yAddr_uid51_fpDivTest_b_14_mem_reset0,
        clock1 => clk,
        address_a => redist11_yAddr_uid51_fpDivTest_b_14_mem_aa,
        data_a => redist11_yAddr_uid51_fpDivTest_b_14_mem_ia,
        wren_a => en(0),
        address_b => redist11_yAddr_uid51_fpDivTest_b_14_mem_ab,
        q_b => redist11_yAddr_uid51_fpDivTest_b_14_mem_iq
    );
    redist11_yAddr_uid51_fpDivTest_b_14_mem_q <= redist11_yAddr_uid51_fpDivTest_b_14_mem_iq(8 downto 0);

    -- redist11_yAddr_uid51_fpDivTest_b_14_outputreg0(DELAY,213)
    redist11_yAddr_uid51_fpDivTest_b_14_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_yAddr_uid51_fpDivTest_b_14_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist11_yAddr_uid51_fpDivTest_b_14_outputreg0_q <= STD_LOGIC_VECTOR(redist11_yAddr_uid51_fpDivTest_b_14_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid112_invTables_lutmem(DUALMEM,145)@14 + 2
    -- in j@20000000
    memoryC0_uid112_invTables_lutmem_aa <= redist11_yAddr_uid51_fpDivTest_b_14_outputreg0_q;
    memoryC0_uid112_invTables_lutmem_reset0 <= areset;
    memoryC0_uid112_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 31,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_j5x7yay_memoryC0_uid112_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC0_uid112_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid112_invTables_lutmem_aa,
        q_a => memoryC0_uid112_invTables_lutmem_ir
    );
    memoryC0_uid112_invTables_lutmem_r <= memoryC0_uid112_invTables_lutmem_ir(30 downto 0);

    -- s2sumAHighB_uid134_invPolyEval(ADD,133)@16
    s2sumAHighB_uid134_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => memoryC0_uid112_invTables_lutmem_r(30)) & memoryC0_uid112_invTables_lutmem_r));
    s2sumAHighB_uid134_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid133_invPolyEval_b(21)) & highBBits_uid133_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid134_invPolyEval_a) + SIGNED(s2sumAHighB_uid134_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_o(31 downto 0);

    -- lowRangeB_uid132_invPolyEval(BITSELECT,131)@16
    lowRangeB_uid132_invPolyEval_in <= osig_uid144_pT2_uid131_invPolyEval_b(1 downto 0);
    lowRangeB_uid132_invPolyEval_b <= lowRangeB_uid132_invPolyEval_in(1 downto 0);

    -- s2_uid135_invPolyEval(BITJOIN,134)@16
    s2_uid135_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_q & lowRangeB_uid132_invPolyEval_b;

    -- invY_uid54_fpDivTest_merged_bit_select(BITSELECT,151)@16
    invY_uid54_fpDivTest_merged_bit_select_in <= s2_uid135_invPolyEval_q(31 downto 0);
    invY_uid54_fpDivTest_merged_bit_select_b <= invY_uid54_fpDivTest_merged_bit_select_in(30 downto 5);
    invY_uid54_fpDivTest_merged_bit_select_c <= invY_uid54_fpDivTest_merged_bit_select_in(31 downto 31);

    -- redist0_invY_uid54_fpDivTest_merged_bit_select_b_1(DELAY,152)
    redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(invY_uid54_fpDivTest_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma(CHAINMULTADD,148)@17 + 5
    -- out q@23
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset <= areset;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0 <= en(0) or prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah(0) <= RESIZE(UNSIGNED(redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q),26);
                    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch(0) <= RESIZE(UNSIGNED(lOAdded_uid58_fpDivTest_q),24);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah(0));
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch(0));
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 26,
        ax_clock => "0",
        ax_width => 24,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 50
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0,
        ena(1) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1,
        ena(2) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2,
        clr(0) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset,
        clr(1) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset,
        ay => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0,
        ax => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0,
        resulta => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0
    );
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0, xout => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq(49 downto 0));

    -- osig_uid138_prodDivPreNormProd_uid60_fpDivTest(BITSELECT,137)@23
    osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q(49 downto 24);

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@0
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- fracYZero_uid15_fpDivTest(LOGICAL,16)@0 + 1
    fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & fracY_uid13_fpDivTest_b);
    fracYZero_uid15_fpDivTest_qi <= "1" WHEN fracYZero_uid15_fpDivTest_a = updatedY_uid16_fpDivTest_q ELSE "0";
    fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_qi, xout => fracYZero_uid15_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist24_fracYZero_uid15_fpDivTest_q_16(DELAY,176)
    redist24_fracYZero_uid15_fpDivTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_q, xout => redist24_fracYZero_uid15_fpDivTest_q_16_q, ena => en(0), clk => clk, aclr => areset );

    -- fracYPostZ_uid56_fpDivTest(LOGICAL,55)@16 + 1
    fracYPostZ_uid56_fpDivTest_qi <= redist24_fracYZero_uid15_fpDivTest_q_16_q or invY_uid54_fpDivTest_merged_bit_select_c;
    fracYPostZ_uid56_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYPostZ_uid56_fpDivTest_qi, xout => fracYPostZ_uid56_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist7_fracYPostZ_uid56_fpDivTest_q_7(DELAY,159)
    redist7_fracYPostZ_uid56_fpDivTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYPostZ_uid56_fpDivTest_q, xout => redist7_fracYPostZ_uid56_fpDivTest_q_7_q, ena => en(0), clk => clk, aclr => areset );

    -- divValPreNormTrunc_uid66_fpDivTest(MUX,65)@23
    divValPreNormTrunc_uid66_fpDivTest_s <= redist7_fracYPostZ_uid56_fpDivTest_q_7_q;
    divValPreNormTrunc_uid66_fpDivTest_combproc: PROCESS (divValPreNormTrunc_uid66_fpDivTest_s, en, osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b, oFracXSE_mergedSignalTM_uid63_fpDivTest_q)
    BEGIN
        CASE (divValPreNormTrunc_uid66_fpDivTest_s) IS
            WHEN "0" => divValPreNormTrunc_uid66_fpDivTest_q <= osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b;
            WHEN "1" => divValPreNormTrunc_uid66_fpDivTest_q <= oFracXSE_mergedSignalTM_uid63_fpDivTest_q;
            WHEN OTHERS => divValPreNormTrunc_uid66_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid67_fpDivTest(BITSELECT,66)@23
    norm_uid67_fpDivTest_b <= STD_LOGIC_VECTOR(divValPreNormTrunc_uid66_fpDivTest_q(25 downto 25));

    -- redist5_norm_uid67_fpDivTest_b_1(DELAY,157)
    redist5_norm_uid67_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_norm_uid67_fpDivTest_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_norm_uid67_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(norm_uid67_fpDivTest_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rndOp_uid75_fpDivTest(BITJOIN,74)@24
    rndOp_uid75_fpDivTest_q <= redist5_norm_uid67_fpDivTest_b_1_q & paddingY_uid15_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111110";

    -- redist12_expXmY_uid47_fpDivTest_q_23_notEnable(LOGICAL,232)
    redist12_expXmY_uid47_fpDivTest_q_23_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist12_expXmY_uid47_fpDivTest_q_23_nor(LOGICAL,233)
    redist12_expXmY_uid47_fpDivTest_q_23_nor_q <= not (redist12_expXmY_uid47_fpDivTest_q_23_notEnable_q or redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena_q);

    -- redist12_expXmY_uid47_fpDivTest_q_23_mem_last(CONSTANT,229)
    redist12_expXmY_uid47_fpDivTest_q_23_mem_last_q <= "010011";

    -- redist12_expXmY_uid47_fpDivTest_q_23_cmp(LOGICAL,230)
    redist12_expXmY_uid47_fpDivTest_q_23_cmp_b <= STD_LOGIC_VECTOR("0" & redist12_expXmY_uid47_fpDivTest_q_23_rdmux_q);
    redist12_expXmY_uid47_fpDivTest_q_23_cmp_q <= "1" WHEN redist12_expXmY_uid47_fpDivTest_q_23_mem_last_q = redist12_expXmY_uid47_fpDivTest_q_23_cmp_b ELSE "0";

    -- redist12_expXmY_uid47_fpDivTest_q_23_cmpReg(REG,231)
    redist12_expXmY_uid47_fpDivTest_q_23_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_expXmY_uid47_fpDivTest_q_23_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist12_expXmY_uid47_fpDivTest_q_23_cmpReg_q <= STD_LOGIC_VECTOR(redist12_expXmY_uid47_fpDivTest_q_23_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena(REG,234)
    redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena_q <= "0";
            ELSE
                IF (redist12_expXmY_uid47_fpDivTest_q_23_nor_q = "1") THEN
                    redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena_q <= STD_LOGIC_VECTOR(redist12_expXmY_uid47_fpDivTest_q_23_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist12_expXmY_uid47_fpDivTest_q_23_enaAnd(LOGICAL,235)
    redist12_expXmY_uid47_fpDivTest_q_23_enaAnd_q <= redist12_expXmY_uid47_fpDivTest_q_23_sticky_ena_q and en;

    -- redist12_expXmY_uid47_fpDivTest_q_23_rdcnt(COUNTER,226)
    -- low=0, high=20, step=1, init=0
    redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i = TO_UNSIGNED(19, 5)) THEN
                        redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_eq <= '1';
                    ELSE
                        redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_eq <= '0';
                    END IF;
                    IF (redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_eq = '1') THEN
                        redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i <= redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i + 12;
                    ELSE
                        redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i <= redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_i, 5)));

    -- redist12_expXmY_uid47_fpDivTest_q_23_rdmux(MUX,227)
    redist12_expXmY_uid47_fpDivTest_q_23_rdmux_s <= en;
    redist12_expXmY_uid47_fpDivTest_q_23_rdmux_combproc: PROCESS (redist12_expXmY_uid47_fpDivTest_q_23_rdmux_s, redist12_expXmY_uid47_fpDivTest_q_23_wraddr_q, redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_q)
    BEGIN
        CASE (redist12_expXmY_uid47_fpDivTest_q_23_rdmux_s) IS
            WHEN "0" => redist12_expXmY_uid47_fpDivTest_q_23_rdmux_q <= redist12_expXmY_uid47_fpDivTest_q_23_wraddr_q;
            WHEN "1" => redist12_expXmY_uid47_fpDivTest_q_23_rdmux_q <= redist12_expXmY_uid47_fpDivTest_q_23_rdcnt_q;
            WHEN OTHERS => redist12_expXmY_uid47_fpDivTest_q_23_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expXmY_uid47_fpDivTest(SUB,46)@0 + 1
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & expX_uid9_fpDivTest_b);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & expY_uid12_fpDivTest_b);
    expXmY_uid47_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expXmY_uid47_fpDivTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(8 downto 0);

    -- redist12_expXmY_uid47_fpDivTest_q_23_wraddr(REG,228)
    redist12_expXmY_uid47_fpDivTest_q_23_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_expXmY_uid47_fpDivTest_q_23_wraddr_q <= "10100";
            ELSE
                redist12_expXmY_uid47_fpDivTest_q_23_wraddr_q <= STD_LOGIC_VECTOR(redist12_expXmY_uid47_fpDivTest_q_23_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_expXmY_uid47_fpDivTest_q_23_mem(DUALMEM,225)
    redist12_expXmY_uid47_fpDivTest_q_23_mem_ia <= STD_LOGIC_VECTOR(expXmY_uid47_fpDivTest_q);
    redist12_expXmY_uid47_fpDivTest_q_23_mem_aa <= redist12_expXmY_uid47_fpDivTest_q_23_wraddr_q;
    redist12_expXmY_uid47_fpDivTest_q_23_mem_ab <= redist12_expXmY_uid47_fpDivTest_q_23_rdmux_q;
    redist12_expXmY_uid47_fpDivTest_q_23_mem_reset0 <= areset;
    redist12_expXmY_uid47_fpDivTest_q_23_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 9,
        widthad_b => 5,
        numwords_b => 21,
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
        clocken1 => redist12_expXmY_uid47_fpDivTest_q_23_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist12_expXmY_uid47_fpDivTest_q_23_mem_reset0,
        clock1 => clk,
        address_a => redist12_expXmY_uid47_fpDivTest_q_23_mem_aa,
        data_a => redist12_expXmY_uid47_fpDivTest_q_23_mem_ia,
        wren_a => en(0),
        address_b => redist12_expXmY_uid47_fpDivTest_q_23_mem_ab,
        q_b => redist12_expXmY_uid47_fpDivTest_q_23_mem_iq
    );
    redist12_expXmY_uid47_fpDivTest_q_23_mem_q <= redist12_expXmY_uid47_fpDivTest_q_23_mem_iq(8 downto 0);

    -- expR_uid48_fpDivTest(ADD,47)@23 + 1
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => redist12_expXmY_uid47_fpDivTest_q_23_mem_q(8)) & redist12_expXmY_uid47_fpDivTest_q_23_mem_q));
    expR_uid48_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid6_fpDivTest_q));
    expR_uid48_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expR_uid48_fpDivTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    expR_uid48_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid48_fpDivTest_a) + SIGNED(expR_uid48_fpDivTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(9 downto 0);

    -- divValPreNormHigh_uid68_fpDivTest(BITSELECT,67)@23
    divValPreNormHigh_uid68_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(24 downto 0);
    divValPreNormHigh_uid68_fpDivTest_b <= divValPreNormHigh_uid68_fpDivTest_in(24 downto 1);

    -- divValPreNormLow_uid69_fpDivTest(BITSELECT,68)@23
    divValPreNormLow_uid69_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(23 downto 0);
    divValPreNormLow_uid69_fpDivTest_b <= divValPreNormLow_uid69_fpDivTest_in(23 downto 0);

    -- normFracRnd_uid70_fpDivTest(MUX,69)@23 + 1
    normFracRnd_uid70_fpDivTest_s <= norm_uid67_fpDivTest_b;
    normFracRnd_uid70_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                normFracRnd_uid70_fpDivTest_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (normFracRnd_uid70_fpDivTest_s) IS
                        WHEN "0" => normFracRnd_uid70_fpDivTest_q <= divValPreNormLow_uid69_fpDivTest_b;
                        WHEN "1" => normFracRnd_uid70_fpDivTest_q <= divValPreNormHigh_uid68_fpDivTest_b;
                        WHEN OTHERS => normFracRnd_uid70_fpDivTest_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- expFracRnd_uid71_fpDivTest(BITJOIN,70)@24
    expFracRnd_uid71_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid70_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@24
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => expFracRnd_uid71_fpDivTest_q(33)) & expFracRnd_uid71_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & rndOp_uid75_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid76_fpDivTest_a) + SIGNED(expFracPostRnd_uid76_fpDivTest_b));
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(34 downto 0);

    -- excRPreExc_uid79_fpDivTest(BITSELECT,78)@24
    excRPreExc_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(31 downto 0);
    excRPreExc_uid79_fpDivTest_b <= excRPreExc_uid79_fpDivTest_in(31 downto 24);

    -- redist3_excRPreExc_uid79_fpDivTest_b_1(DELAY,155)
    redist3_excRPreExc_uid79_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_excRPreExc_uid79_fpDivTest_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist3_excRPreExc_uid79_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(excRPreExc_uid79_fpDivTest_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@24
    invExpXIsMax_uid43_fpDivTest_q <= not (redist15_expXIsMax_uid38_fpDivTest_q_24_q);

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@24
    InvExpXIsZero_uid44_fpDivTest_q <= not (redist16_excZ_y_uid37_fpDivTest_q_24_q);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@24 + 1
    excR_y_uid45_fpDivTest_qi <= InvExpXIsZero_uid44_fpDivTest_q and invExpXIsMax_uid43_fpDivTest_q;
    excR_y_uid45_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_y_uid45_fpDivTest_qi, xout => excR_y_uid45_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist19_excI_x_uid27_fpDivTest_q_1(DELAY,171)
    redist19_excI_x_uid27_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_excI_x_uid27_fpDivTest_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist19_excI_x_uid27_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(excI_x_uid27_fpDivTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- excXIYR_uid93_fpDivTest(LOGICAL,92)@25
    excXIYR_uid93_fpDivTest_q <= redist19_excI_x_uid27_fpDivTest_q_1_q and excR_y_uid45_fpDivTest_q;

    -- redist17_excZ_y_uid37_fpDivTest_q_25(DELAY,169)
    redist17_excZ_y_uid37_fpDivTest_q_25_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_excZ_y_uid37_fpDivTest_q_25_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist17_excZ_y_uid37_fpDivTest_q_25_q <= STD_LOGIC_VECTOR(redist16_excZ_y_uid37_fpDivTest_q_24_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- excXIYZ_uid92_fpDivTest(LOGICAL,91)@25
    excXIYZ_uid92_fpDivTest_q <= redist19_excI_x_uid27_fpDivTest_q_1_q and redist17_excZ_y_uid37_fpDivTest_q_25_q;

    -- expRExt_uid80_fpDivTest(BITSELECT,79)@24
    expRExt_uid80_fpDivTest_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q(34 downto 24));

    -- expOvf_uid84_fpDivTest(COMPARE,83)@24 + 1
    expOvf_uid84_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expOvf_uid84_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid18_fpDivTest_q));
    expOvf_uid84_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expOvf_uid84_fpDivTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    expOvf_uid84_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid84_fpDivTest_a) - SIGNED(expOvf_uid84_fpDivTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    expOvf_uid84_fpDivTest_n(0) <= not (expOvf_uid84_fpDivTest_o(12));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@24
    invExpXIsMax_uid29_fpDivTest_q <= not (redist21_expXIsMax_uid24_fpDivTest_q_24_q);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@24
    InvExpXIsZero_uid30_fpDivTest_q <= not (redist22_excZ_x_uid23_fpDivTest_q_24_q);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@24
    excR_x_uid31_fpDivTest_q <= InvExpXIsZero_uid30_fpDivTest_q and invExpXIsMax_uid29_fpDivTest_q;

    -- redist18_excR_x_uid31_fpDivTest_q_1(DELAY,170)
    redist18_excR_x_uid31_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_excR_x_uid31_fpDivTest_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist18_excR_x_uid31_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(excR_x_uid31_fpDivTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- excXRYROvf_uid91_fpDivTest(LOGICAL,90)@25
    excXRYROvf_uid91_fpDivTest_q <= redist18_excR_x_uid31_fpDivTest_q_1_q and excR_y_uid45_fpDivTest_q and expOvf_uid84_fpDivTest_n;

    -- excXRYZ_uid90_fpDivTest(LOGICAL,89)@25
    excXRYZ_uid90_fpDivTest_q <= redist18_excR_x_uid31_fpDivTest_q_1_q and redist17_excZ_y_uid37_fpDivTest_q_25_q;

    -- excRInf_uid94_fpDivTest(LOGICAL,93)@25
    excRInf_uid94_fpDivTest_q <= excXRYZ_uid90_fpDivTest_q or excXRYROvf_uid91_fpDivTest_q or excXIYZ_uid92_fpDivTest_q or excXIYR_uid93_fpDivTest_q;

    -- xRegOrZero_uid87_fpDivTest(LOGICAL,86)@24
    xRegOrZero_uid87_fpDivTest_q <= excR_x_uid31_fpDivTest_q or redist22_excZ_x_uid23_fpDivTest_q_24_q;

    -- regOrZeroOverInf_uid88_fpDivTest(LOGICAL,87)@24 + 1
    regOrZeroOverInf_uid88_fpDivTest_qi <= xRegOrZero_uid87_fpDivTest_q and excI_y_uid41_fpDivTest_q;
    regOrZeroOverInf_uid88_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => regOrZeroOverInf_uid88_fpDivTest_qi, xout => regOrZeroOverInf_uid88_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- expUdf_uid81_fpDivTest(COMPARE,80)@24 + 1
    expUdf_uid81_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid81_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expUdf_uid81_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expUdf_uid81_fpDivTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    expUdf_uid81_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid81_fpDivTest_a) - SIGNED(expUdf_uid81_fpDivTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    expUdf_uid81_fpDivTest_n(0) <= not (expUdf_uid81_fpDivTest_o(12));

    -- regOverRegWithUf_uid86_fpDivTest(LOGICAL,85)@25
    regOverRegWithUf_uid86_fpDivTest_q <= expUdf_uid81_fpDivTest_n and redist18_excR_x_uid31_fpDivTest_q_1_q and excR_y_uid45_fpDivTest_q;

    -- redist23_excZ_x_uid23_fpDivTest_q_25(DELAY,175)
    redist23_excZ_x_uid23_fpDivTest_q_25_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_excZ_x_uid23_fpDivTest_q_25_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist23_excZ_x_uid23_fpDivTest_q_25_q <= STD_LOGIC_VECTOR(redist22_excZ_x_uid23_fpDivTest_q_24_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- zeroOverReg_uid85_fpDivTest(LOGICAL,84)@25
    zeroOverReg_uid85_fpDivTest_q <= redist23_excZ_x_uid23_fpDivTest_q_25_q and excR_y_uid45_fpDivTest_q;

    -- excRZero_uid89_fpDivTest(LOGICAL,88)@25
    excRZero_uid89_fpDivTest_q <= zeroOverReg_uid85_fpDivTest_q or regOverRegWithUf_uid86_fpDivTest_q or regOrZeroOverInf_uid88_fpDivTest_q;

    -- concExc_uid98_fpDivTest(BITJOIN,97)@25
    concExc_uid98_fpDivTest_q <= excRNaN_uid97_fpDivTest_q & excRInf_uid94_fpDivTest_q & excRZero_uid89_fpDivTest_q;

    -- excREnc_uid99_fpDivTest(LOOKUP,98)@25
    excREnc_uid99_fpDivTest_combproc: PROCESS (concExc_uid98_fpDivTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid98_fpDivTest_q) IS
            WHEN "000" => excREnc_uid99_fpDivTest_q <= "01";
            WHEN "001" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "010" => excREnc_uid99_fpDivTest_q <= "10";
            WHEN "011" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "100" => excREnc_uid99_fpDivTest_q <= "11";
            WHEN "101" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "110" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "111" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid99_fpDivTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid107_fpDivTest(MUX,106)@25
    expRPostExc_uid107_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    expRPostExc_uid107_fpDivTest_combproc: PROCESS (expRPostExc_uid107_fpDivTest_s, en, cstAllZWE_uid20_fpDivTest_q, redist3_excRPreExc_uid79_fpDivTest_b_1_q, cstAllOWE_uid18_fpDivTest_q)
    BEGIN
        CASE (expRPostExc_uid107_fpDivTest_s) IS
            WHEN "00" => expRPostExc_uid107_fpDivTest_q <= cstAllZWE_uid20_fpDivTest_q;
            WHEN "01" => expRPostExc_uid107_fpDivTest_q <= redist3_excRPreExc_uid79_fpDivTest_b_1_q;
            WHEN "10" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN "11" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN OTHERS => expRPostExc_uid107_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid100_fpDivTest(CONSTANT,99)
    oneFracRPostExc2_uid100_fpDivTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid78_fpDivTest(BITSELECT,77)@24
    fracRPreExc_uid78_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(23 downto 0);
    fracRPreExc_uid78_fpDivTest_b <= fracRPreExc_uid78_fpDivTest_in(23 downto 1);

    -- redist4_fracRPreExc_uid78_fpDivTest_b_1(DELAY,156)
    redist4_fracRPreExc_uid78_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_fracRPreExc_uid78_fpDivTest_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist4_fracRPreExc_uid78_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(fracRPreExc_uid78_fpDivTest_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid103_fpDivTest(MUX,102)@25
    fracRPostExc_uid103_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    fracRPostExc_uid103_fpDivTest_combproc: PROCESS (fracRPostExc_uid103_fpDivTest_s, en, paddingY_uid15_fpDivTest_q, redist4_fracRPreExc_uid78_fpDivTest_b_1_q, oneFracRPostExc2_uid100_fpDivTest_q)
    BEGIN
        CASE (fracRPostExc_uid103_fpDivTest_s) IS
            WHEN "00" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "01" => fracRPostExc_uid103_fpDivTest_q <= redist4_fracRPreExc_uid78_fpDivTest_b_1_q;
            WHEN "10" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "11" => fracRPostExc_uid103_fpDivTest_q <= oneFracRPostExc2_uid100_fpDivTest_q;
            WHEN OTHERS => fracRPostExc_uid103_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid110_fpDivTest(BITJOIN,109)@25
    divR_uid110_fpDivTest_q <= sRPostExc_uid109_fpDivTest_q & expRPostExc_uid107_fpDivTest_q & fracRPostExc_uid103_fpDivTest_q;

    -- xOut(GPOUT,4)@25
    q <= divR_uid110_fpDivTest_q;

END normal;
