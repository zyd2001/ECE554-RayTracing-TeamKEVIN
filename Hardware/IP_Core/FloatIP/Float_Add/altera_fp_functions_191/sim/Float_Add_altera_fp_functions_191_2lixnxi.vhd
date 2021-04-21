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

-- VHDL created from Float_Add_altera_fp_functions_191_2lixnxi
-- VHDL created on Tue Apr 20 23:03:08 2021


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

entity Float_Add_altera_fp_functions_191_2lixnxi is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        opSel : in std_logic_vector(0 downto 0);  -- ufix1
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end Float_Add_altera_fp_functions_191_2lixnxi;

architecture normal of Float_Add_altera_fp_functions_191_2lixnxi is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal signB_uid6_fpAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal restB_uid7_fpAddSubTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal invSignB_uid8_fpAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal muxSignB_uid9_fpAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal muxSignB_uid9_fpAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bOperand_uid10_fpAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fpAddSubTest_ieeeAdd_impl_reset0 : std_logic;
    signal fpAddSubTest_ieeeAdd_impl_ena0 : std_logic;
    signal fpAddSubTest_ieeeAdd_impl_ax0 : STD_LOGIC_VECTOR (31 downto 0);
    signal fpAddSubTest_ieeeAdd_impl_ay0 : STD_LOGIC_VECTOR (31 downto 0);
    signal fpAddSubTest_ieeeAdd_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- signB_uid6_fpAddSubTest(BITSELECT,5)@0
    signB_uid6_fpAddSubTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- invSignB_uid8_fpAddSubTest(LOGICAL,7)@0
    invSignB_uid8_fpAddSubTest_q <= not (signB_uid6_fpAddSubTest_b);

    -- muxSignB_uid9_fpAddSubTest(MUX,8)@0
    muxSignB_uid9_fpAddSubTest_s <= opSel;
    muxSignB_uid9_fpAddSubTest_combproc: PROCESS (muxSignB_uid9_fpAddSubTest_s, en, invSignB_uid8_fpAddSubTest_q, signB_uid6_fpAddSubTest_b)
    BEGIN
        CASE (muxSignB_uid9_fpAddSubTest_s) IS
            WHEN "0" => muxSignB_uid9_fpAddSubTest_q <= invSignB_uid8_fpAddSubTest_q;
            WHEN "1" => muxSignB_uid9_fpAddSubTest_q <= signB_uid6_fpAddSubTest_b;
            WHEN OTHERS => muxSignB_uid9_fpAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- restB_uid7_fpAddSubTest(BITSELECT,6)@0
    restB_uid7_fpAddSubTest_b <= b(30 downto 0);

    -- bOperand_uid10_fpAddSubTest(BITJOIN,9)@0
    bOperand_uid10_fpAddSubTest_q <= muxSignB_uid9_fpAddSubTest_q & restB_uid7_fpAddSubTest_b;

    -- fpAddSubTest_ieeeAdd_impl(FPCOLUMN,14)@0
    -- out q0@3
    fpAddSubTest_ieeeAdd_impl_ax0 <= STD_LOGIC_VECTOR(bOperand_uid10_fpAddSubTest_q);
    fpAddSubTest_ieeeAdd_impl_ay0 <= a;
    fpAddSubTest_ieeeAdd_impl_reset0 <= areset;
    fpAddSubTest_ieeeAdd_impl_ena0 <= en(0) or fpAddSubTest_ieeeAdd_impl_reset0;
    fpAddSubTest_ieeeAdd_impl_DSP0 : fourteennm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_add",
        ax_clock => "0",
        ay_clock => "0",
        adder_input_clock => "0",
        output_clock => "0",
        clear_type => "sclr"
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => fpAddSubTest_ieeeAdd_impl_ena0,
        ena(1) => '0',
        ena(2) => '0',
        clr(0) => fpAddSubTest_ieeeAdd_impl_reset0,
        clr(1) => fpAddSubTest_ieeeAdd_impl_reset0,
        ax => fpAddSubTest_ieeeAdd_impl_ax0,
        ay => fpAddSubTest_ieeeAdd_impl_ay0,
        resulta => fpAddSubTest_ieeeAdd_impl_q0
    );

    -- xOut(GPOUT,4)@3
    q <= fpAddSubTest_ieeeAdd_impl_q0;

END normal;
