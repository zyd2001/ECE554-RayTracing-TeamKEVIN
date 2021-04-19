-- (C) 2001-2019 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Debug Version 15.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2014 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from FPSqrt
-- VHDL created on Wed May 06 13:16:11 2015


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.fpoint2_multi_dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

USE work.FPSqrt_safe_path.all;
entity FPSqrt is
    port (
        x : in std_logic_vector(31 downto 0);  -- float32_m23
        r : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        reset_req : in std_logic;		  
        areset : in std_logic
    );
end FPSqrt;



architecture normal of FPSqrt is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    signal en: std_logic_vector(0 downto 0);
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid8_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstOneWF_uid9_fpSqrtTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid10_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sBias_uid24_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sBiasM1_uid28_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expRMux_uid33_fpSqrtTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid33_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracSel_uid49_fpSqrtTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracInf_uid56_fpSqrtTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal negZero_uid59_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal negZero_uid59_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal negZero_uid59_fpSqrtTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal negZero_uid59_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memoryC0_uid62_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid62_sqrtTableGenerator_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid62_sqrtTableGenerator_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid62_sqrtTableGenerator_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid62_sqrtTableGenerator_lutmem_iq : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid62_sqrtTableGenerator_lutmem_q : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid64_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid64_sqrtTableGenerator_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid64_sqrtTableGenerator_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid64_sqrtTableGenerator_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid64_sqrtTableGenerator_lutmem_iq : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid64_sqrtTableGenerator_lutmem_q : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid66_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid66_sqrtTableGenerator_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_sqrtTableGenerator_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_sqrtTableGenerator_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_sqrtTableGenerator_lutmem_iq : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_sqrtTableGenerator_lutmem_q : STD_LOGIC_VECTOR (11 downto 0);
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_a_type is array(0 to 0) of UNSIGNED(11 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_a0 : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_a_type;
    attribute preserve : boolean;
    attribute preserve of prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_a0 : signal is true;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_c_type is array(0 to 0) of SIGNED(11 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_c0 : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_c_type;
    attribute preserve of prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_c0 : signal is true;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_l_type is array(0 to 0) of SIGNED(12 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_l : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_l_type;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_p_type is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_p : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_p_type;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_u_type is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_u : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_u_type;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_w_type is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_w : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_w_type;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_x_type is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_x : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_x_type;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_y_type is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_y : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_y_type;
    type prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_s_type is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_s : prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_s_type;
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_a_type is array(0 to 0) of UNSIGNED(15 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_a0 : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_a_type;
    attribute preserve of prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_a0 : signal is true;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_c_type is array(0 to 0) of SIGNED(22 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_c0 : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_c_type;
    attribute preserve of prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_c0 : signal is true;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_l_type is array(0 to 0) of SIGNED(16 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_l : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_l_type;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_p_type is array(0 to 0) of SIGNED(39 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_p : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_p_type;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_u_type is array(0 to 0) of SIGNED(39 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_u : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_u_type;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_w_type is array(0 to 0) of SIGNED(39 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_w : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_w_type;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_x_type is array(0 to 0) of SIGNED(39 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_x : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_x_type;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_y_type is array(0 to 0) of SIGNED(39 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_y : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_y_type;
    type prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_s_type is array(0 to 0) of SIGNED(39 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_s : prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_s_type;
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_qq : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_mem_reset0 : std_logic;
    signal redist6_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_rdcnt_i : UNSIGNED (1 downto 0);
    signal redist6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_mem_top_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist6_sticky_ena_q : signal is true;
    signal redist6_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_cmp_a : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpSqrtTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid6_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_fpSqrtTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid7_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid12_fpSqrtTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid12_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid12_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_fpSqrtTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid14_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid14_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid18_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid18_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid18_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid20_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid20_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid20_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsMax_uid21_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsMax_uid21_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_R_uid23_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_R_uid23_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_R_uid23_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal InvSignX_uid42_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvSignX_uid42_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid43_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid43_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid43_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid44_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid44_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid44_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid45_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid45_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid45_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid46_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid46_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid46_fpSqrtTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid46_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal os_uid82_pT1_uid69_sqrtPolynomialEvaluator_in : STD_LOGIC_VECTOR (23 downto 0);
    signal os_uid82_pT1_uid69_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (12 downto 0);
    signal os_uid85_pT2_uid75_sqrtPolynomialEvaluator_in : STD_LOGIC_VECTOR (38 downto 0);
    signal os_uid85_pT2_uid75_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yT1_uid68_sqrtPolynomialEvaluator_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yT1_uid68_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expX0PS_uid31_fpSqrtTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal expX0PS_uid31_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal FracX15dto0_uid37_fpSqrtTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal FracX15dto0_uid37_fpSqrtTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal join_uid47_fpSqrtTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expREven_uid27_fpSqrtTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal expREven_uid27_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expROdd_uid30_fpSqrtTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal expROdd_uid30_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal lowRangeB_uid70_sqrtPolynomialEvaluator_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid70_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid71_sqrtPolynomialEvaluator_in : STD_LOGIC_VECTOR (12 downto 0);
    signal highBBits_uid71_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid76_sqrtPolynomialEvaluator_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid76_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid77_sqrtPolynomialEvaluator_in : STD_LOGIC_VECTOR (23 downto 0);
    signal highBBits_uid77_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (21 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addrTable_uid36_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracSelIn_uid48_fpSqrtTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal s1sumAHighB_uid72_sqrtPolynomialEvaluator_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid72_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid72_sqrtPolynomialEvaluator_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid72_sqrtPolynomialEvaluator_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid78_sqrtPolynomialEvaluator_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid78_sqrtPolynomialEvaluator_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid78_sqrtPolynomialEvaluator_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid78_sqrtPolynomialEvaluator_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s1_uid70_uid73_sqrtPolynomialEvaluator_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s2_uid76_uid79_sqrtPolynomialEvaluator_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expInc_uid39_fpSqrtTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal expInc_uid39_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostProcessings_uid40_fpSqrtTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal fracRPostProcessings_uid40_fpSqrtTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expR_uid41_fpSqrtTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid41_fpSqrtTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid41_fpSqrtTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid41_fpSqrtTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRR_uid52_fpSqrtTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRR_uid52_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPostExc_uid54_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid54_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal RSqrt_uid60_fpSqrtTest_q : STD_LOGIC_VECTOR (31 downto 0);

begin

    en(0) <= not reset_req;
    -- xIn(GPIN,3)@0

    -- signX_uid7_fpSqrtTest(BITSELECT,6)@0
    signX_uid7_fpSqrtTest_in <= STD_LOGIC_VECTOR(x);
    signX_uid7_fpSqrtTest_b <= signX_uid7_fpSqrtTest_in(31 downto 31);

    -- cstAllZWE_uid10_fpSqrtTest(CONSTANT,9)
    cstAllZWE_uid10_fpSqrtTest_q <= "00000000";

    -- expX_uid6_fpSqrtTest(BITSELECT,5)@0
    expX_uid6_fpSqrtTest_in <= x;
    expX_uid6_fpSqrtTest_b <= expX_uid6_fpSqrtTest_in(30 downto 23);

    -- expXIsZero_uid12_fpSqrtTest(LOGICAL,11)@0
    expXIsZero_uid12_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsZero_uid12_fpSqrtTest_b <= cstAllZWE_uid10_fpSqrtTest_q;
    expXIsZero_uid12_fpSqrtTest_q <= "1" WHEN expXIsZero_uid12_fpSqrtTest_a = expXIsZero_uid12_fpSqrtTest_b ELSE "0";

    -- negZero_uid59_fpSqrtTest(LOGICAL,58)@0
    negZero_uid59_fpSqrtTest_a <= expXIsZero_uid12_fpSqrtTest_q;
    negZero_uid59_fpSqrtTest_b <= signX_uid7_fpSqrtTest_b;
    negZero_uid59_fpSqrtTest_q_i <= negZero_uid59_fpSqrtTest_a and negZero_uid59_fpSqrtTest_b;
    negZero_uid59_fpSqrtTest_delay : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => negZero_uid59_fpSqrtTest_q_i, xout => negZero_uid59_fpSqrtTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist0(DELAY,91)
    redist0 : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => negZero_uid59_fpSqrtTest_q, xout => redist0_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllOWE_uid8_fpSqrtTest(CONSTANT,7)
    cstAllOWE_uid8_fpSqrtTest_q <= "11111111";

    -- expX0PS_uid31_fpSqrtTest(BITSELECT,30)@0
    expX0PS_uid31_fpSqrtTest_in <= STD_LOGIC_VECTOR(expX_uid6_fpSqrtTest_b(0 downto 0));
    expX0PS_uid31_fpSqrtTest_b <= expX0PS_uid31_fpSqrtTest_in(0 downto 0);

    -- expOddSelect_uid32_fpSqrtTest(LOGICAL,31)@0
    expOddSelect_uid32_fpSqrtTest_a <= expX0PS_uid31_fpSqrtTest_b;
    expOddSelect_uid32_fpSqrtTest_q <= not (expOddSelect_uid32_fpSqrtTest_a);

    -- frac_uid15_fpSqrtTest(BITSELECT,14)@0
    frac_uid15_fpSqrtTest_in <= x;
    frac_uid15_fpSqrtTest_b <= frac_uid15_fpSqrtTest_in(22 downto 0);

    -- fracXAddr_uid35_fpSqrtTest(BITSELECT,34)@0
    fracXAddr_uid35_fpSqrtTest_in <= frac_uid15_fpSqrtTest_b;
    fracXAddr_uid35_fpSqrtTest_b <= fracXAddr_uid35_fpSqrtTest_in(22 downto 16);

    -- addrTable_uid36_fpSqrtTest(BITJOIN,35)@0
    addrTable_uid36_fpSqrtTest_q <= expOddSelect_uid32_fpSqrtTest_q & fracXAddr_uid35_fpSqrtTest_b;

    -- memoryC2_uid66_sqrtTableGenerator_lutmem(DUALMEM,88)@0
    memoryC2_uid66_sqrtTableGenerator_lutmem_aa <= addrTable_uid36_fpSqrtTest_q;
    memoryC2_uid66_sqrtTableGenerator_lutmem_ab <= addrTable_uid36_fpSqrtTest_q;
    memoryC2_uid66_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC2_uid66_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "AUTO",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("FPSqrt_memoryC2_uid61_sqrtTableGenerator_lutmem.hex"),
        init_file_layout => "PORT_B"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC2_uid66_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid66_sqrtTableGenerator_lutmem_aa,
        wren_a => '0',
        address_b => memoryC2_uid66_sqrtTableGenerator_lutmem_ab,
        q_b => memoryC2_uid66_sqrtTableGenerator_lutmem_iq
    );
    memoryC2_uid66_sqrtTableGenerator_lutmem_q <= memoryC2_uid66_sqrtTableGenerator_lutmem_iq(11 downto 0);

    -- FracX15dto0_uid37_fpSqrtTest(BITSELECT,36)@0
    FracX15dto0_uid37_fpSqrtTest_in <= frac_uid15_fpSqrtTest_b(15 downto 0);
    FracX15dto0_uid37_fpSqrtTest_b <= FracX15dto0_uid37_fpSqrtTest_in(15 downto 0);

    -- redist2(DELAY,93)
    redist2 : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 16, depth => 2 )
    PORT MAP ( xin => FracX15dto0_uid37_fpSqrtTest_b, xout => redist2_q, ena => en(0), clk => clk, aclr => areset );

    -- yT1_uid68_sqrtPolynomialEvaluator(BITSELECT,67)@2
    yT1_uid68_sqrtPolynomialEvaluator_in <= redist2_q;
    yT1_uid68_sqrtPolynomialEvaluator_b <= yT1_uid68_sqrtPolynomialEvaluator_in(15 downto 4);

    -- prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma(CHAINMULTADD,89)@2
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_l(0) <= SIGNED(RESIZE(prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_a0(0),13));
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_p(0) <= prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_l(0) * prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_c0(0);
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_u(0) <= RESIZE(prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_p(0),25);
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_w(0) <= prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_u(0);
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_x(0) <= prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_w(0);
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_y(0) <= prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_x(0);
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_a0 <= (others => (others => '0'));
            prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_c0 <= (others => (others => '0'));
            prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid68_sqrtPolynomialEvaluator_b),12);
                prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid66_sqrtTableGenerator_lutmem_q),12);
            END IF;
            IF (en = "1") THEN
            END IF;
            IF (en = "1") THEN
                prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_s(0) <= prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_delay : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 24, depth => 0 )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_s(0)(23 downto 0)), xout => prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_q <= STD_LOGIC_VECTOR(prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_qq(23 downto 0));

    -- os_uid82_pT1_uid69_sqrtPolynomialEvaluator(BITSELECT,81)@4
    os_uid82_pT1_uid69_sqrtPolynomialEvaluator_in <= STD_LOGIC_VECTOR(prodXY_uid81_pT1_uid69_sqrtPolynomialEvaluator_cma_q);
    os_uid82_pT1_uid69_sqrtPolynomialEvaluator_b <= os_uid82_pT1_uid69_sqrtPolynomialEvaluator_in(23 downto 11);

    -- highBBits_uid71_sqrtPolynomialEvaluator(BITSELECT,70)@4
    highBBits_uid71_sqrtPolynomialEvaluator_in <= STD_LOGIC_VECTOR(os_uid82_pT1_uid69_sqrtPolynomialEvaluator_b);
    highBBits_uid71_sqrtPolynomialEvaluator_b <= highBBits_uid71_sqrtPolynomialEvaluator_in(12 downto 1);

    -- redist4(DELAY,95)
    redist4 : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => addrTable_uid36_fpSqrtTest_q, xout => redist4_q, ena => en(0), clk => clk, aclr => areset );

    -- memoryC1_uid64_sqrtTableGenerator_lutmem(DUALMEM,87)@0
    memoryC1_uid64_sqrtTableGenerator_lutmem_aa <= addrTable_uid36_fpSqrtTest_q;
    memoryC1_uid64_sqrtTableGenerator_lutmem_ab <= redist4_q;
    memoryC1_uid64_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC1_uid64_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "AUTO",
        operation_mode => "DUAL_PORT",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 21,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("FPSqrt_memoryC1_uid60_sqrtTableGenerator_lutmem.hex"),
        init_file_layout => "PORT_B"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC1_uid64_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid64_sqrtTableGenerator_lutmem_aa,
        wren_a => '0',
        address_b => memoryC1_uid64_sqrtTableGenerator_lutmem_ab,
        q_b => memoryC1_uid64_sqrtTableGenerator_lutmem_iq
    );
    memoryC1_uid64_sqrtTableGenerator_lutmem_q <= memoryC1_uid64_sqrtTableGenerator_lutmem_iq(20 downto 0);

    -- s1sumAHighB_uid72_sqrtPolynomialEvaluator(ADD,71)@4
    s1sumAHighB_uid72_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid64_sqrtTableGenerator_lutmem_q(20)) & memoryC1_uid64_sqrtTableGenerator_lutmem_q));
    s1sumAHighB_uid72_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid71_sqrtPolynomialEvaluator_b(11)) & highBBits_uid71_sqrtPolynomialEvaluator_b));
    s1sumAHighB_uid72_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid72_sqrtPolynomialEvaluator_a) + SIGNED(s1sumAHighB_uid72_sqrtPolynomialEvaluator_b));
    s1sumAHighB_uid72_sqrtPolynomialEvaluator_q <= s1sumAHighB_uid72_sqrtPolynomialEvaluator_o(21 downto 0);

    -- lowRangeB_uid70_sqrtPolynomialEvaluator(BITSELECT,69)@4
    lowRangeB_uid70_sqrtPolynomialEvaluator_in <= os_uid82_pT1_uid69_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid70_sqrtPolynomialEvaluator_b <= lowRangeB_uid70_sqrtPolynomialEvaluator_in(0 downto 0);

    -- s1_uid70_uid73_sqrtPolynomialEvaluator(BITJOIN,72)@4
    s1_uid70_uid73_sqrtPolynomialEvaluator_q <= s1sumAHighB_uid72_sqrtPolynomialEvaluator_q & lowRangeB_uid70_sqrtPolynomialEvaluator_b;

    -- redist3(DELAY,94)
    redist3 : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 16, depth => 2 )
    PORT MAP ( xin => redist2_q, xout => redist3_q, ena => en(0), clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma(CHAINMULTADD,90)@4
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_l(0) <= SIGNED(RESIZE(prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_a0(0),17));
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_p(0) <= prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_l(0) * prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_c0(0);
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_u(0) <= RESIZE(prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_p(0),40);
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_w(0) <= prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_u(0);
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_x(0) <= prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_w(0);
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_y(0) <= prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_x(0);
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_a0 <= (others => (others => '0'));
            prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_c0 <= (others => (others => '0'));
            prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_a0(0) <= RESIZE(UNSIGNED(redist3_q),16);
                prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_c0(0) <= RESIZE(SIGNED(s1_uid70_uid73_sqrtPolynomialEvaluator_q),23);
            END IF;
            IF (en = "1") THEN
            END IF;
            IF (en = "1") THEN
                prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_s(0) <= prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_delay : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 39, depth => 0 )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_s(0)(38 downto 0)), xout => prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_q <= STD_LOGIC_VECTOR(prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_qq(38 downto 0));

    -- os_uid85_pT2_uid75_sqrtPolynomialEvaluator(BITSELECT,84)@6
    os_uid85_pT2_uid75_sqrtPolynomialEvaluator_in <= STD_LOGIC_VECTOR(prodXY_uid84_pT2_uid75_sqrtPolynomialEvaluator_cma_q);
    os_uid85_pT2_uid75_sqrtPolynomialEvaluator_b <= os_uid85_pT2_uid75_sqrtPolynomialEvaluator_in(38 downto 15);

    -- highBBits_uid77_sqrtPolynomialEvaluator(BITSELECT,76)@6
    highBBits_uid77_sqrtPolynomialEvaluator_in <= STD_LOGIC_VECTOR(os_uid85_pT2_uid75_sqrtPolynomialEvaluator_b);
    highBBits_uid77_sqrtPolynomialEvaluator_b <= highBBits_uid77_sqrtPolynomialEvaluator_in(23 downto 2);

    -- redist5(DELAY,96)
    redist5 : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => redist4_q, xout => redist5_q, ena => en(0), clk => clk, aclr => areset );

    -- memoryC0_uid62_sqrtTableGenerator_lutmem(DUALMEM,86)@0
    memoryC0_uid62_sqrtTableGenerator_lutmem_aa <= addrTable_uid36_fpSqrtTest_q;
    memoryC0_uid62_sqrtTableGenerator_lutmem_ab <= redist5_q;
    memoryC0_uid62_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC0_uid62_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "AUTO",
        operation_mode => "DUAL_PORT",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 29,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("FPSqrt_memoryC0_uid59_sqrtTableGenerator_lutmem.hex"),
        init_file_layout => "PORT_B"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid62_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid62_sqrtTableGenerator_lutmem_aa,
        wren_a => '0',
        address_b => memoryC0_uid62_sqrtTableGenerator_lutmem_ab,
        q_b => memoryC0_uid62_sqrtTableGenerator_lutmem_iq
    );
    memoryC0_uid62_sqrtTableGenerator_lutmem_q <= memoryC0_uid62_sqrtTableGenerator_lutmem_iq(28 downto 0);

    -- s2sumAHighB_uid78_sqrtPolynomialEvaluator(ADD,77)@6
    s2sumAHighB_uid78_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid62_sqrtTableGenerator_lutmem_q(28)) & memoryC0_uid62_sqrtTableGenerator_lutmem_q));
    s2sumAHighB_uid78_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid77_sqrtPolynomialEvaluator_b(21)) & highBBits_uid77_sqrtPolynomialEvaluator_b));
    s2sumAHighB_uid78_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid78_sqrtPolynomialEvaluator_a) + SIGNED(s2sumAHighB_uid78_sqrtPolynomialEvaluator_b));
    s2sumAHighB_uid78_sqrtPolynomialEvaluator_q <= s2sumAHighB_uid78_sqrtPolynomialEvaluator_o(29 downto 0);

    -- lowRangeB_uid76_sqrtPolynomialEvaluator(BITSELECT,75)@6
    lowRangeB_uid76_sqrtPolynomialEvaluator_in <= os_uid85_pT2_uid75_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid76_sqrtPolynomialEvaluator_b <= lowRangeB_uid76_sqrtPolynomialEvaluator_in(1 downto 0);

    -- s2_uid76_uid79_sqrtPolynomialEvaluator(BITJOIN,78)@6
    s2_uid76_uid79_sqrtPolynomialEvaluator_q <= s2sumAHighB_uid78_sqrtPolynomialEvaluator_q & lowRangeB_uid76_sqrtPolynomialEvaluator_b;

    -- expInc_uid39_fpSqrtTest(BITSELECT,38)@6
    expInc_uid39_fpSqrtTest_in <= STD_LOGIC_VECTOR(s2_uid76_uid79_sqrtPolynomialEvaluator_q(30 downto 0));
    expInc_uid39_fpSqrtTest_b <= expInc_uid39_fpSqrtTest_in(30 downto 30);

    -- redist6_notEnable(LOGICAL,105)
    redist6_notEnable_a <= en;
    redist6_notEnable_q <= not (redist6_notEnable_a);

    -- redist6_nor(LOGICAL,106)
    redist6_nor_a <= redist6_notEnable_q;
    redist6_nor_b <= redist6_sticky_ena_q;
    redist6_nor_q <= not (redist6_nor_a or redist6_nor_b);

    -- redist6_mem_top(CONSTANT,102)
    redist6_mem_top_q <= "011";

    -- redist6_cmp(LOGICAL,103)
    redist6_cmp_a <= redist6_mem_top_q;
    redist6_cmp_b <= STD_LOGIC_VECTOR("0" & redist6_rdmux_q);
    redist6_cmp_q <= "1" WHEN redist6_cmp_a = redist6_cmp_b ELSE "0";

    -- redist6_cmpReg(REG,104)
    redist6_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist6_cmpReg_q <= STD_LOGIC_VECTOR(redist6_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_sticky_ena(REG,107)
    redist6_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist6_nor_q = "1") THEN
                redist6_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_enaAnd(LOGICAL,108)
    redist6_enaAnd_a <= redist6_sticky_ena_q;
    redist6_enaAnd_b <= en;
    redist6_enaAnd_q <= redist6_enaAnd_a and redist6_enaAnd_b;

    -- redist6_rdcnt(COUNTER,99)
    -- every=1, low=0, high=3, step=1, init=1
    redist6_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_rdcnt_i <= TO_UNSIGNED(1, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist6_rdcnt_i <= redist6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_rdcnt_i, 2)));

    -- redist6_rdmux(MUX,100)
    redist6_rdmux_s <= en;
    redist6_rdmux: PROCESS (redist6_rdmux_s, redist6_wraddr_q, redist6_rdcnt_q)
    BEGIN
        CASE (redist6_rdmux_s) IS
            WHEN "0" => redist6_rdmux_q <= redist6_wraddr_q;
            WHEN "1" => redist6_rdmux_q <= redist6_rdcnt_q;
            WHEN OTHERS => redist6_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- sBiasM1_uid28_fpSqrtTest(CONSTANT,27)
    sBiasM1_uid28_fpSqrtTest_q <= "01111110";

    -- expOddSig_uid29_fpSqrtTest(ADD,28)@0
    expOddSig_uid29_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expOddSig_uid29_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid28_fpSqrtTest_q);
    expOddSig_uid29_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid29_fpSqrtTest_a) + UNSIGNED(expOddSig_uid29_fpSqrtTest_b));
    expOddSig_uid29_fpSqrtTest_q <= expOddSig_uid29_fpSqrtTest_o(8 downto 0);

    -- expROdd_uid30_fpSqrtTest(BITSELECT,29)@0
    expROdd_uid30_fpSqrtTest_in <= expOddSig_uid29_fpSqrtTest_q;
    expROdd_uid30_fpSqrtTest_b <= expROdd_uid30_fpSqrtTest_in(8 downto 1);

    -- sBias_uid24_fpSqrtTest(CONSTANT,23)
    sBias_uid24_fpSqrtTest_q <= "01111111";

    -- expEvenSig_uid26_fpSqrtTest(ADD,25)@0
    expEvenSig_uid26_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expEvenSig_uid26_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBias_uid24_fpSqrtTest_q);
    expEvenSig_uid26_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid26_fpSqrtTest_a) + UNSIGNED(expEvenSig_uid26_fpSqrtTest_b));
    expEvenSig_uid26_fpSqrtTest_q <= expEvenSig_uid26_fpSqrtTest_o(8 downto 0);

    -- expREven_uid27_fpSqrtTest(BITSELECT,26)@0
    expREven_uid27_fpSqrtTest_in <= expEvenSig_uid26_fpSqrtTest_q;
    expREven_uid27_fpSqrtTest_b <= expREven_uid27_fpSqrtTest_in(8 downto 1);

    -- expRMux_uid33_fpSqrtTest(MUX,32)@0
    expRMux_uid33_fpSqrtTest_s <= expOddSelect_uid32_fpSqrtTest_q;
    expRMux_uid33_fpSqrtTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid33_fpSqrtTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (expRMux_uid33_fpSqrtTest_s) IS
                    WHEN "0" => expRMux_uid33_fpSqrtTest_q <= expREven_uid27_fpSqrtTest_b;
                    WHEN "1" => expRMux_uid33_fpSqrtTest_q <= expROdd_uid30_fpSqrtTest_b;
                    WHEN OTHERS => expRMux_uid33_fpSqrtTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist6_wraddr(REG,101)
    redist6_wraddr: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_wraddr_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist6_wraddr_q <= STD_LOGIC_VECTOR(redist6_rdmux_q);
        END IF;
    END PROCESS;

    -- redist6_mem(DUALMEM,98)
    redist6_mem_ia <= STD_LOGIC_VECTOR(expRMux_uid33_fpSqrtTest_q);
    redist6_mem_aa <= redist6_wraddr_q;
    redist6_mem_ab <= redist6_rdmux_q;
    redist6_mem_reset0 <= areset;
    redist6_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "AUTO",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 8,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => ""
    )
    PORT MAP (
        clocken1 => redist6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist6_mem_reset0,
        clock1 => clk,
        address_a => redist6_mem_aa,
        data_a => redist6_mem_ia,
        wren_a => en(0),
        address_b => redist6_mem_ab,
        q_b => redist6_mem_iq
    );
    redist6_mem_q <= redist6_mem_iq(7 downto 0);

    -- expR_uid41_fpSqrtTest(ADD,40)@6
    expR_uid41_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & redist6_mem_q);
    expR_uid41_fpSqrtTest_b <= STD_LOGIC_VECTOR("00000000" & expInc_uid39_fpSqrtTest_b);
    expR_uid41_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expR_uid41_fpSqrtTest_a) + UNSIGNED(expR_uid41_fpSqrtTest_b));
    expR_uid41_fpSqrtTest_q <= expR_uid41_fpSqrtTest_o(8 downto 0);

    -- expRR_uid52_fpSqrtTest(BITSELECT,51)@6
    expRR_uid52_fpSqrtTest_in <= expR_uid41_fpSqrtTest_q(7 downto 0);
    expRR_uid52_fpSqrtTest_b <= expRR_uid52_fpSqrtTest_in(7 downto 0);

    -- expXIsMax_uid14_fpSqrtTest(LOGICAL,13)@0
    expXIsMax_uid14_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsMax_uid14_fpSqrtTest_b <= cstAllOWE_uid8_fpSqrtTest_q;
    expXIsMax_uid14_fpSqrtTest_q <= "1" WHEN expXIsMax_uid14_fpSqrtTest_a = expXIsMax_uid14_fpSqrtTest_b ELSE "0";

    -- InvExpXIsMax_uid21_fpSqrtTest(LOGICAL,20)@0
    InvExpXIsMax_uid21_fpSqrtTest_a <= expXIsMax_uid14_fpSqrtTest_q;
    InvExpXIsMax_uid21_fpSqrtTest_q <= not (InvExpXIsMax_uid21_fpSqrtTest_a);

    -- InvExpXIsZero_uid22_fpSqrtTest(LOGICAL,21)@0
    InvExpXIsZero_uid22_fpSqrtTest_a <= expXIsZero_uid12_fpSqrtTest_q;
    InvExpXIsZero_uid22_fpSqrtTest_q <= not (InvExpXIsZero_uid22_fpSqrtTest_a);

    -- exc_R_uid23_fpSqrtTest(LOGICAL,22)@0
    exc_R_uid23_fpSqrtTest_a <= InvExpXIsZero_uid22_fpSqrtTest_q;
    exc_R_uid23_fpSqrtTest_b <= InvExpXIsMax_uid21_fpSqrtTest_q;
    exc_R_uid23_fpSqrtTest_q <= exc_R_uid23_fpSqrtTest_a and exc_R_uid23_fpSqrtTest_b;

    -- minReg_uid44_fpSqrtTest(LOGICAL,43)@0
    minReg_uid44_fpSqrtTest_a <= exc_R_uid23_fpSqrtTest_q;
    minReg_uid44_fpSqrtTest_b <= signX_uid7_fpSqrtTest_b;
    minReg_uid44_fpSqrtTest_q <= minReg_uid44_fpSqrtTest_a and minReg_uid44_fpSqrtTest_b;

    -- cstOneWF_uid9_fpSqrtTest(CONSTANT,8)
    cstOneWF_uid9_fpSqrtTest_q <= "00000000000000000000001";

    -- fracXIsNotZero_uid16_fpSqrtTest(COMPARE,15)@0
    fracXIsNotZero_uid16_fpSqrtTest_cin <= GND_q;
    fracXIsNotZero_uid16_fpSqrtTest_a <= STD_LOGIC_VECTOR("00" & frac_uid15_fpSqrtTest_b) & '0';
    fracXIsNotZero_uid16_fpSqrtTest_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid9_fpSqrtTest_q) & fracXIsNotZero_uid16_fpSqrtTest_cin(0);
    fracXIsNotZero_uid16_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid16_fpSqrtTest_a) - UNSIGNED(fracXIsNotZero_uid16_fpSqrtTest_b));
    fracXIsNotZero_uid16_fpSqrtTest_n(0) <= not (fracXIsNotZero_uid16_fpSqrtTest_o(25));

    -- fracXIsZero_uid17_fpSqrtTest(LOGICAL,16)@0
    fracXIsZero_uid17_fpSqrtTest_a <= fracXIsNotZero_uid16_fpSqrtTest_n;
    fracXIsZero_uid17_fpSqrtTest_q <= not (fracXIsZero_uid17_fpSqrtTest_a);

    -- exc_I_uid18_fpSqrtTest(LOGICAL,17)@0
    exc_I_uid18_fpSqrtTest_a <= expXIsMax_uid14_fpSqrtTest_q;
    exc_I_uid18_fpSqrtTest_b <= fracXIsZero_uid17_fpSqrtTest_q;
    exc_I_uid18_fpSqrtTest_q <= exc_I_uid18_fpSqrtTest_a and exc_I_uid18_fpSqrtTest_b;

    -- minInf_uid45_fpSqrtTest(LOGICAL,44)@0
    minInf_uid45_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    minInf_uid45_fpSqrtTest_b <= signX_uid7_fpSqrtTest_b;
    minInf_uid45_fpSqrtTest_q <= minInf_uid45_fpSqrtTest_a and minInf_uid45_fpSqrtTest_b;

    -- InvFracXIsZero_uid19_fpSqrtTest(LOGICAL,18)@0
    InvFracXIsZero_uid19_fpSqrtTest_a <= fracXIsZero_uid17_fpSqrtTest_q;
    InvFracXIsZero_uid19_fpSqrtTest_q <= not (InvFracXIsZero_uid19_fpSqrtTest_a);

    -- exc_N_uid20_fpSqrtTest(LOGICAL,19)@0
    exc_N_uid20_fpSqrtTest_a <= expXIsMax_uid14_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_b <= InvFracXIsZero_uid19_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_q <= exc_N_uid20_fpSqrtTest_a and exc_N_uid20_fpSqrtTest_b;

    -- excRNaN_uid46_fpSqrtTest(LOGICAL,45)@0
    excRNaN_uid46_fpSqrtTest_a <= exc_N_uid20_fpSqrtTest_q;
    excRNaN_uid46_fpSqrtTest_b <= minInf_uid45_fpSqrtTest_q;
    excRNaN_uid46_fpSqrtTest_c <= minReg_uid44_fpSqrtTest_q;
    excRNaN_uid46_fpSqrtTest_q <= excRNaN_uid46_fpSqrtTest_a or excRNaN_uid46_fpSqrtTest_b or excRNaN_uid46_fpSqrtTest_c;

    -- InvSignX_uid42_fpSqrtTest(LOGICAL,41)@0
    InvSignX_uid42_fpSqrtTest_a <= signX_uid7_fpSqrtTest_b;
    InvSignX_uid42_fpSqrtTest_q <= not (InvSignX_uid42_fpSqrtTest_a);

    -- inInfAndNotNeg_uid43_fpSqrtTest(LOGICAL,42)@0
    inInfAndNotNeg_uid43_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    inInfAndNotNeg_uid43_fpSqrtTest_b <= InvSignX_uid42_fpSqrtTest_q;
    inInfAndNotNeg_uid43_fpSqrtTest_q <= inInfAndNotNeg_uid43_fpSqrtTest_a and inInfAndNotNeg_uid43_fpSqrtTest_b;

    -- join_uid47_fpSqrtTest(BITJOIN,46)@0
    join_uid47_fpSqrtTest_q <= excRNaN_uid46_fpSqrtTest_q & inInfAndNotNeg_uid43_fpSqrtTest_q & expXIsZero_uid12_fpSqrtTest_q;

    -- fracSelIn_uid48_fpSqrtTest(BITJOIN,47)@0
    fracSelIn_uid48_fpSqrtTest_q <= signX_uid7_fpSqrtTest_b & join_uid47_fpSqrtTest_q;

    -- fracSel_uid49_fpSqrtTest(LOOKUP,48)@0
    fracSel_uid49_fpSqrtTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracSel_uid49_fpSqrtTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (fracSelIn_uid48_fpSqrtTest_q) IS
                    WHEN "0000" => fracSel_uid49_fpSqrtTest_q <= "01";
                    WHEN "0001" => fracSel_uid49_fpSqrtTest_q <= "00";
                    WHEN "0010" => fracSel_uid49_fpSqrtTest_q <= "10";
                    WHEN "0011" => fracSel_uid49_fpSqrtTest_q <= "00";
                    WHEN "0100" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN "0101" => fracSel_uid49_fpSqrtTest_q <= "00";
                    WHEN "0110" => fracSel_uid49_fpSqrtTest_q <= "10";
                    WHEN "0111" => fracSel_uid49_fpSqrtTest_q <= "00";
                    WHEN "1000" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN "1001" => fracSel_uid49_fpSqrtTest_q <= "00";
                    WHEN "1010" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN "1011" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN "1100" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN "1101" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN "1110" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN "1111" => fracSel_uid49_fpSqrtTest_q <= "11";
                    WHEN OTHERS => -- unreachable
                                   fracSel_uid49_fpSqrtTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist1(DELAY,92)
    redist1 : fpoint2_multi_dspba_delay
    GENERIC MAP ( width => 2, depth => 5 )
    PORT MAP ( xin => fracSel_uid49_fpSqrtTest_q, xout => redist1_q, ena => en(0), clk => clk, aclr => areset );

    -- expRPostExc_uid54_fpSqrtTest(MUX,53)@6
    expRPostExc_uid54_fpSqrtTest_s <= redist1_q;
    expRPostExc_uid54_fpSqrtTest: PROCESS (expRPostExc_uid54_fpSqrtTest_s, en, cstAllZWE_uid10_fpSqrtTest_q, expRR_uid52_fpSqrtTest_b, cstAllOWE_uid8_fpSqrtTest_q)
    BEGIN
        CASE (expRPostExc_uid54_fpSqrtTest_s) IS
            WHEN "00" => expRPostExc_uid54_fpSqrtTest_q <= cstAllZWE_uid10_fpSqrtTest_q;
            WHEN "01" => expRPostExc_uid54_fpSqrtTest_q <= expRR_uid52_fpSqrtTest_b;
            WHEN "10" => expRPostExc_uid54_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN "11" => expRPostExc_uid54_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN OTHERS => expRPostExc_uid54_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostProcessings_uid40_fpSqrtTest(BITSELECT,39)@6
    fracRPostProcessings_uid40_fpSqrtTest_in <= s2_uid76_uid79_sqrtPolynomialEvaluator_q(28 downto 0);
    fracRPostProcessings_uid40_fpSqrtTest_b <= fracRPostProcessings_uid40_fpSqrtTest_in(28 downto 6);

    -- fracInf_uid56_fpSqrtTest(CONSTANT,55)
    fracInf_uid56_fpSqrtTest_q <= "00000000000000000000000";

    -- fracRPostExc_uid58_fpSqrtTest(MUX,57)@6
    fracRPostExc_uid58_fpSqrtTest_s <= redist1_q;
    fracRPostExc_uid58_fpSqrtTest: PROCESS (fracRPostExc_uid58_fpSqrtTest_s, en, fracInf_uid56_fpSqrtTest_q, fracRPostProcessings_uid40_fpSqrtTest_b, cstOneWF_uid9_fpSqrtTest_q)
    BEGIN
        CASE (fracRPostExc_uid58_fpSqrtTest_s) IS
            WHEN "00" => fracRPostExc_uid58_fpSqrtTest_q <= fracInf_uid56_fpSqrtTest_q;
            WHEN "01" => fracRPostExc_uid58_fpSqrtTest_q <= fracRPostProcessings_uid40_fpSqrtTest_b;
            WHEN "10" => fracRPostExc_uid58_fpSqrtTest_q <= fracInf_uid56_fpSqrtTest_q;
            WHEN "11" => fracRPostExc_uid58_fpSqrtTest_q <= cstOneWF_uid9_fpSqrtTest_q;
            WHEN OTHERS => fracRPostExc_uid58_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RSqrt_uid60_fpSqrtTest(BITJOIN,59)@6
    RSqrt_uid60_fpSqrtTest_q <= redist0_q & expRPostExc_uid54_fpSqrtTest_q & fracRPostExc_uid58_fpSqrtTest_q;

    -- xOut(GPOUT,4)@6
    r <= RSqrt_uid60_fpSqrtTest_q;

END normal;
