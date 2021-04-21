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

-- VHDL created from Fix_Add_altera_fxp_functions_191_3l2g3ki
-- VHDL created on Tue Apr 20 21:15:22 2021


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

entity Fix_Add_altera_fxp_functions_191_3l2g3ki is
    port (
        a0 : in std_logic_vector(31 downto 0);  -- sfix32
        a1 : in std_logic_vector(31 downto 0);  -- sfix32
        en : in std_logic_vector(0 downto 0);  -- ufix1
        result : out std_logic_vector(32 downto 0);  -- sfix33
        clk : in std_logic;
        rst : in std_logic
    );
end Fix_Add_altera_fxp_functions_191_3l2g3ki;

architecture normal of Fix_Add_altera_fxp_functions_191_3l2g3ki is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal adder_a : STD_LOGIC_VECTOR (32 downto 0);
    signal adder_b : STD_LOGIC_VECTOR (32 downto 0);
    signal adder_o : STD_LOGIC_VECTOR (32 downto 0);
    signal adder_q : STD_LOGIC_VECTOR (32 downto 0);

begin


    -- adder(ADD,2)@0 + 1
    adder_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => a0(31)) & a0));
    adder_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => a1(31)) & a1));
    adder_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                adder_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    adder_o <= STD_LOGIC_VECTOR(SIGNED(adder_a) + SIGNED(adder_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    adder_q <= adder_o(32 downto 0);

    -- out_rsrvd_fix(GPOUT,5)@1
    result <= adder_q;

END normal;
