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


-- safe_path for FPSqrt given rtl dir is . (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE FPSqrt_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END FPSqrt_safe_path;

PACKAGE body FPSqrt_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./") & path;
	END FUNCTION safe_path;
END FPSqrt_safe_path;
