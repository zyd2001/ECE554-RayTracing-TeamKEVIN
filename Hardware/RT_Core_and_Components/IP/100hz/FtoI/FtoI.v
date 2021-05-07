// Copyright (C) 2019  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 19.2.0 Build 57 06/24/2019 Patches 0.01dc SJ Pro Edition"

// DATE "05/07/2021 03:18:03"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module FtoI (
	q,
	a,
	areset,
	clk,
	en)/* synthesis synthesis_greybox=0 */;
output 	[31:0] q;
input 	[31:0] a;
input 	areset;
input 	clk;
input 	[0:0] en;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire fp_functions_0_aadd_2_a1_sumout;
wire fp_functions_0_aadd_2_a2;
wire fp_functions_0_aadd_4_a1_sumout;
wire fp_functions_0_aadd_2_a6_sumout;
wire fp_functions_0_aadd_2_a7;
wire fp_functions_0_aadd_2_a11_sumout;
wire fp_functions_0_aadd_2_a12;
wire fp_functions_0_aadd_2_a16_sumout;
wire fp_functions_0_aadd_2_a17;
wire fp_functions_0_aadd_2_a21_sumout;
wire fp_functions_0_aadd_2_a22;
wire fp_functions_0_aadd_2_a26_sumout;
wire fp_functions_0_aadd_2_a27;
wire fp_functions_0_aadd_2_a31_sumout;
wire fp_functions_0_aadd_2_a32;
wire fp_functions_0_aadd_2_a36_sumout;
wire fp_functions_0_aadd_2_a37;
wire fp_functions_0_aadd_2_a41_sumout;
wire fp_functions_0_aadd_2_a42;
wire fp_functions_0_aadd_2_a46_sumout;
wire fp_functions_0_aadd_2_a47;
wire fp_functions_0_aadd_2_a51_sumout;
wire fp_functions_0_aadd_2_a52;
wire fp_functions_0_aadd_2_a56_sumout;
wire fp_functions_0_aadd_2_a57;
wire fp_functions_0_aadd_2_a61_sumout;
wire fp_functions_0_aadd_2_a62;
wire fp_functions_0_aadd_2_a66_sumout;
wire fp_functions_0_aadd_2_a67;
wire fp_functions_0_aadd_2_a71_sumout;
wire fp_functions_0_aadd_2_a72;
wire fp_functions_0_aadd_2_a76_sumout;
wire fp_functions_0_aadd_2_a77;
wire fp_functions_0_aadd_2_a81_sumout;
wire fp_functions_0_aadd_2_a82;
wire fp_functions_0_aadd_2_a86_sumout;
wire fp_functions_0_aadd_2_a87;
wire fp_functions_0_aadd_2_a91_sumout;
wire fp_functions_0_aadd_2_a92;
wire fp_functions_0_aadd_2_a96_sumout;
wire fp_functions_0_aadd_2_a97;
wire fp_functions_0_aadd_2_a101_sumout;
wire fp_functions_0_aadd_2_a102;
wire fp_functions_0_aadd_2_a106_sumout;
wire fp_functions_0_aadd_2_a107;
wire fp_functions_0_aadd_2_a111_sumout;
wire fp_functions_0_aadd_2_a112;
wire fp_functions_0_aadd_2_a116_sumout;
wire fp_functions_0_aadd_2_a117;
wire fp_functions_0_aadd_2_a121_sumout;
wire fp_functions_0_aadd_2_a122;
wire fp_functions_0_aadd_2_a126_sumout;
wire fp_functions_0_aadd_2_a127;
wire fp_functions_0_aadd_2_a131_sumout;
wire fp_functions_0_aadd_2_a132;
wire fp_functions_0_aadd_2_a136_sumout;
wire fp_functions_0_aadd_2_a137;
wire fp_functions_0_aadd_2_a141_sumout;
wire fp_functions_0_aadd_2_a142;
wire fp_functions_0_aadd_2_a146_sumout;
wire fp_functions_0_aadd_2_a147;
wire fp_functions_0_aadd_2_a151_sumout;
wire fp_functions_0_aadd_2_a152;
wire fp_functions_0_aadd_2_a156_sumout;
wire fp_functions_0_aadd_2_a157;
wire fp_functions_0_aadd_3_a1_sumout;
wire fp_functions_0_aadd_5_a1_sumout;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a5_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a7_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a6_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a8_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a9_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a11_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a12_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a17_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a19_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a18_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a20_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a13_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a15_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a14_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a16_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a_aq;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a_aq;
wire fp_functions_0_aadd_2_a161_sumout;
wire fp_functions_0_aadd_4_a7_cout;
wire fp_functions_0_aadd_3_a7_cout;
wire fp_functions_0_aadd_5_a7_cout;
wire fp_functions_0_aadd_0_a1_sumout;
wire fp_functions_0_aadd_0_a2;
wire fp_functions_0_aadd_1_a1_sumout;
wire fp_functions_0_aadd_0_a6_sumout;
wire fp_functions_0_aadd_0_a7;
wire fp_functions_0_aadd_0_a11_sumout;
wire fp_functions_0_aadd_0_a12;
wire fp_functions_0_aadd_0_a16_sumout;
wire fp_functions_0_aadd_0_a17;
wire fp_functions_0_aadd_4_a12_cout;
wire fp_functions_0_aadd_3_a12_cout;
wire fp_functions_0_aadd_5_a12_cout;
wire fp_functions_0_aadd_0_a21_sumout;
wire fp_functions_0_aadd_1_a7_cout;
wire fp_functions_0_aadd_0_a27_cout;
wire fp_functions_0_aadd_4_a17_cout;
wire fp_functions_0_aadd_3_a17_cout;
wire fp_functions_0_aadd_5_a17_cout;
wire fp_functions_0_aadd_0_a31_sumout;
wire fp_functions_0_aadd_0_a32;
wire fp_functions_0_aadd_1_a12_cout;
wire fp_functions_0_aadd_0_a37_cout;
wire fp_functions_0_aadd_4_a22_cout;
wire fp_functions_0_aadd_3_a22_cout;
wire fp_functions_0_aadd_5_a22_cout;
wire fp_functions_0_aadd_0_a41_sumout;
wire fp_functions_0_aadd_0_a42;
wire fp_functions_0_aadd_1_a17_cout;
wire fp_functions_0_aadd_0_a47_cout;
wire fp_functions_0_aadd_4_a27_cout;
wire fp_functions_0_aadd_3_a27_cout;
wire fp_functions_0_aadd_5_a27_cout;
wire fp_functions_0_aadd_0_a51_sumout;
wire fp_functions_0_aadd_0_a52;
wire fp_functions_0_aadd_1_a22_cout;
wire fp_functions_0_aadd_4_a32_cout;
wire fp_functions_0_aadd_3_a32_cout;
wire fp_functions_0_aadd_5_a32_cout;
wire fp_functions_0_aadd_1_a27_cout;
wire fp_functions_0_aadd_4_a37_cout;
wire fp_functions_0_aadd_3_a37_cout;
wire fp_functions_0_aadd_5_a37_cout;
wire fp_functions_0_aadd_1_a32_cout;
wire fp_functions_0_aadd_4_a42_cout;
wire fp_functions_0_aadd_3_a42_cout;
wire fp_functions_0_aadd_5_a42_cout;
wire fp_functions_0_aadd_1_a37_cout;
wire fp_functions_0_aadd_4_a47_cout;
wire fp_functions_0_aadd_3_a47_cout;
wire fp_functions_0_aadd_5_a47_cout;
wire fp_functions_0_aadd_1_a42_cout;
wire fp_functions_0_aadd_4_a52_cout;
wire fp_functions_0_aadd_1_a47_cout;
wire fp_functions_0_aadd_4_a57_cout;
wire fp_functions_0_aadd_1_a52_cout;
wire fp_functions_0_aadd_4_a62_cout;
wire fp_functions_0_aadd_1_a57_cout;
wire fp_functions_0_aadd_4_a67_cout;
wire fp_functions_0_aadd_4_a72_cout;
wire fp_functions_0_aadd_4_a77_cout;
wire fp_functions_0_aadd_4_a82_cout;
wire fp_functions_0_aadd_4_a87_cout;
wire fp_functions_0_aadd_4_a92_cout;
wire fp_functions_0_aadd_4_a97_cout;
wire fp_functions_0_aadd_4_a102_cout;
wire fp_functions_0_aadd_4_a107_cout;
wire fp_functions_0_aadd_4_a112_cout;
wire fp_functions_0_aadd_4_a117_cout;
wire fp_functions_0_aadd_4_a122_cout;
wire fp_functions_0_aadd_4_a127_cout;
wire fp_functions_0_aadd_4_a132_cout;
wire fp_functions_0_aadd_4_a137_cout;
wire fp_functions_0_aadd_4_a142_cout;
wire fp_functions_0_aadd_4_a147_cout;
wire fp_functions_0_aadd_4_a152_cout;
wire fp_functions_0_aadd_4_a157_cout;
wire fp_functions_0_aadd_4_a162_cout;
wire fp_functions_0_aadd_4_a167_cout;
wire fp_functions_0_aadd_4_a172_cout;
wire fp_functions_0_aMux_25_a9_cout;
wire fp_functions_0_aMux_25_a13_sumout;
wire fp_functions_0_aMux_25_a14;
wire fp_functions_0_aMux_25_a18_sumout;
wire fp_functions_0_aMux_25_a19;
wire fp_functions_0_aMux_25_a23_sumout;
wire fp_functions_0_aMux_25_a24;
wire fp_functions_0_aMux_25_a28_sumout;
wire fp_functions_0_aMux_25_a29;
wire fp_functions_0_aMux_25_a33_sumout;
wire fp_functions_0_aMux_25_a34;
wire fp_functions_0_aMux_25_a38_sumout;
wire fp_functions_0_aMux_25_a39;
wire fp_functions_0_aMux_25_a43_sumout;
wire fp_functions_0_aMux_25_a44;
wire fp_functions_0_aMux_25_a48_sumout;
wire fp_functions_0_aMux_25_a49;
wire fp_functions_0_aMux_25_a53_sumout;
wire fp_functions_0_aMux_25_a54;
wire fp_functions_0_aMux_25_a58_sumout;
wire fp_functions_0_aMux_25_a59;
wire fp_functions_0_aMux_25_a63_sumout;
wire fp_functions_0_aMux_25_a64;
wire fp_functions_0_aMux_25_a68_sumout;
wire fp_functions_0_aMux_25_a69;
wire fp_functions_0_aMux_25_a73_sumout;
wire fp_functions_0_aMux_25_a74;
wire fp_functions_0_aMux_25_a78_sumout;
wire fp_functions_0_aMux_25_a79;
wire fp_functions_0_aMux_25_a83_sumout;
wire fp_functions_0_aMux_25_a84;
wire fp_functions_0_aMux_25_a88_sumout;
wire fp_functions_0_aMux_25_a89;
wire fp_functions_0_aMux_25_a93_sumout;
wire fp_functions_0_aMux_25_a94;
wire fp_functions_0_aMux_25_a98_sumout;
wire fp_functions_0_aMux_25_a99;
wire fp_functions_0_aMux_25_a103_sumout;
wire fp_functions_0_aMux_95_a1_combout;
wire fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq;
wire fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq;
wire fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a_aq;
wire fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout;
wire fp_functions_0_aMux_129_a2_combout;
wire fp_functions_0_aMux_128_a2_combout;
wire fp_functions_0_aMux_127_a2_combout;
wire fp_functions_0_aMux_126_a2_combout;
wire fp_functions_0_aMux_125_a2_combout;
wire fp_functions_0_aMux_124_a2_combout;
wire fp_functions_0_aMux_123_a2_combout;
wire fp_functions_0_aMux_122_a2_combout;
wire fp_functions_0_aMux_121_a2_combout;
wire fp_functions_0_aMux_120_a2_combout;
wire fp_functions_0_aMux_119_a2_combout;
wire fp_functions_0_aMux_118_a2_combout;
wire fp_functions_0_aMux_117_a2_combout;
wire fp_functions_0_aMux_116_a2_combout;
wire fp_functions_0_aMux_115_a2_combout;
wire fp_functions_0_aMux_114_a2_combout;
wire fp_functions_0_aMux_113_a2_combout;
wire fp_functions_0_aMux_112_a2_combout;
wire fp_functions_0_aMux_111_a2_combout;
wire fp_functions_0_aMux_110_a2_combout;
wire fp_functions_0_aMux_109_a2_combout;
wire fp_functions_0_aMux_108_a2_combout;
wire fp_functions_0_aMux_107_a2_combout;
wire fp_functions_0_aMux_106_a2_combout;
wire fp_functions_0_aMux_105_a2_combout;
wire fp_functions_0_aMux_104_a2_combout;
wire fp_functions_0_aMux_103_a2_combout;
wire fp_functions_0_aMux_102_a2_combout;
wire fp_functions_0_aMux_101_a2_combout;
wire fp_functions_0_aMux_100_a2_combout;
wire fp_functions_0_aMux_99_a2_combout;
wire fp_functions_0_aMux_98_a2_combout;
wire fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0_combout;
wire fp_functions_0_areduce_nor_0_a0_combout;
wire fp_functions_0_areduce_nor_0_a1_combout;
wire fp_functions_0_areduce_nor_0_a2_combout;
wire fp_functions_0_areduce_nor_0_a3_combout;
wire fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1_combout;
wire fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_ai6_a0_combout;
wire fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout;
wire fp_functions_0_ai105_a0_combout;
wire fp_functions_0_ai1282_a0_combout;
wire fp_functions_0_ai1540_a0_combout;
wire fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a2_combout;
wire fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq;
wire fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq;
wire fp_functions_0_aMux_92_a1_combout;
wire fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq;
wire fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq;
wire fp_functions_0_aMux_25_a1_combout;
wire fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq;
wire fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq;
wire fp_functions_0_aMux_94_a1_combout;
wire fp_functions_0_aMux_94_a2_combout;
wire fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aMux_25_a2_combout;
wire fp_functions_0_aMux_61_a0_combout;
wire fp_functions_0_aMux_94_a3_combout;
wire fp_functions_0_aMux_94_a4_combout;
wire fp_functions_0_aMux_94_a5_combout;
wire fp_functions_0_aMux_61_a1_combout;
wire fp_functions_0_aMux_25_a3_combout;
wire fp_functions_0_aMux_25_a4_combout;
wire fp_functions_0_aMux_61_a2_combout;
wire fp_functions_0_aMux_25_a5_combout;
wire fp_functions_0_aMux_93_a1_combout;
wire fp_functions_0_aMux_0_a0_combout;
wire fp_functions_0_aMux_61_a3_combout;
wire fp_functions_0_aMux_25_a6_combout;
wire fp_functions_0_aMux_92_a2_combout;
wire fp_functions_0_aMux_92_a3_combout;
wire fp_functions_0_aMux_61_a4_combout;
wire fp_functions_0_aMux_91_a1_combout;
wire fp_functions_0_aMux_91_a2_combout;
wire fp_functions_0_aMux_90_a1_combout;
wire fp_functions_0_aMux_90_a2_combout;
wire fp_functions_0_aMux_90_a3_combout;
wire fp_functions_0_aMux_61_a5_combout;
wire fp_functions_0_aMux_90_a4_combout;
wire fp_functions_0_aMux_90_a5_combout;
wire fp_functions_0_aMux_61_a6_combout;
wire fp_functions_0_aMux_90_a6_combout;
wire fp_functions_0_aMux_89_a1_combout;
wire fp_functions_0_aMux_89_a2_combout;
wire fp_functions_0_aMux_89_a3_combout;
wire fp_functions_0_aMux_61_a7_combout;
wire fp_functions_0_aMux_88_a1_combout;
wire fp_functions_0_aMux_88_a2_combout;
wire fp_functions_0_aMux_88_a3_combout;
wire fp_functions_0_aMux_61_a8_combout;
wire fp_functions_0_aMux_87_a1_combout;
wire fp_functions_0_aMux_87_a2_combout;
wire fp_functions_0_aMux_86_a1_combout;
wire fp_functions_0_aMux_61_a9_combout;
wire fp_functions_0_aMux_86_a2_combout;
wire fp_functions_0_aMux_85_a1_combout;
wire fp_functions_0_aMux_61_a10_combout;
wire fp_functions_0_aMux_85_a2_combout;
wire fp_functions_0_aMux_36_a1_combout;
wire fp_functions_0_aMux_84_a1_combout;
wire fp_functions_0_aMux_84_a2_combout;
wire fp_functions_0_aMux_61_a11_combout;
wire fp_functions_0_aMux_35_a0_combout;
wire fp_functions_0_aMux_83_a1_combout;
wire fp_functions_0_aMux_83_a2_combout;
wire fp_functions_0_aMux_34_a0_combout;
wire fp_functions_0_aMux_82_a1_combout;
wire fp_functions_0_aMux_82_a2_combout;
wire fp_functions_0_aMux_33_a0_combout;
wire fp_functions_0_aMux_81_a1_combout;
wire fp_functions_0_aMux_81_a2_combout;
wire fp_functions_0_aMux_32_a0_combout;
wire fp_functions_0_aMux_80_a1_combout;
wire fp_functions_0_aMux_80_a2_combout;
wire fp_functions_0_aMux_64_a0_combout;
wire fp_functions_0_ai945_a0_combout;
wire fp_functions_0_ai945_a1_combout;
wire fp_functions_0_areduce_nor_2_a0_combout;
wire fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout;
wire fp_functions_0_ai945_a2_combout;
wire fp_functions_0_ai945_a3_combout;
wire fp_functions_0_ai945_a4_combout;
wire fp_functions_0_ai945_a5_combout;
wire fp_functions_0_aMux_93_a2_combout;
wire fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_a0_combout;


fourteennm_lcell_comb fp_functions_0_aadd_2_a1(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_aMux_94_a5_combout),
	.datad(!fp_functions_0_aMux_95_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a1_sumout),
	.cout(fp_functions_0_aadd_2_a2),
	.shareout());
defparam fp_functions_0_aadd_2_a1.extended_lut = "off";
defparam fp_functions_0_aadd_2_a1.lut_mask = 64'h00000000200D0FF0;
defparam fp_functions_0_aadd_2_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a161_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_4_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_4_a1.extended_lut = "off";
defparam fp_functions_0_aadd_4_a1.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_4_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a6(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_aMux_93_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a2),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a6_sumout),
	.cout(fp_functions_0_aadd_2_a7),
	.shareout());
defparam fp_functions_0_aadd_2_a6.extended_lut = "off";
defparam fp_functions_0_aadd_2_a6.lut_mask = 64'h0000000000002D2D;
defparam fp_functions_0_aadd_2_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a11(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_92_a3_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a7),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a11_sumout),
	.cout(fp_functions_0_aadd_2_a12),
	.shareout());
defparam fp_functions_0_aadd_2_a11.extended_lut = "off";
defparam fp_functions_0_aadd_2_a11.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a16(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_91_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a12),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a16_sumout),
	.cout(fp_functions_0_aadd_2_a17),
	.shareout());
defparam fp_functions_0_aadd_2_a16.extended_lut = "off";
defparam fp_functions_0_aadd_2_a16.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a21(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_90_a5_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a17),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a21_sumout),
	.cout(fp_functions_0_aadd_2_a22),
	.shareout());
defparam fp_functions_0_aadd_2_a21.extended_lut = "off";
defparam fp_functions_0_aadd_2_a21.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a26(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_89_a3_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a22),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a26_sumout),
	.cout(fp_functions_0_aadd_2_a27),
	.shareout());
defparam fp_functions_0_aadd_2_a26.extended_lut = "off";
defparam fp_functions_0_aadd_2_a26.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a31(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_88_a3_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a27),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a31_sumout),
	.cout(fp_functions_0_aadd_2_a32),
	.shareout());
defparam fp_functions_0_aadd_2_a31.extended_lut = "off";
defparam fp_functions_0_aadd_2_a31.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a36(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_87_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a36_sumout),
	.cout(fp_functions_0_aadd_2_a37),
	.shareout());
defparam fp_functions_0_aadd_2_a36.extended_lut = "off";
defparam fp_functions_0_aadd_2_a36.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a41(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_86_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a37),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a41_sumout),
	.cout(fp_functions_0_aadd_2_a42),
	.shareout());
defparam fp_functions_0_aadd_2_a41.extended_lut = "off";
defparam fp_functions_0_aadd_2_a41.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a46(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_85_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a42),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a46_sumout),
	.cout(fp_functions_0_aadd_2_a47),
	.shareout());
defparam fp_functions_0_aadd_2_a46.extended_lut = "off";
defparam fp_functions_0_aadd_2_a46.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a46.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a51(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_84_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a47),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a51_sumout),
	.cout(fp_functions_0_aadd_2_a52),
	.shareout());
defparam fp_functions_0_aadd_2_a51.extended_lut = "off";
defparam fp_functions_0_aadd_2_a51.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a51.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a56(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_83_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a56_sumout),
	.cout(fp_functions_0_aadd_2_a57),
	.shareout());
defparam fp_functions_0_aadd_2_a56.extended_lut = "off";
defparam fp_functions_0_aadd_2_a56.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a56.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a61(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_82_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a57),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a61_sumout),
	.cout(fp_functions_0_aadd_2_a62),
	.shareout());
defparam fp_functions_0_aadd_2_a61.extended_lut = "off";
defparam fp_functions_0_aadd_2_a61.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a61.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a66(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_81_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a62),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a66_sumout),
	.cout(fp_functions_0_aadd_2_a67),
	.shareout());
defparam fp_functions_0_aadd_2_a66.extended_lut = "off";
defparam fp_functions_0_aadd_2_a66.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a66.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a71(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_80_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a67),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a71_sumout),
	.cout(fp_functions_0_aadd_2_a72),
	.shareout());
defparam fp_functions_0_aadd_2_a71.extended_lut = "off";
defparam fp_functions_0_aadd_2_a71.lut_mask = 64'h0000000000004B4B;
defparam fp_functions_0_aadd_2_a71.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a76(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a1_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a72),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a76_sumout),
	.cout(fp_functions_0_aadd_2_a77),
	.shareout());
defparam fp_functions_0_aadd_2_a76.extended_lut = "off";
defparam fp_functions_0_aadd_2_a76.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a76.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a81(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a0_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a77),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a81_sumout),
	.cout(fp_functions_0_aadd_2_a82),
	.shareout());
defparam fp_functions_0_aadd_2_a81.extended_lut = "off";
defparam fp_functions_0_aadd_2_a81.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a81.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a86(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a2_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a82),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a86_sumout),
	.cout(fp_functions_0_aadd_2_a87),
	.shareout());
defparam fp_functions_0_aadd_2_a86.extended_lut = "off";
defparam fp_functions_0_aadd_2_a86.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a86.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a91(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a3_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a87),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a91_sumout),
	.cout(fp_functions_0_aadd_2_a92),
	.shareout());
defparam fp_functions_0_aadd_2_a91.extended_lut = "off";
defparam fp_functions_0_aadd_2_a91.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a91.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a96(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a4_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a92),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a96_sumout),
	.cout(fp_functions_0_aadd_2_a97),
	.shareout());
defparam fp_functions_0_aadd_2_a96.extended_lut = "off";
defparam fp_functions_0_aadd_2_a96.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a96.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a101(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a5_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a97),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a101_sumout),
	.cout(fp_functions_0_aadd_2_a102),
	.shareout());
defparam fp_functions_0_aadd_2_a101.extended_lut = "off";
defparam fp_functions_0_aadd_2_a101.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a101.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a106(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a6_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a102),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a106_sumout),
	.cout(fp_functions_0_aadd_2_a107),
	.shareout());
defparam fp_functions_0_aadd_2_a106.extended_lut = "off";
defparam fp_functions_0_aadd_2_a106.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a106.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a111(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a7_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a107),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a111_sumout),
	.cout(fp_functions_0_aadd_2_a112),
	.shareout());
defparam fp_functions_0_aadd_2_a111.extended_lut = "off";
defparam fp_functions_0_aadd_2_a111.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a111.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a116(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a8_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a112),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a116_sumout),
	.cout(fp_functions_0_aadd_2_a117),
	.shareout());
defparam fp_functions_0_aadd_2_a116.extended_lut = "off";
defparam fp_functions_0_aadd_2_a116.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a116.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a121(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a9_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a117),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a121_sumout),
	.cout(fp_functions_0_aadd_2_a122),
	.shareout());
defparam fp_functions_0_aadd_2_a121.extended_lut = "off";
defparam fp_functions_0_aadd_2_a121.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a121.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a126(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_61_a10_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a122),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a126_sumout),
	.cout(fp_functions_0_aadd_2_a127),
	.shareout());
defparam fp_functions_0_aadd_2_a126.extended_lut = "off";
defparam fp_functions_0_aadd_2_a126.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a126.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a131(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_36_a1_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a127),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a131_sumout),
	.cout(fp_functions_0_aadd_2_a132),
	.shareout());
defparam fp_functions_0_aadd_2_a131.extended_lut = "off";
defparam fp_functions_0_aadd_2_a131.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a131.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a136(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_35_a0_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a132),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a136_sumout),
	.cout(fp_functions_0_aadd_2_a137),
	.shareout());
defparam fp_functions_0_aadd_2_a136.extended_lut = "off";
defparam fp_functions_0_aadd_2_a136.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a136.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a141(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_34_a0_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a137),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a141_sumout),
	.cout(fp_functions_0_aadd_2_a142),
	.shareout());
defparam fp_functions_0_aadd_2_a141.extended_lut = "off";
defparam fp_functions_0_aadd_2_a141.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a141.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a146(
	.dataa(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aMux_33_a0_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a142),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a146_sumout),
	.cout(fp_functions_0_aadd_2_a147),
	.shareout());
defparam fp_functions_0_aadd_2_a146.extended_lut = "off";
defparam fp_functions_0_aadd_2_a146.lut_mask = 64'h000000000000444B;
defparam fp_functions_0_aadd_2_a146.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a151(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_aMux_32_a0_combout),
	.datad(!fp_functions_0_aMux_64_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a147),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a151_sumout),
	.cout(fp_functions_0_aadd_2_a152),
	.shareout());
defparam fp_functions_0_aadd_2_a151.extended_lut = "off";
defparam fp_functions_0_aadd_2_a151.lut_mask = 64'h000000000000222D;
defparam fp_functions_0_aadd_2_a151.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a156(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a152),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a156_sumout),
	.cout(fp_functions_0_aadd_2_a157),
	.shareout());
defparam fp_functions_0_aadd_2_a156.extended_lut = "off";
defparam fp_functions_0_aadd_2_a156.lut_mask = 64'h0000000000002222;
defparam fp_functions_0_aadd_2_a156.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_3_a1.extended_lut = "off";
defparam fp_functions_0_aadd_3_a1.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_3_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_5_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_5_a1.extended_lut = "off";
defparam fp_functions_0_aadd_5_a1.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_5_a1.shared_arith = "off";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a5_a(
	.clk(clk),
	.d(a[5]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a5_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a7_a(
	.clk(clk),
	.d(a[7]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a7_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a6_a(
	.clk(clk),
	.d(a[6]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a6_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a8_a(
	.clk(clk),
	.d(a[8]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a8_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a(
	.clk(clk),
	.d(a[0]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a(
	.clk(clk),
	.d(a[1]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a(
	.clk(clk),
	.d(a[3]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a(
	.clk(clk),
	.d(a[2]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a(
	.clk(clk),
	.d(a[4]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a9_a(
	.clk(clk),
	.d(a[9]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a9_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a11_a(
	.clk(clk),
	.d(a[11]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a11_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a(
	.clk(clk),
	.d(a[10]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a12_a(
	.clk(clk),
	.d(a[12]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a12_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a17_a(
	.clk(clk),
	.d(a[17]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a17_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a19_a(
	.clk(clk),
	.d(a[19]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a19_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a18_a(
	.clk(clk),
	.d(a[18]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a18_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a20_a(
	.clk(clk),
	.d(a[20]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a20_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a13_a(
	.clk(clk),
	.d(a[13]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a13_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a15_a(
	.clk(clk),
	.d(a[15]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a15_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a14_a(
	.clk(clk),
	.d(a[14]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a14_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a16_a(
	.clk(clk),
	.d(a[16]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a16_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a(
	.clk(clk),
	.d(a[21]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a(
	.clk(clk),
	.d(a[22]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a_aq));
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_2_a161(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a157),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a161_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a161.extended_lut = "off";
defparam fp_functions_0_aadd_2_a161.lut_mask = 64'h0000000000000A0A;
defparam fp_functions_0_aadd_2_a161.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a161_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a7.extended_lut = "off";
defparam fp_functions_0_aadd_4_a7.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_4_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[30]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a7.extended_lut = "off";
defparam fp_functions_0_aadd_3_a7.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_3_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[30]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a7.extended_lut = "off";
defparam fp_functions_0_aadd_5_a7.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[27]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a12),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a1_sumout),
	.cout(fp_functions_0_aadd_0_a2),
	.shareout());
defparam fp_functions_0_aadd_0_a1.extended_lut = "off";
defparam fp_functions_0_aadd_0_a1.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a1(
	.dataa(!fp_functions_0_aadd_0_a21_sumout),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_1_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_1_a1.extended_lut = "off";
defparam fp_functions_0_aadd_1_a1.lut_mask = 64'h0000000000005555;
defparam fp_functions_0_aadd_1_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a6(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[28]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a2),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a6_sumout),
	.cout(fp_functions_0_aadd_0_a7),
	.shareout());
defparam fp_functions_0_aadd_0_a6.extended_lut = "off";
defparam fp_functions_0_aadd_0_a6.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_0_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a11(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[26]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a17),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a11_sumout),
	.cout(fp_functions_0_aadd_0_a12),
	.shareout());
defparam fp_functions_0_aadd_0_a11.extended_lut = "off";
defparam fp_functions_0_aadd_0_a11.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a16(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[25]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a16_sumout),
	.cout(fp_functions_0_aadd_0_a17),
	.shareout());
defparam fp_functions_0_aadd_0_a16.extended_lut = "off";
defparam fp_functions_0_aadd_0_a16.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a156_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a12.extended_lut = "off";
defparam fp_functions_0_aadd_4_a12.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_4_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[29]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a12.extended_lut = "off";
defparam fp_functions_0_aadd_3_a12.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[29]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a12.extended_lut = "off";
defparam fp_functions_0_aadd_5_a12.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_5_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a21(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a21_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_0_a21.extended_lut = "off";
defparam fp_functions_0_aadd_0_a21.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_0_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a7(
	.dataa(!fp_functions_0_aadd_0_a21_sumout),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a7.extended_lut = "off";
defparam fp_functions_0_aadd_1_a7.lut_mask = 64'h000000005555AAAA;
defparam fp_functions_0_aadd_1_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a27.extended_lut = "off";
defparam fp_functions_0_aadd_0_a27.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_0_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a151_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a17.extended_lut = "off";
defparam fp_functions_0_aadd_4_a17.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[28]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a17.extended_lut = "off";
defparam fp_functions_0_aadd_3_a17.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[28]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a17.extended_lut = "off";
defparam fp_functions_0_aadd_5_a17.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_5_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a31(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a42),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a31_sumout),
	.cout(fp_functions_0_aadd_0_a32),
	.shareout());
defparam fp_functions_0_aadd_0_a31.extended_lut = "off";
defparam fp_functions_0_aadd_0_a31.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_0_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a31_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a12.extended_lut = "off";
defparam fp_functions_0_aadd_1_a12.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a37.extended_lut = "off";
defparam fp_functions_0_aadd_0_a37.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_0_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a146_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a22.extended_lut = "off";
defparam fp_functions_0_aadd_4_a22.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[27]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a22.extended_lut = "off";
defparam fp_functions_0_aadd_3_a22.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[27]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a22.extended_lut = "off";
defparam fp_functions_0_aadd_5_a22.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a41(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[30]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a41_sumout),
	.cout(fp_functions_0_aadd_0_a42),
	.shareout());
defparam fp_functions_0_aadd_0_a41.extended_lut = "off";
defparam fp_functions_0_aadd_0_a41.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a41_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a17.extended_lut = "off";
defparam fp_functions_0_aadd_1_a17.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a47.extended_lut = "off";
defparam fp_functions_0_aadd_0_a47.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_0_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a141_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a27.extended_lut = "off";
defparam fp_functions_0_aadd_4_a27.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[26]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a27.extended_lut = "off";
defparam fp_functions_0_aadd_3_a27.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[26]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a27.extended_lut = "off";
defparam fp_functions_0_aadd_5_a27.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a51(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[29]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a7),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a51_sumout),
	.cout(fp_functions_0_aadd_0_a52),
	.shareout());
defparam fp_functions_0_aadd_0_a51.extended_lut = "off";
defparam fp_functions_0_aadd_0_a51.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_0_a51.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a51_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a22.extended_lut = "off";
defparam fp_functions_0_aadd_1_a22.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a136_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a32.extended_lut = "off";
defparam fp_functions_0_aadd_4_a32.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[25]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a32.extended_lut = "off";
defparam fp_functions_0_aadd_3_a32.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[25]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a32.extended_lut = "off";
defparam fp_functions_0_aadd_5_a32.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a6_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a27.extended_lut = "off";
defparam fp_functions_0_aadd_1_a27.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_1_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a131_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a37.extended_lut = "off";
defparam fp_functions_0_aadd_4_a37.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a37.extended_lut = "off";
defparam fp_functions_0_aadd_3_a37.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_3_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a37.extended_lut = "off";
defparam fp_functions_0_aadd_5_a37.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a32.extended_lut = "off";
defparam fp_functions_0_aadd_1_a32.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a126_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a42.extended_lut = "off";
defparam fp_functions_0_aadd_4_a42.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[23]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a42.extended_lut = "off";
defparam fp_functions_0_aadd_3_a42.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[23]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a42.extended_lut = "off";
defparam fp_functions_0_aadd_5_a42.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_5_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a37.extended_lut = "off";
defparam fp_functions_0_aadd_1_a37.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a121_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a52_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a47.extended_lut = "off";
defparam fp_functions_0_aadd_4_a47.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a47.extended_lut = "off";
defparam fp_functions_0_aadd_3_a47.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_3_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a47.extended_lut = "off";
defparam fp_functions_0_aadd_5_a47.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_5_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a16_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a42.extended_lut = "off";
defparam fp_functions_0_aadd_1_a42.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a52(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a116_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a57_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a52_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a52.extended_lut = "off";
defparam fp_functions_0_aadd_4_a52.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a52.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a52_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a47.extended_lut = "off";
defparam fp_functions_0_aadd_1_a47.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a57(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a111_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a62_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a57_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a57.extended_lut = "off";
defparam fp_functions_0_aadd_4_a57.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a57.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a52(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[23]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a57_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a52_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a52.extended_lut = "off";
defparam fp_functions_0_aadd_1_a52.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_1_a52.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a62(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a106_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a67_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a62_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a62.extended_lut = "off";
defparam fp_functions_0_aadd_4_a62.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a62.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a57(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a57_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a57.extended_lut = "off";
defparam fp_functions_0_aadd_1_a57.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_1_a57.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a67(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a101_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a72_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a67_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a67.extended_lut = "off";
defparam fp_functions_0_aadd_4_a67.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a67.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a72(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a96_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a77_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a72_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a72.extended_lut = "off";
defparam fp_functions_0_aadd_4_a72.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a72.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a77(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a91_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a82_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a77_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a77.extended_lut = "off";
defparam fp_functions_0_aadd_4_a77.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a77.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a82(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a86_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a87_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a82_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a82.extended_lut = "off";
defparam fp_functions_0_aadd_4_a82.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a82.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a87(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a81_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a92_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a87_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a87.extended_lut = "off";
defparam fp_functions_0_aadd_4_a87.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a87.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a92(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a76_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a97_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a92_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a92.extended_lut = "off";
defparam fp_functions_0_aadd_4_a92.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a92.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a97(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a71_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a102_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a97_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a97.extended_lut = "off";
defparam fp_functions_0_aadd_4_a97.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a97.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a102(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a66_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a107_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a102_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a102.extended_lut = "off";
defparam fp_functions_0_aadd_4_a102.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a102.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a107(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a61_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a112_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a107_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a107.extended_lut = "off";
defparam fp_functions_0_aadd_4_a107.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a107.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a112(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a56_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a117_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a112_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a112.extended_lut = "off";
defparam fp_functions_0_aadd_4_a112.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a112.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a117(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a51_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a122_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a117_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a117.extended_lut = "off";
defparam fp_functions_0_aadd_4_a117.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a117.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a122(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a46_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a127_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a122_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a122.extended_lut = "off";
defparam fp_functions_0_aadd_4_a122.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a122.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a127(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a41_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a132_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a127_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a127.extended_lut = "off";
defparam fp_functions_0_aadd_4_a127.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a127.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a132(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a36_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a137_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a132_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a132.extended_lut = "off";
defparam fp_functions_0_aadd_4_a132.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a132.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a137(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a31_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a142_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a137_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a137.extended_lut = "off";
defparam fp_functions_0_aadd_4_a137.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a137.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a142(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a26_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a147_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a142_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a142.extended_lut = "off";
defparam fp_functions_0_aadd_4_a142.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a142.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a147(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a21_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a152_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a147_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a147.extended_lut = "off";
defparam fp_functions_0_aadd_4_a147.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a147.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a152(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a16_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a157_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a152_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a152.extended_lut = "off";
defparam fp_functions_0_aadd_4_a152.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a152.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a157(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a11_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a162_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a157_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a157.extended_lut = "off";
defparam fp_functions_0_aadd_4_a157.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a157.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a162(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a6_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a167_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a162_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a162.extended_lut = "off";
defparam fp_functions_0_aadd_4_a162.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a162.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a167(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a172_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a167_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a167.extended_lut = "off";
defparam fp_functions_0_aadd_4_a167.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a167.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a172(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a172_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a172.extended_lut = "off";
defparam fp_functions_0_aadd_4_a172.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_4_a172.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a9(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a_aq),
	.datad(!fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aMux_25_a9_cout),
	.shareout());
defparam fp_functions_0_aMux_25_a9.extended_lut = "off";
defparam fp_functions_0_aMux_25_a9.lut_mask = 64'h0000000004150000;
defparam fp_functions_0_aMux_25_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a13(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a20_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a9_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a13_sumout),
	.cout(fp_functions_0_aMux_25_a14),
	.shareout());
defparam fp_functions_0_aMux_25_a13.extended_lut = "off";
defparam fp_functions_0_aMux_25_a13.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a18(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a19_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a14),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a18_sumout),
	.cout(fp_functions_0_aMux_25_a19),
	.shareout());
defparam fp_functions_0_aMux_25_a18.extended_lut = "off";
defparam fp_functions_0_aMux_25_a18.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a23(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a18_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a20_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a19),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a23_sumout),
	.cout(fp_functions_0_aMux_25_a24),
	.shareout());
defparam fp_functions_0_aMux_25_a23.extended_lut = "off";
defparam fp_functions_0_aMux_25_a23.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a28(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a17_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a19_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a24),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a28_sumout),
	.cout(fp_functions_0_aMux_25_a29),
	.shareout());
defparam fp_functions_0_aMux_25_a28.extended_lut = "off";
defparam fp_functions_0_aMux_25_a28.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a28.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a33(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a16_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a18_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a29),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a33_sumout),
	.cout(fp_functions_0_aMux_25_a34),
	.shareout());
defparam fp_functions_0_aMux_25_a33.extended_lut = "off";
defparam fp_functions_0_aMux_25_a33.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a33.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a38(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a15_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a17_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a34),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a38_sumout),
	.cout(fp_functions_0_aMux_25_a39),
	.shareout());
defparam fp_functions_0_aMux_25_a38.extended_lut = "off";
defparam fp_functions_0_aMux_25_a38.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a38.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a43(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a14_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a16_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a39),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a43_sumout),
	.cout(fp_functions_0_aMux_25_a44),
	.shareout());
defparam fp_functions_0_aMux_25_a43.extended_lut = "off";
defparam fp_functions_0_aMux_25_a43.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a43.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a48(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a13_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a15_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a44),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a48_sumout),
	.cout(fp_functions_0_aMux_25_a49),
	.shareout());
defparam fp_functions_0_aMux_25_a48.extended_lut = "off";
defparam fp_functions_0_aMux_25_a48.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a48.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a53(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a12_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a14_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a49),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a53_sumout),
	.cout(fp_functions_0_aMux_25_a54),
	.shareout());
defparam fp_functions_0_aMux_25_a53.extended_lut = "off";
defparam fp_functions_0_aMux_25_a53.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a53.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a58(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a11_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a13_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a54),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a58_sumout),
	.cout(fp_functions_0_aMux_25_a59),
	.shareout());
defparam fp_functions_0_aMux_25_a58.extended_lut = "off";
defparam fp_functions_0_aMux_25_a58.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a58.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a63(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a12_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a59),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a63_sumout),
	.cout(fp_functions_0_aMux_25_a64),
	.shareout());
defparam fp_functions_0_aMux_25_a63.extended_lut = "off";
defparam fp_functions_0_aMux_25_a63.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a63.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a68(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a9_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a11_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a64),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a68_sumout),
	.cout(fp_functions_0_aMux_25_a69),
	.shareout());
defparam fp_functions_0_aMux_25_a68.extended_lut = "off";
defparam fp_functions_0_aMux_25_a68.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a68.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a73(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a8_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a69),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a73_sumout),
	.cout(fp_functions_0_aMux_25_a74),
	.shareout());
defparam fp_functions_0_aMux_25_a73.extended_lut = "off";
defparam fp_functions_0_aMux_25_a73.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a73.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a78(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a7_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a9_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a74),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a78_sumout),
	.cout(fp_functions_0_aMux_25_a79),
	.shareout());
defparam fp_functions_0_aMux_25_a78.extended_lut = "off";
defparam fp_functions_0_aMux_25_a78.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a78.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a83(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a6_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a8_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a79),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a83_sumout),
	.cout(fp_functions_0_aMux_25_a84),
	.shareout());
defparam fp_functions_0_aMux_25_a83.extended_lut = "off";
defparam fp_functions_0_aMux_25_a83.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a83.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a88(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a5_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a7_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a84),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a88_sumout),
	.cout(fp_functions_0_aMux_25_a89),
	.shareout());
defparam fp_functions_0_aMux_25_a88.extended_lut = "off";
defparam fp_functions_0_aMux_25_a88.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a88.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a93(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a6_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a89),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a93_sumout),
	.cout(fp_functions_0_aMux_25_a94),
	.shareout());
defparam fp_functions_0_aMux_25_a93.extended_lut = "off";
defparam fp_functions_0_aMux_25_a93.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a93.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a98(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a94),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a98_sumout),
	.cout(fp_functions_0_aMux_25_a99),
	.shareout());
defparam fp_functions_0_aMux_25_a98.extended_lut = "off";
defparam fp_functions_0_aMux_25_a98.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_aMux_25_a98.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a103(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aMux_25_a99),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aMux_25_a103_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a103.extended_lut = "off";
defparam fp_functions_0_aMux_25_a103.lut_mask = 64'h000000000000082A;
defparam fp_functions_0_aMux_25_a103.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_95_a1(
	.dataa(!fp_functions_0_aMux_61_a1_combout),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datad(!fp_functions_0_aMux_25_a93_sumout),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datag(!fp_functions_0_aMux_25_a3_combout),
	.datah(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_95_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_95_a1.extended_lut = "on";
defparam fp_functions_0_aMux_95_a1.lut_mask = 64'h040404C4040404C4;
defparam fp_functions_0_aMux_95_a1.shared_arith = "off";

fourteennm_ff fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_ai6_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_ai105_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a(
	.clk(clk),
	.d(fp_functions_0_ai1282_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq));
defparam fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a(
	.clk(clk),
	.d(fp_functions_0_ai1540_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a_aq));
defparam fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a_aq),
	.datac(!fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1.lut_mask = 64'h2020202020202020;
defparam fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a1_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a2.extended_lut = "off";
defparam fp_functions_0_aMux_129_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_129_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_128_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a6_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_128_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_128_a2.extended_lut = "off";
defparam fp_functions_0_aMux_128_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_128_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_127_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a11_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_127_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_127_a2.extended_lut = "off";
defparam fp_functions_0_aMux_127_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_127_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_126_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a16_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_126_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_126_a2.extended_lut = "off";
defparam fp_functions_0_aMux_126_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_126_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_125_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a21_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_125_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_125_a2.extended_lut = "off";
defparam fp_functions_0_aMux_125_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_125_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_124_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a26_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_124_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_124_a2.extended_lut = "off";
defparam fp_functions_0_aMux_124_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_124_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_123_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a31_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_123_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_123_a2.extended_lut = "off";
defparam fp_functions_0_aMux_123_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_123_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_122_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a36_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_122_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_122_a2.extended_lut = "off";
defparam fp_functions_0_aMux_122_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_122_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_121_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a41_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_121_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_121_a2.extended_lut = "off";
defparam fp_functions_0_aMux_121_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_121_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_120_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a46_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_120_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_120_a2.extended_lut = "off";
defparam fp_functions_0_aMux_120_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_120_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_119_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a51_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_119_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_119_a2.extended_lut = "off";
defparam fp_functions_0_aMux_119_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_119_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_118_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a56_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_118_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_118_a2.extended_lut = "off";
defparam fp_functions_0_aMux_118_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_118_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_117_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a61_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_117_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_117_a2.extended_lut = "off";
defparam fp_functions_0_aMux_117_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_117_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_116_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a66_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_116_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_116_a2.extended_lut = "off";
defparam fp_functions_0_aMux_116_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_116_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_115_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a71_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_115_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_115_a2.extended_lut = "off";
defparam fp_functions_0_aMux_115_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_115_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_114_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a76_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_114_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_114_a2.extended_lut = "off";
defparam fp_functions_0_aMux_114_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_114_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_113_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a81_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_113_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_113_a2.extended_lut = "off";
defparam fp_functions_0_aMux_113_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_113_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_112_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a86_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_112_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_112_a2.extended_lut = "off";
defparam fp_functions_0_aMux_112_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_112_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_111_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a91_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_111_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_111_a2.extended_lut = "off";
defparam fp_functions_0_aMux_111_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_111_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_110_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a96_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_110_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_110_a2.extended_lut = "off";
defparam fp_functions_0_aMux_110_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_110_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_109_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a101_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_109_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_109_a2.extended_lut = "off";
defparam fp_functions_0_aMux_109_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_109_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_108_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a106_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_108_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_108_a2.extended_lut = "off";
defparam fp_functions_0_aMux_108_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_108_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_107_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a111_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_107_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_107_a2.extended_lut = "off";
defparam fp_functions_0_aMux_107_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_107_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_106_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a116_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_106_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_106_a2.extended_lut = "off";
defparam fp_functions_0_aMux_106_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_106_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_105_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a121_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_105_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_105_a2.extended_lut = "off";
defparam fp_functions_0_aMux_105_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_105_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_104_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a126_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_104_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_104_a2.extended_lut = "off";
defparam fp_functions_0_aMux_104_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_104_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_103_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a131_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_103_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_103_a2.extended_lut = "off";
defparam fp_functions_0_aMux_103_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_103_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_102_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a136_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_102_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_102_a2.extended_lut = "off";
defparam fp_functions_0_aMux_102_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_102_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_101_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a141_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_101_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_101_a2.extended_lut = "off";
defparam fp_functions_0_aMux_101_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_101_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_100_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a146_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_100_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_100_a2.extended_lut = "off";
defparam fp_functions_0_aMux_100_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_100_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_99_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a151_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_99_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_99_a2.extended_lut = "off";
defparam fp_functions_0_aMux_99_a2.lut_mask = 64'h0D000D0F0D0D0D0D;
defparam fp_functions_0_aMux_99_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_98_a2(
	.dataa(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datad(!fp_functions_0_amuxSelConc_uid53_fpToFxPTest_q_a0_a_a1_combout),
	.datae(!fp_functions_0_aadd_2_a156_sumout),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_98_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_98_a2.extended_lut = "off";
defparam fp_functions_0_aMux_98_a2.lut_mask = 64'h0200020F02020202;
defparam fp_functions_0_aMux_98_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0.extended_lut = "off";
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0.lut_mask = 64'h0101010101010101;
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a0(
	.dataa(!a[18]),
	.datab(!a[19]),
	.datac(!a[20]),
	.datad(!a[21]),
	.datae(!a[22]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a1(
	.dataa(!a[12]),
	.datab(!a[13]),
	.datac(!a[14]),
	.datad(!a[15]),
	.datae(!a[16]),
	.dataf(!a[17]),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a1.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_areduce_nor_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a2(
	.dataa(!a[0]),
	.datab(!a[1]),
	.datac(!a[2]),
	.datad(!a[3]),
	.datae(!a[4]),
	.dataf(!a[5]),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a2.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_areduce_nor_0_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a3(
	.dataa(!a[6]),
	.datab(!a[7]),
	.datac(!a[8]),
	.datad(!a[9]),
	.datae(!a[10]),
	.dataf(!a[11]),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a3.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_areduce_nor_0_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1(
	.dataa(!areset),
	.datab(!a[27]),
	.datac(!a[26]),
	.datad(!a[25]),
	.datae(!a[24]),
	.dataf(!a[23]),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1.extended_lut = "off";
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1.lut_mask = 64'h0000000000000002;
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_ai6_a0(
	.dataa(!fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0_combout),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(!fp_functions_0_areduce_nor_0_a2_combout),
	.datae(!fp_functions_0_areduce_nor_0_a3_combout),
	.dataf(!fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_ai6_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_ai6_a0.extended_lut = "off";
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_ai6_a0.lut_mask = 64'h0000000055555554;
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_delay_ai6_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0(
	.dataa(!areset),
	.datab(!en[0]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0.lut_mask = 64'h7777777777777777;
defparam fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai105_a0(
	.dataa(!areset),
	.datab(!a[31]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai105_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai105_a0.extended_lut = "off";
defparam fp_functions_0_ai105_a0.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_ai105_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1282_a0(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_3_a1_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1282_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1282_a0.extended_lut = "off";
defparam fp_functions_0_ai1282_a0.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_ai1282_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1540_a0(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_5_a1_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1540_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1540_a0.extended_lut = "off";
defparam fp_functions_0_ai1540_a0.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_ai1540_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a2(
	.dataa(!fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a0_combout),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(!fp_functions_0_areduce_nor_0_a2_combout),
	.datae(!fp_functions_0_areduce_nor_0_a3_combout),
	.dataf(!fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a2.extended_lut = "off";
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a2.lut_mask = 64'h0000000000000001;
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_ai6_a2.shared_arith = "off";

fourteennm_ff fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_ai945_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq));
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_ai945_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq));
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aMux_92_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_92_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_92_a1.extended_lut = "off";
defparam fp_functions_0_aMux_92_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_aMux_92_a1.shared_arith = "off";

fourteennm_ff fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_ai945_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq));
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_ai945_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq));
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aMux_25_a1(
	.dataa(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a4_a_aq),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_25_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a1.extended_lut = "off";
defparam fp_functions_0_aMux_25_a1.lut_mask = 64'h555533330F0F00FF;
defparam fp_functions_0_aMux_25_a1.shared_arith = "off";

fourteennm_ff fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_ai945_a4_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq));
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_ai945_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq));
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aMux_94_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_94_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_94_a1.extended_lut = "off";
defparam fp_functions_0_aMux_94_a1.lut_mask = 64'hA2A2A2A2A2A2A2A2;
defparam fp_functions_0_aMux_94_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_94_a2(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a_aq),
	.datad(!fp_functions_0_aMux_25_a1_combout),
	.datae(!fp_functions_0_aMux_94_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_94_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_94_a2.extended_lut = "off";
defparam fp_functions_0_aMux_94_a2.lut_mask = 64'h00FF010100FF0101;
defparam fp_functions_0_aMux_94_a2.shared_arith = "off";

fourteennm_ff fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_signX_uid27_fpToFxPTest_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aMux_25_a2(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a_aq),
	.datad(!fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datae(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a_aq),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_25_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a2.extended_lut = "off";
defparam fp_functions_0_aMux_25_a2.lut_mask = 64'h084C2A6E084C2A6E;
defparam fp_functions_0_aMux_25_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a0(
	.dataa(!fp_functions_0_aMux_25_a68_sumout),
	.datab(!fp_functions_0_aMux_25_a28_sumout),
	.datac(!fp_functions_0_aMux_25_a48_sumout),
	.datad(!fp_functions_0_aMux_25_a2_combout),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a0.extended_lut = "off";
defparam fp_functions_0_aMux_61_a0.lut_mask = 64'h555533330F0F00FF;
defparam fp_functions_0_aMux_61_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_94_a3(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datad(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_94_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_94_a3.extended_lut = "off";
defparam fp_functions_0_aMux_94_a3.lut_mask = 64'h1000100010001000;
defparam fp_functions_0_aMux_94_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_94_a4(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datad(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_94_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_94_a4.extended_lut = "off";
defparam fp_functions_0_aMux_94_a4.lut_mask = 64'h6000600060006000;
defparam fp_functions_0_aMux_94_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_94_a5(
	.dataa(!fp_functions_0_aMux_92_a1_combout),
	.datab(!fp_functions_0_aMux_25_a88_sumout),
	.datac(!fp_functions_0_aMux_94_a2_combout),
	.datad(!fp_functions_0_aMux_61_a0_combout),
	.datae(!fp_functions_0_aMux_94_a3_combout),
	.dataf(!fp_functions_0_aMux_94_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_94_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_94_a5.extended_lut = "off";
defparam fp_functions_0_aMux_94_a5.lut_mask = 64'h005533770F5F3F7F;
defparam fp_functions_0_aMux_94_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a1(
	.dataa(!fp_functions_0_aMux_25_a73_sumout),
	.datab(!fp_functions_0_aMux_25_a33_sumout),
	.datac(!fp_functions_0_aMux_25_a53_sumout),
	.datad(!fp_functions_0_aMux_25_a13_sumout),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a1.extended_lut = "off";
defparam fp_functions_0_aMux_61_a1.lut_mask = 64'h555533330F0F00FF;
defparam fp_functions_0_aMux_61_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a3(
	.dataa(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a_aq),
	.datab(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a3_a_aq),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_25_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a3.extended_lut = "off";
defparam fp_functions_0_aMux_25_a3.lut_mask = 64'h555533330F0F00FF;
defparam fp_functions_0_aMux_25_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a4(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_25_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a4.extended_lut = "off";
defparam fp_functions_0_aMux_25_a4.lut_mask = 64'h028A028A028A028A;
defparam fp_functions_0_aMux_25_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a2(
	.dataa(!fp_functions_0_aMux_25_a63_sumout),
	.datab(!fp_functions_0_aMux_25_a23_sumout),
	.datac(!fp_functions_0_aMux_25_a43_sumout),
	.datad(!fp_functions_0_aMux_25_a4_combout),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a2.extended_lut = "off";
defparam fp_functions_0_aMux_61_a2.lut_mask = 64'h555533330F0F00FF;
defparam fp_functions_0_aMux_61_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a5(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_25_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a5.extended_lut = "off";
defparam fp_functions_0_aMux_25_a5.lut_mask = 64'h0145014501450145;
defparam fp_functions_0_aMux_25_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_93_a1(
	.dataa(!fp_functions_0_aMux_92_a1_combout),
	.datab(!fp_functions_0_aMux_61_a2_combout),
	.datac(!fp_functions_0_aMux_25_a103_sumout),
	.datad(!fp_functions_0_aMux_94_a1_combout),
	.datae(!fp_functions_0_aMux_94_a4_combout),
	.dataf(!fp_functions_0_aMux_93_a2_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_93_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_93_a1.extended_lut = "off";
defparam fp_functions_0_aMux_93_a1.lut_mask = 64'h11111F11FFFFFFFF;
defparam fp_functions_0_aMux_93_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_0_a0(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_0_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_0_a0.extended_lut = "off";
defparam fp_functions_0_aMux_0_a0.lut_mask = 64'h0808080808080808;
defparam fp_functions_0_aMux_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a3(
	.dataa(!fp_functions_0_aMux_25_a58_sumout),
	.datab(!fp_functions_0_aMux_25_a18_sumout),
	.datac(!fp_functions_0_aMux_25_a38_sumout),
	.datad(!fp_functions_0_aMux_0_a0_combout),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a3.extended_lut = "off";
defparam fp_functions_0_aMux_61_a3.lut_mask = 64'h555533330F0F00FF;
defparam fp_functions_0_aMux_61_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a6(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a1_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a2_a_aq),
	.datae(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a_aq),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_25_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a6.extended_lut = "off";
defparam fp_functions_0_aMux_25_a6.lut_mask = 64'h0415263704152637;
defparam fp_functions_0_aMux_25_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_92_a2(
	.dataa(!fp_functions_0_aMux_25_a98_sumout),
	.datab(!fp_functions_0_aMux_94_a1_combout),
	.datac(!fp_functions_0_aMux_25_a6_combout),
	.datad(!fp_functions_0_aMux_94_a4_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_92_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_92_a2.extended_lut = "off";
defparam fp_functions_0_aMux_92_a2.lut_mask = 64'h0047004700470047;
defparam fp_functions_0_aMux_92_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_92_a3(
	.dataa(!fp_functions_0_aMux_92_a1_combout),
	.datab(!fp_functions_0_aMux_25_a78_sumout),
	.datac(!fp_functions_0_aMux_61_a3_combout),
	.datad(!fp_functions_0_aMux_94_a3_combout),
	.datae(!fp_functions_0_aMux_92_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_92_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_92_a3.extended_lut = "off";
defparam fp_functions_0_aMux_92_a3.lut_mask = 64'h0537FFFF0537FFFF;
defparam fp_functions_0_aMux_92_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a4(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a33_sumout),
	.datad(!fp_functions_0_aMux_25_a53_sumout),
	.datae(!fp_functions_0_aMux_25_a13_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a4.extended_lut = "off";
defparam fp_functions_0_aMux_61_a4.lut_mask = 64'h028A46CE028A46CE;
defparam fp_functions_0_aMux_61_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_91_a1(
	.dataa(!fp_functions_0_aMux_25_a93_sumout),
	.datab(!fp_functions_0_aMux_25_a3_combout),
	.datac(!fp_functions_0_aMux_94_a1_combout),
	.datad(!fp_functions_0_aMux_94_a4_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_91_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_91_a1.extended_lut = "off";
defparam fp_functions_0_aMux_91_a1.lut_mask = 64'h0053005300530053;
defparam fp_functions_0_aMux_91_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_91_a2(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datac(!fp_functions_0_aMux_25_a73_sumout),
	.datad(!fp_functions_0_aMux_61_a4_combout),
	.datae(!fp_functions_0_aMux_94_a3_combout),
	.dataf(!fp_functions_0_aMux_91_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_91_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_91_a2.extended_lut = "off";
defparam fp_functions_0_aMux_91_a2.lut_mask = 64'h00440F4FFFFFFFFF;
defparam fp_functions_0_aMux_91_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_90_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datad(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_90_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_90_a1.extended_lut = "off";
defparam fp_functions_0_aMux_90_a1.lut_mask = 64'h2F002F002F002F00;
defparam fp_functions_0_aMux_90_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_90_a2(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datad(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_90_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_90_a2.extended_lut = "off";
defparam fp_functions_0_aMux_90_a2.lut_mask = 64'hDF00DF00DF00DF00;
defparam fp_functions_0_aMux_90_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_90_a3(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a0_a_aq),
	.datae(!fp_functions_0_aMux_25_a88_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_90_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_90_a3.extended_lut = "off";
defparam fp_functions_0_aMux_90_a3.lut_mask = 64'h00100F1F00100F1F;
defparam fp_functions_0_aMux_90_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a5(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a28_sumout),
	.datad(!fp_functions_0_aMux_25_a48_sumout),
	.datae(!fp_functions_0_aMux_25_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a5.extended_lut = "off";
defparam fp_functions_0_aMux_61_a5.lut_mask = 64'h028A46CE028A46CE;
defparam fp_functions_0_aMux_61_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_90_a4(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datab(!fp_functions_0_aMux_25_a68_sumout),
	.datac(!fp_functions_0_aMux_25_a1_combout),
	.datad(!fp_functions_0_aMux_90_a1_combout),
	.datae(!fp_functions_0_aMux_90_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_90_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_90_a4.extended_lut = "off";
defparam fp_functions_0_aMux_90_a4.lut_mask = 64'h000F1100000F1100;
defparam fp_functions_0_aMux_90_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_90_a5(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datab(!fp_functions_0_aMux_90_a1_combout),
	.datac(!fp_functions_0_aMux_90_a2_combout),
	.datad(!fp_functions_0_aMux_90_a3_combout),
	.datae(!fp_functions_0_aMux_61_a5_combout),
	.dataf(!fp_functions_0_aMux_90_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_90_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_90_a5.extended_lut = "off";
defparam fp_functions_0_aMux_90_a5.lut_mask = 64'h0008030BFFFFFFFF;
defparam fp_functions_0_aMux_90_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a6(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a23_sumout),
	.datad(!fp_functions_0_aMux_25_a43_sumout),
	.datae(!fp_functions_0_aMux_25_a4_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a6.extended_lut = "off";
defparam fp_functions_0_aMux_61_a6.lut_mask = 64'h028A46CE028A46CE;
defparam fp_functions_0_aMux_61_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_90_a6(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datad(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_90_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_90_a6.extended_lut = "off";
defparam fp_functions_0_aMux_90_a6.lut_mask = 64'hD000D000D000D000;
defparam fp_functions_0_aMux_90_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_89_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a83_sumout),
	.datad(!fp_functions_0_aMux_25_a5_combout),
	.datae(!fp_functions_0_aMux_90_a6_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_89_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_89_a1.extended_lut = "off";
defparam fp_functions_0_aMux_89_a1.lut_mask = 64'h0000048C0000048C;
defparam fp_functions_0_aMux_89_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_89_a2(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datab(!fp_functions_0_aMux_25_a63_sumout),
	.datac(!fp_functions_0_aMux_25_a103_sumout),
	.datad(!fp_functions_0_aMux_90_a1_combout),
	.datae(!fp_functions_0_aMux_90_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_89_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_89_a2.extended_lut = "off";
defparam fp_functions_0_aMux_89_a2.lut_mask = 64'h000F1100000F1100;
defparam fp_functions_0_aMux_89_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_89_a3(
	.dataa(!fp_functions_0_aMux_90_a1_combout),
	.datab(!fp_functions_0_aMux_90_a2_combout),
	.datac(!fp_functions_0_aMux_61_a6_combout),
	.datad(!fp_functions_0_aMux_89_a1_combout),
	.datae(!fp_functions_0_aMux_89_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_89_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_89_a3.extended_lut = "off";
defparam fp_functions_0_aMux_89_a3.lut_mask = 64'h01FFFFFF01FFFFFF;
defparam fp_functions_0_aMux_89_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a7(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a18_sumout),
	.datad(!fp_functions_0_aMux_25_a38_sumout),
	.datae(!fp_functions_0_aMux_0_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a7.extended_lut = "off";
defparam fp_functions_0_aMux_61_a7.lut_mask = 64'h028A46CE028A46CE;
defparam fp_functions_0_aMux_61_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_88_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datab(!fp_functions_0_aMux_25_a58_sumout),
	.datac(!fp_functions_0_aMux_25_a98_sumout),
	.datad(!fp_functions_0_aMux_90_a1_combout),
	.datae(!fp_functions_0_aMux_90_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_88_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_88_a1.extended_lut = "off";
defparam fp_functions_0_aMux_88_a1.lut_mask = 64'h000F1100000F1100;
defparam fp_functions_0_aMux_88_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_88_a2(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a78_sumout),
	.datad(!fp_functions_0_aMux_90_a6_combout),
	.datae(!fp_functions_0_aMux_25_a6_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_88_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_88_a2.extended_lut = "off";
defparam fp_functions_0_aMux_88_a2.lut_mask = 64'h0004008C0004008C;
defparam fp_functions_0_aMux_88_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_88_a3(
	.dataa(!fp_functions_0_aMux_90_a1_combout),
	.datab(!fp_functions_0_aMux_90_a2_combout),
	.datac(!fp_functions_0_aMux_61_a7_combout),
	.datad(!fp_functions_0_aMux_88_a1_combout),
	.datae(!fp_functions_0_aMux_88_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_88_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_88_a3.extended_lut = "off";
defparam fp_functions_0_aMux_88_a3.lut_mask = 64'h01FFFFFF01FFFFFF;
defparam fp_functions_0_aMux_88_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a8(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a33_sumout),
	.datad(!fp_functions_0_aMux_25_a13_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a8.extended_lut = "off";
defparam fp_functions_0_aMux_61_a8.lut_mask = 64'h082A082A082A082A;
defparam fp_functions_0_aMux_61_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_87_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a73_sumout),
	.datad(!fp_functions_0_aMux_25_a53_sumout),
	.datae(!fp_functions_0_aMux_25_a3_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_87_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_87_a1.extended_lut = "off";
defparam fp_functions_0_aMux_87_a1.lut_mask = 64'h04378CBF04378CBF;
defparam fp_functions_0_aMux_87_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_87_a2(
	.dataa(!fp_functions_0_aMux_25_a93_sumout),
	.datab(!fp_functions_0_aMux_61_a8_combout),
	.datac(!fp_functions_0_aMux_90_a1_combout),
	.datad(!fp_functions_0_aMux_90_a2_combout),
	.datae(!fp_functions_0_aMux_87_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_87_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_87_a2.extended_lut = "off";
defparam fp_functions_0_aMux_87_a2.lut_mask = 64'h050305F3050305F3;
defparam fp_functions_0_aMux_87_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_86_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a68_sumout),
	.datad(!fp_functions_0_aMux_25_a48_sumout),
	.datae(!fp_functions_0_aMux_25_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_86_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_86_a1.extended_lut = "off";
defparam fp_functions_0_aMux_86_a1.lut_mask = 64'h04378CBF04378CBF;
defparam fp_functions_0_aMux_86_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a9(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a28_sumout),
	.datad(!fp_functions_0_aMux_25_a2_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a9.extended_lut = "off";
defparam fp_functions_0_aMux_61_a9.lut_mask = 64'h082A082A082A082A;
defparam fp_functions_0_aMux_61_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_86_a2(
	.dataa(!fp_functions_0_aMux_25_a88_sumout),
	.datab(!fp_functions_0_aMux_90_a1_combout),
	.datac(!fp_functions_0_aMux_90_a2_combout),
	.datad(!fp_functions_0_aMux_86_a1_combout),
	.datae(!fp_functions_0_aMux_61_a9_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_86_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_86_a2.extended_lut = "off";
defparam fp_functions_0_aMux_86_a2.lut_mask = 64'h101C131F101C131F;
defparam fp_functions_0_aMux_86_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_85_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a43_sumout),
	.datad(!fp_functions_0_aMux_25_a63_sumout),
	.datae(!fp_functions_0_aMux_25_a103_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_85_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_85_a1.extended_lut = "off";
defparam fp_functions_0_aMux_85_a1.lut_mask = 64'h03478BCF03478BCF;
defparam fp_functions_0_aMux_85_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a10(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a23_sumout),
	.datad(!fp_functions_0_aMux_25_a4_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a10.extended_lut = "off";
defparam fp_functions_0_aMux_61_a10.lut_mask = 64'h082A082A082A082A;
defparam fp_functions_0_aMux_61_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_85_a2(
	.dataa(!fp_functions_0_aMux_25_a83_sumout),
	.datab(!fp_functions_0_aMux_90_a1_combout),
	.datac(!fp_functions_0_aMux_90_a2_combout),
	.datad(!fp_functions_0_aMux_85_a1_combout),
	.datae(!fp_functions_0_aMux_61_a10_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_85_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_85_a2.extended_lut = "off";
defparam fp_functions_0_aMux_85_a2.lut_mask = 64'h101C131F101C131F;
defparam fp_functions_0_aMux_85_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_36_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a18_sumout),
	.datad(!fp_functions_0_aMux_0_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_36_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_36_a1.extended_lut = "off";
defparam fp_functions_0_aMux_36_a1.lut_mask = 64'h082A082A082A082A;
defparam fp_functions_0_aMux_36_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_84_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a38_sumout),
	.datad(!fp_functions_0_aMux_25_a58_sumout),
	.datae(!fp_functions_0_aMux_25_a98_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_84_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_84_a1.extended_lut = "off";
defparam fp_functions_0_aMux_84_a1.lut_mask = 64'h03478BCF03478BCF;
defparam fp_functions_0_aMux_84_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_84_a2(
	.dataa(!fp_functions_0_aMux_25_a78_sumout),
	.datab(!fp_functions_0_aMux_90_a1_combout),
	.datac(!fp_functions_0_aMux_90_a2_combout),
	.datad(!fp_functions_0_aMux_36_a1_combout),
	.datae(!fp_functions_0_aMux_84_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_84_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_84_a2.extended_lut = "off";
defparam fp_functions_0_aMux_84_a2.lut_mask = 64'h10131C1F10131C1F;
defparam fp_functions_0_aMux_84_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_61_a11(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_61_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_61_a11.extended_lut = "off";
defparam fp_functions_0_aMux_61_a11.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_aMux_61_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_35_a0(
	.dataa(!fp_functions_0_aMux_61_a11_combout),
	.datab(!fp_functions_0_aMux_25_a13_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_35_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_35_a0.extended_lut = "off";
defparam fp_functions_0_aMux_35_a0.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_aMux_35_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_83_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a33_sumout),
	.datad(!fp_functions_0_aMux_25_a53_sumout),
	.datae(!fp_functions_0_aMux_25_a93_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_83_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_83_a1.extended_lut = "off";
defparam fp_functions_0_aMux_83_a1.lut_mask = 64'h03478BCF03478BCF;
defparam fp_functions_0_aMux_83_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_83_a2(
	.dataa(!fp_functions_0_aMux_25_a73_sumout),
	.datab(!fp_functions_0_aMux_35_a0_combout),
	.datac(!fp_functions_0_aMux_90_a1_combout),
	.datad(!fp_functions_0_aMux_90_a2_combout),
	.datae(!fp_functions_0_aMux_83_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_83_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_83_a2.extended_lut = "off";
defparam fp_functions_0_aMux_83_a2.lut_mask = 64'h050305F3050305F3;
defparam fp_functions_0_aMux_83_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_34_a0(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a21_a_aq),
	.datad(!fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datae(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a_aq),
	.dataf(!fp_functions_0_aMux_61_a11_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_34_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_34_a0.extended_lut = "off";
defparam fp_functions_0_aMux_34_a0.lut_mask = 64'h00000000084C2A6E;
defparam fp_functions_0_aMux_34_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_82_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a28_sumout),
	.datad(!fp_functions_0_aMux_25_a48_sumout),
	.datae(!fp_functions_0_aMux_25_a88_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_82_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_82_a1.extended_lut = "off";
defparam fp_functions_0_aMux_82_a1.lut_mask = 64'h03478BCF03478BCF;
defparam fp_functions_0_aMux_82_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_82_a2(
	.dataa(!fp_functions_0_aMux_25_a68_sumout),
	.datab(!fp_functions_0_aMux_90_a1_combout),
	.datac(!fp_functions_0_aMux_90_a2_combout),
	.datad(!fp_functions_0_aMux_34_a0_combout),
	.datae(!fp_functions_0_aMux_82_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_82_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_82_a2.extended_lut = "off";
defparam fp_functions_0_aMux_82_a2.lut_mask = 64'h10131C1F10131C1F;
defparam fp_functions_0_aMux_82_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_33_a0(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a22_a_aq),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.dataf(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_33_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_33_a0.extended_lut = "off";
defparam fp_functions_0_aMux_33_a0.lut_mask = 64'h028A000000000000;
defparam fp_functions_0_aMux_33_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_81_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a23_sumout),
	.datad(!fp_functions_0_aMux_25_a43_sumout),
	.datae(!fp_functions_0_aMux_25_a83_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_81_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_81_a1.extended_lut = "off";
defparam fp_functions_0_aMux_81_a1.lut_mask = 64'h03478BCF03478BCF;
defparam fp_functions_0_aMux_81_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_81_a2(
	.dataa(!fp_functions_0_aMux_25_a63_sumout),
	.datab(!fp_functions_0_aMux_90_a1_combout),
	.datac(!fp_functions_0_aMux_90_a2_combout),
	.datad(!fp_functions_0_aMux_33_a0_combout),
	.datae(!fp_functions_0_aMux_81_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_81_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_81_a2.extended_lut = "off";
defparam fp_functions_0_aMux_81_a2.lut_mask = 64'h10131C1F10131C1F;
defparam fp_functions_0_aMux_81_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_32_a0(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datae(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_32_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_32_a0.extended_lut = "off";
defparam fp_functions_0_aMux_32_a0.lut_mask = 64'h0800000008000000;
defparam fp_functions_0_aMux_32_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_80_a1(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a3_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a2_a_aq),
	.datac(!fp_functions_0_aMux_25_a18_sumout),
	.datad(!fp_functions_0_aMux_25_a38_sumout),
	.datae(!fp_functions_0_aMux_25_a78_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_80_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_80_a1.extended_lut = "off";
defparam fp_functions_0_aMux_80_a1.lut_mask = 64'h03478BCF03478BCF;
defparam fp_functions_0_aMux_80_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_80_a2(
	.dataa(!fp_functions_0_aMux_25_a58_sumout),
	.datab(!fp_functions_0_aMux_32_a0_combout),
	.datac(!fp_functions_0_aMux_90_a1_combout),
	.datad(!fp_functions_0_aMux_90_a2_combout),
	.datae(!fp_functions_0_aMux_80_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_80_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_80_a2.extended_lut = "off";
defparam fp_functions_0_aMux_80_a2.lut_mask = 64'h050305F3050305F3;
defparam fp_functions_0_aMux_80_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_64_a0(
	.dataa(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a4_a_aq),
	.datab(!fp_functions_0_ashiftVal_uid39_fpToFxPTest_q_a5_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_64_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_64_a0.extended_lut = "off";
defparam fp_functions_0_aMux_64_a0.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_aMux_64_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai945_a0(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_0_a1_sumout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai945_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai945_a0.extended_lut = "off";
defparam fp_functions_0_ai945_a0.lut_mask = 64'h2020202020202020;
defparam fp_functions_0_ai945_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai945_a1(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai945_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai945_a1.extended_lut = "off";
defparam fp_functions_0_ai945_a1.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_ai945_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_2_a0(
	.dataa(!a[27]),
	.datab(!a[26]),
	.datac(!a[25]),
	.datad(!a[24]),
	.datae(!a[23]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_2_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_2_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_2_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_2_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0(
	.dataa(!areset),
	.datab(!a[30]),
	.datac(!a[29]),
	.datad(!a[28]),
	.datae(!fp_functions_0_areduce_nor_2_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0.extended_lut = "off";
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0.lut_mask = 64'h5555D5555555D555;
defparam fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai945_a2(
	.dataa(!areset),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai945_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai945_a2.extended_lut = "off";
defparam fp_functions_0_ai945_a2.lut_mask = 64'h2020202020202020;
defparam fp_functions_0_ai945_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai945_a3(
	.dataa(!areset),
	.datab(!a[23]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai945_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai945_a3.extended_lut = "off";
defparam fp_functions_0_ai945_a3.lut_mask = 64'h8080808080808080;
defparam fp_functions_0_ai945_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai945_a4(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_0_a11_sumout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai945_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai945_a4.extended_lut = "off";
defparam fp_functions_0_ai945_a4.lut_mask = 64'h2020202020202020;
defparam fp_functions_0_ai945_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai945_a5(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_0_a16_sumout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai945_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai945_a5.extended_lut = "off";
defparam fp_functions_0_ai945_a5.lut_mask = 64'h2020202020202020;
defparam fp_functions_0_ai945_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_93_a2(
	.dataa(!fp_functions_0_aMux_25_a83_sumout),
	.datab(!fp_functions_0_aMux_94_a3_combout),
	.datac(!fp_functions_0_aMux_94_a1_combout),
	.datad(!fp_functions_0_aMux_25_a5_combout),
	.datae(!fp_functions_0_aMux_94_a4_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_93_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_93_a2.extended_lut = "off";
defparam fp_functions_0_aMux_93_a2.lut_mask = 64'h1111111F1111111F;
defparam fp_functions_0_aMux_93_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_a0(
	.dataa(!fp_functions_0_afracPostZ_uid23_fpToFxPTest_q_a10_a_a0_combout),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_a0.lut_mask = 64'hAAAAAAAAAAAAAAAA;
defparam fp_functions_0_ainvExcXZ_uid24_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_a0.shared_arith = "off";

assign q[29] = fp_functions_0_aMux_100_a2_combout;

assign q[28] = fp_functions_0_aMux_101_a2_combout;

assign q[27] = fp_functions_0_aMux_102_a2_combout;

assign q[26] = fp_functions_0_aMux_103_a2_combout;

assign q[25] = fp_functions_0_aMux_104_a2_combout;

assign q[24] = fp_functions_0_aMux_105_a2_combout;

assign q[23] = fp_functions_0_aMux_106_a2_combout;

assign q[22] = fp_functions_0_aMux_107_a2_combout;

assign q[21] = fp_functions_0_aMux_108_a2_combout;

assign q[20] = fp_functions_0_aMux_109_a2_combout;

assign q[19] = fp_functions_0_aMux_110_a2_combout;

assign q[18] = fp_functions_0_aMux_111_a2_combout;

assign q[17] = fp_functions_0_aMux_112_a2_combout;

assign q[16] = fp_functions_0_aMux_113_a2_combout;

assign q[15] = fp_functions_0_aMux_114_a2_combout;

assign q[14] = fp_functions_0_aMux_115_a2_combout;

assign q[13] = fp_functions_0_aMux_116_a2_combout;

assign q[12] = fp_functions_0_aMux_117_a2_combout;

assign q[11] = fp_functions_0_aMux_118_a2_combout;

assign q[10] = fp_functions_0_aMux_119_a2_combout;

assign q[9] = fp_functions_0_aMux_120_a2_combout;

assign q[8] = fp_functions_0_aMux_121_a2_combout;

assign q[7] = fp_functions_0_aMux_122_a2_combout;

assign q[6] = fp_functions_0_aMux_123_a2_combout;

assign q[5] = fp_functions_0_aMux_124_a2_combout;

assign q[4] = fp_functions_0_aMux_125_a2_combout;

assign q[3] = fp_functions_0_aMux_126_a2_combout;

assign q[2] = fp_functions_0_aMux_127_a2_combout;

assign q[1] = fp_functions_0_aMux_128_a2_combout;

assign q[0] = fp_functions_0_aMux_129_a2_combout;

assign q[31] = fp_functions_0_aMux_98_a2_combout;

assign q[30] = fp_functions_0_aMux_99_a2_combout;

endmodule
