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

// DATE "04/25/2021 10:04:27"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module Float_Less (
	q,
	clk,
	areset,
	b,
	a)/* synthesis synthesis_greybox=0 */;
output 	[0:0] q;
input 	clk;
input 	areset;
input 	[31:0] b;
input 	[31:0] a;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire fp_functions_0_aredist3_oneIsNaN_uid34_fpCompareTest_q_2_q_a0_a_aq;
wire fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aredist0_rc2_uid63_fpCompareTest_q_2_q_a0_a_aq;
wire fp_functions_0_aoneIsNaN_uid34_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aredist1_signY_uid53_fpCompareTest_b_1_q_a0_a_aq;
wire fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq;
wire fp_functions_0_aadd_0_a1_sumout;
wire fp_functions_0_arc2_uid63_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aadd_0_a7_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a7_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a7_a_aq;
wire fp_functions_0_aadd_0_a12_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a6_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a6_a_aq;
wire fp_functions_0_aadd_0_a17_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a5_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a5_a_aq;
wire fp_functions_0_aadd_0_a22_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a4_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a4_a_aq;
wire fp_functions_0_aadd_0_a27_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a3_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a3_a_aq;
wire fp_functions_0_aadd_0_a32_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a2_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a2_a_aq;
wire fp_functions_0_aadd_0_a37_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a1_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a1_a_aq;
wire fp_functions_0_aadd_0_a42_cout;
wire fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a0_a_aq;
wire fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a0_a_aq;
wire fp_functions_0_aadd_0_a47_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a22_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a22_a_aq;
wire fp_functions_0_aadd_0_a52_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a21_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a21_a_aq;
wire fp_functions_0_aadd_0_a57_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a20_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a20_a_aq;
wire fp_functions_0_aadd_0_a62_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a19_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a19_a_aq;
wire fp_functions_0_aadd_0_a67_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a18_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a18_a_aq;
wire fp_functions_0_aadd_0_a72_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a17_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a17_a_aq;
wire fp_functions_0_aadd_0_a77_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a16_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a16_a_aq;
wire fp_functions_0_aadd_0_a82_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a15_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a15_a_aq;
wire fp_functions_0_aadd_0_a87_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a14_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a14_a_aq;
wire fp_functions_0_aadd_0_a92_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a13_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a13_a_aq;
wire fp_functions_0_aadd_0_a97_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a12_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a12_a_aq;
wire fp_functions_0_aadd_0_a102_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a11_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a11_a_aq;
wire fp_functions_0_aadd_0_a107_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a10_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a10_a_aq;
wire fp_functions_0_aadd_0_a112_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a9_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a9_a_aq;
wire fp_functions_0_aadd_0_a117_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a8_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a8_a_aq;
wire fp_functions_0_aadd_0_a122_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a7_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a7_a_aq;
wire fp_functions_0_aadd_0_a127_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a6_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a6_a_aq;
wire fp_functions_0_aadd_0_a132_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a5_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a5_a_aq;
wire fp_functions_0_aadd_0_a137_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a4_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a4_a_aq;
wire fp_functions_0_aadd_0_a142_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a3_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a3_a_aq;
wire fp_functions_0_aadd_0_a147_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a2_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a2_a_aq;
wire fp_functions_0_aadd_0_a152_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a1_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a1_a_aq;
wire fp_functions_0_aadd_0_a157_cout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aadd_0_a162_cout;
wire fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0_combout;
wire fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_qi_a0_a_acombout;
wire fp_functions_0_areduce_nor_3_a0_combout;
wire fp_functions_0_areduce_nor_5_a0_combout;
wire fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1_combout;
wire fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2_combout;
wire fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1_combout;
wire fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2_combout;
wire fp_functions_0_areduce_nor_3_a1_combout;
wire fp_functions_0_areduce_nor_3_a2_combout;
wire fp_functions_0_areduce_nor_3_a3_combout;
wire fp_functions_0_areduce_nor_3_a4_combout;
wire fp_functions_0_areduce_nor_5_a1_combout;
wire fp_functions_0_areduce_nor_5_a2_combout;
wire fp_functions_0_areduce_nor_5_a3_combout;
wire fp_functions_0_areduce_nor_5_a4_combout;
wire fp_functions_0_aoneIsNaN_uid34_fpCompareTest_qi_a0_a_acombout;
wire fp_functions_0_areduce_nor_0_a0_combout;
wire fp_functions_0_areduce_nor_1_a0_combout;
wire fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a1_combout;
wire fp_functions_0_areduce_nor_1_a1_combout;
wire fp_functions_0_areduce_nor_0_a1_combout;
wire fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a2_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a0_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a0_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a1_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a1_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a2_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a2_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a3_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a3_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a4_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a4_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a5_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a5_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a6_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a6_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a7_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a7_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a8_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a8_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a9_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a9_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a10_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a10_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a11_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a11_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a12_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a12_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a13_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a13_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a14_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a14_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a15_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a15_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a16_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a16_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a17_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a17_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a18_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a18_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a19_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a19_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a20_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a20_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a21_combout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a21_combout;
wire fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_acombout;
wire fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_acombout;


fourteennm_ff fp_functions_0_aredist3_oneIsNaN_uid34_fpCompareTest_q_2_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aoneIsNaN_uid34_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist3_oneIsNaN_uid34_fpCompareTest_q_2_q_a0_a_aq));
defparam fp_functions_0_aredist3_oneIsNaN_uid34_fpCompareTest_q_2_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist3_oneIsNaN_uid34_fpCompareTest_q_2_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_qi_a0_a_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_rc2_uid63_fpCompareTest_q_2_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_arc2_uid63_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_rc2_uid63_fpCompareTest_q_2_q_a0_a_aq));
defparam fp_functions_0_aredist0_rc2_uid63_fpCompareTest_q_2_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_rc2_uid63_fpCompareTest_q_2_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aoneIsNaN_uid34_fpCompareTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_aoneIsNaN_uid34_fpCompareTest_qi_a0_a_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aoneIsNaN_uid34_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_aoneIsNaN_uid34_fpCompareTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aoneIsNaN_uid34_fpCompareTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_signY_uid53_fpCompareTest_b_1_q_a0_a(
	.clk(clk),
	.d(b[31]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_signY_uid53_fpCompareTest_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist1_signY_uid53_fpCompareTest_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_signY_uid53_fpCompareTest_b_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a(
	.clk(clk),
	.d(a[31]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_0_a1.extended_lut = "off";
defparam fp_functions_0_aadd_0_a1.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_0_a1.shared_arith = "off";

fourteennm_ff fp_functions_0_arc2_uid63_fpCompareTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_arc2_uid63_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_arc2_uid63_fpCompareTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_arc2_uid63_fpCompareTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a7(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a7_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a7_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a7.extended_lut = "off";
defparam fp_functions_0_aadd_0_a7.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a7.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a7_a(
	.clk(clk),
	.d(a[30]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a7_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a7_a(
	.clk(clk),
	.d(b[30]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a7_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a7_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a12(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a6_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a6_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a12.extended_lut = "off";
defparam fp_functions_0_aadd_0_a12.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a12.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a6_a(
	.clk(clk),
	.d(a[29]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a6_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a6_a(
	.clk(clk),
	.d(b[29]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a6_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a6_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a17(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a5_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a17.extended_lut = "off";
defparam fp_functions_0_aadd_0_a17.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a17.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a5_a(
	.clk(clk),
	.d(a[28]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a5_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a5_a(
	.clk(clk),
	.d(b[28]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a5_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a5_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a22(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a4_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a4_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a22.extended_lut = "off";
defparam fp_functions_0_aadd_0_a22.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a22.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a4_a(
	.clk(clk),
	.d(a[27]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a4_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a4_a(
	.clk(clk),
	.d(b[27]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a4_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a4_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a27(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a3_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a3_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a27.extended_lut = "off";
defparam fp_functions_0_aadd_0_a27.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a27.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a3_a(
	.clk(clk),
	.d(a[26]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a3_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a3_a(
	.clk(clk),
	.d(b[26]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a3_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a3_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a32(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a2_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a2_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a32.extended_lut = "off";
defparam fp_functions_0_aadd_0_a32.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a32.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a2_a(
	.clk(clk),
	.d(a[25]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a2_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a2_a(
	.clk(clk),
	.d(b[25]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a2_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a2_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a37(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a1_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a1_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a37.extended_lut = "off";
defparam fp_functions_0_aadd_0_a37.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a37.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a1_a(
	.clk(clk),
	.d(a[24]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a1_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a1_a(
	.clk(clk),
	.d(b[24]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a1_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a1_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a42(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a0_a_aq),
	.datad(!fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a0_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a42.extended_lut = "off";
defparam fp_functions_0_aadd_0_a42.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a42.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a0_a(
	.clk(clk),
	.d(a[23]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_exp_x_uid9_fpCompareTest_b_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a0_a(
	.clk(clk),
	.d(b[23]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_exp_y_uid23_fpCompareTest_b_1_q_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a47(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a22_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a22_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a52_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a47.extended_lut = "off";
defparam fp_functions_0_aadd_0_a47.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a47.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a22_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a22_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a22_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a22_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a22_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a52(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a21_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a21_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a57_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a52_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a52.extended_lut = "off";
defparam fp_functions_0_aadd_0_a52.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a52.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a21_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a21_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a21_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a21_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a21_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a57(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a20_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a20_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a62_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a57_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a57.extended_lut = "off";
defparam fp_functions_0_aadd_0_a57.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a57.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a20_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a20_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a20_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a20_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a20_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a62(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a19_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a19_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a67_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a62_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a62.extended_lut = "off";
defparam fp_functions_0_aadd_0_a62.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a62.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a19_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a19_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a19_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a19_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a19_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a67(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a18_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a18_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a72_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a67_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a67.extended_lut = "off";
defparam fp_functions_0_aadd_0_a67.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a67.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a18_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a4_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a18_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a18_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a4_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a18_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a18_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a72(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a17_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a17_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a77_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a72_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a72.extended_lut = "off";
defparam fp_functions_0_aadd_0_a72.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a72.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a17_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a17_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a17_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a17_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a17_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a77(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a16_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a16_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a82_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a77_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a77.extended_lut = "off";
defparam fp_functions_0_aadd_0_a77.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a77.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a16_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a6_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a16_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a16_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a6_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a16_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a16_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a82(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a15_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a15_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a87_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a82_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a82.extended_lut = "off";
defparam fp_functions_0_aadd_0_a82.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a82.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a15_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a7_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a15_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a15_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a7_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a15_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a15_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a87(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a14_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a14_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a92_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a87_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a87.extended_lut = "off";
defparam fp_functions_0_aadd_0_a87.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a87.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a14_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a8_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a14_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a14_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a8_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a14_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a14_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a92(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a13_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a13_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a97_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a92_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a92.extended_lut = "off";
defparam fp_functions_0_aadd_0_a92.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a92.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a13_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a9_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a13_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a13_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a9_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a13_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a13_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a97(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a12_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a12_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a102_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a97_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a97.extended_lut = "off";
defparam fp_functions_0_aadd_0_a97.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a97.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a12_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a10_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a12_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a12_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a10_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a12_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a12_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a102(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a11_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a11_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a107_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a102_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a102.extended_lut = "off";
defparam fp_functions_0_aadd_0_a102.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a102.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a11_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a11_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a11_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a11_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a11_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a11_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a11_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a107(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a10_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a10_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a112_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a107_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a107.extended_lut = "off";
defparam fp_functions_0_aadd_0_a107.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a107.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a10_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a12_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a10_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a10_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a12_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a10_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a10_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a112(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a9_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a9_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a117_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a112_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a112.extended_lut = "off";
defparam fp_functions_0_aadd_0_a112.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a112.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a9_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a13_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a9_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a9_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a13_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a9_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a9_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a117(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a8_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a8_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a122_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a117_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a117.extended_lut = "off";
defparam fp_functions_0_aadd_0_a117.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a117.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a8_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a14_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a8_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a8_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a14_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a8_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a8_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a122(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a7_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a7_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a127_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a122_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a122.extended_lut = "off";
defparam fp_functions_0_aadd_0_a122.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a122.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a7_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a15_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a7_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a7_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a15_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a7_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a7_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a127(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a6_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a6_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a132_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a127_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a127.extended_lut = "off";
defparam fp_functions_0_aadd_0_a127.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a127.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a6_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a16_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a6_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a6_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a16_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a6_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a6_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a132(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a5_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a137_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a132_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a132.extended_lut = "off";
defparam fp_functions_0_aadd_0_a132.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a132.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a5_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a17_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a5_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a5_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a17_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a5_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a5_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a137(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a4_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a4_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a142_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a137_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a137.extended_lut = "off";
defparam fp_functions_0_aadd_0_a137.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a137.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a4_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a18_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a4_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a4_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a18_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a4_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a4_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a142(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a3_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a3_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a147_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a142_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a142.extended_lut = "off";
defparam fp_functions_0_aadd_0_a142.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a142.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a3_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a19_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a3_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a3_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a19_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a3_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a3_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a147(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a2_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a2_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a152_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a147_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a147.extended_lut = "off";
defparam fp_functions_0_aadd_0_a147.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a147.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a2_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a20_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a2_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a2_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a20_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a2_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a2_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a152(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a1_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a1_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a157_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a152_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a152.extended_lut = "off";
defparam fp_functions_0_aadd_0_a152.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a152.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a1_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a21_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a1_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a1_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a21_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a1_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a1_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a157(
	.dataa(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(!fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a162_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a157_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a157.extended_lut = "off";
defparam fp_functions_0_aadd_0_a157.lut_mask = 64'h000000000A50F00F;
defparam fp_functions_0_aadd_0_a157.shared_arith = "off";

fourteennm_ff fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a162(
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
	.cout(fp_functions_0_aadd_0_a162_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a162.extended_lut = "off";
defparam fp_functions_0_aadd_0_a162.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_0_a162.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0(
	.dataa(!fp_functions_0_aredist3_oneIsNaN_uid34_fpCompareTest_q_2_q_a0_a_aq),
	.datab(!fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aredist0_rc2_uid63_fpCompareTest_q_2_q_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_qi_a0_a(
	.dataa(!fp_functions_0_aredist1_signY_uid53_fpCompareTest_b_1_q_a0_a_aq),
	.datab(!fp_functions_0_aredist2_signX_uid52_fpCompareTest_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_aadd_0_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_qi_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_qi_a0_a.extended_lut = "off";
defparam fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_qi_a0_a.lut_mask = 64'h0909090909090909;
defparam fp_functions_0_asxEQsyExpFracCompMux_uid64_fpCompareTest_qi_a0_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a0(
	.dataa(!b[18]),
	.datab(!b[19]),
	.datac(!b[20]),
	.datad(!b[21]),
	.datae(!b[22]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_3_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a0(
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
	.combout(fp_functions_0_areduce_nor_5_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_5_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1(
	.dataa(!b[23]),
	.datab(!b[24]),
	.datac(!b[25]),
	.datad(!b[26]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2(
	.dataa(!b[27]),
	.datab(!b[28]),
	.datac(!b[29]),
	.datad(!b[30]),
	.datae(!fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2.extended_lut = "off";
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2.lut_mask = 64'h0000000100000001;
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1(
	.dataa(!a[23]),
	.datab(!a[24]),
	.datac(!a[25]),
	.datad(!a[26]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2(
	.dataa(!a[27]),
	.datab(!a[28]),
	.datac(!a[29]),
	.datad(!a[30]),
	.datae(!fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2.extended_lut = "off";
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2.lut_mask = 64'h0000000100000001;
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a1(
	.dataa(!b[12]),
	.datab(!b[13]),
	.datac(!b[14]),
	.datad(!b[15]),
	.datae(!b[16]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a1.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_3_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a2(
	.dataa(!b[0]),
	.datab(!b[1]),
	.datac(!b[2]),
	.datad(!b[3]),
	.datae(!b[4]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a2.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_3_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a3(
	.dataa(!b[6]),
	.datab(!b[7]),
	.datac(!b[8]),
	.datad(!b[9]),
	.datae(!b[10]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a3.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_3_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a4(
	.dataa(!b[5]),
	.datab(!b[11]),
	.datac(!b[17]),
	.datad(!fp_functions_0_areduce_nor_3_a1_combout),
	.datae(!fp_functions_0_areduce_nor_3_a2_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a3_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a4.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a4.lut_mask = 64'h0000000000000080;
defparam fp_functions_0_areduce_nor_3_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a1(
	.dataa(!a[12]),
	.datab(!a[13]),
	.datac(!a[14]),
	.datad(!a[15]),
	.datae(!a[16]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a1.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_5_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a2(
	.dataa(!a[0]),
	.datab(!a[1]),
	.datac(!a[2]),
	.datad(!a[3]),
	.datae(!a[4]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a2.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_5_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a3(
	.dataa(!a[6]),
	.datab(!a[7]),
	.datac(!a[8]),
	.datad(!a[9]),
	.datae(!a[10]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a3.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_5_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a4(
	.dataa(!a[5]),
	.datab(!a[11]),
	.datac(!a[17]),
	.datad(!fp_functions_0_areduce_nor_5_a1_combout),
	.datae(!fp_functions_0_areduce_nor_5_a2_combout),
	.dataf(!fp_functions_0_areduce_nor_5_a3_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a4.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a4.lut_mask = 64'h0000000000000080;
defparam fp_functions_0_areduce_nor_5_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoneIsNaN_uid34_fpCompareTest_qi_a0_a(
	.dataa(!fp_functions_0_areduce_nor_3_a0_combout),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2_combout),
	.datad(!fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2_combout),
	.datae(!fp_functions_0_areduce_nor_3_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_5_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoneIsNaN_uid34_fpCompareTest_qi_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoneIsNaN_uid34_fpCompareTest_qi_a0_a.extended_lut = "off";
defparam fp_functions_0_aoneIsNaN_uid34_fpCompareTest_qi_a0_a.lut_mask = 64'h0FFF0AFF0FCF0ACE;
defparam fp_functions_0_aoneIsNaN_uid34_fpCompareTest_qi_a0_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a0(
	.dataa(!b[29]),
	.datab(!b[30]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
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
defparam fp_functions_0_areduce_nor_0_a0.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_areduce_nor_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1_a0(
	.dataa(!a[29]),
	.datab(!a[30]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_1_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_1_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_1_a0.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_areduce_nor_1_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a1(
	.dataa(!b[31]),
	.datab(!a[31]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a1.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1_a1(
	.dataa(!a[23]),
	.datab(!a[24]),
	.datac(!a[25]),
	.datad(!a[26]),
	.datae(!a[27]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_1_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_1_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_1_a1.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_1_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a1(
	.dataa(!b[23]),
	.datab(!b[24]),
	.datac(!b[25]),
	.datad(!b[26]),
	.datae(!b[27]),
	.dataf(!b[28]),
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

fourteennm_lcell_comb fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a2(
	.dataa(!a[28]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a1_combout),
	.datae(!fp_functions_0_areduce_nor_1_a1_combout),
	.dataf(!fp_functions_0_areduce_nor_0_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a2.extended_lut = "off";
defparam fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a2.lut_mask = 64'h00FF00FF00FF00FD;
defparam fp_functions_0_arc2_uid63_fpCompareTest_qi_a0_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a0(
	.dataa(!a[28]),
	.datab(!a[22]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a0.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a0(
	.dataa(!b[22]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a0.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a1(
	.dataa(!a[28]),
	.datab(!a[21]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a1.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a1(
	.dataa(!b[21]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a1.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a2(
	.dataa(!a[28]),
	.datab(!a[20]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a2.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a2.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a2(
	.dataa(!b[20]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a2.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a2.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a3(
	.dataa(!a[28]),
	.datab(!a[19]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a3.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a3.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a3(
	.dataa(!b[19]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a3.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a3.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a4(
	.dataa(!a[28]),
	.datab(!a[18]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a4.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a4.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a4(
	.dataa(!b[18]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a4.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a4.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a5(
	.dataa(!a[28]),
	.datab(!a[17]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a5.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a5.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a5(
	.dataa(!b[17]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a5.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a5.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a6(
	.dataa(!a[28]),
	.datab(!a[16]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a6.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a6.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a6(
	.dataa(!b[16]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a6.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a6.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a7(
	.dataa(!a[28]),
	.datab(!a[15]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a7.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a7.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a7(
	.dataa(!b[15]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a7.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a7.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a8(
	.dataa(!a[28]),
	.datab(!a[14]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a8.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a8.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a8(
	.dataa(!b[14]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a8.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a8.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a9(
	.dataa(!a[28]),
	.datab(!a[13]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a9.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a9.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a9(
	.dataa(!b[13]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a9.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a9.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a10(
	.dataa(!a[28]),
	.datab(!a[12]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a10.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a10.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a10(
	.dataa(!b[12]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a10.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a10.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a11(
	.dataa(!a[28]),
	.datab(!a[11]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a11.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a11.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a11(
	.dataa(!b[11]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a11.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a11.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a12(
	.dataa(!a[28]),
	.datab(!a[10]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a12.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a12.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a12(
	.dataa(!b[10]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a12.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a12.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a13(
	.dataa(!a[28]),
	.datab(!a[9]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a13.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a13.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a13(
	.dataa(!b[9]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a13.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a13.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a14(
	.dataa(!a[28]),
	.datab(!a[8]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a14.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a14.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a14(
	.dataa(!b[8]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a14.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a14.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a15(
	.dataa(!a[28]),
	.datab(!a[7]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a15.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a15.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a15(
	.dataa(!b[7]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a15.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a15.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a16(
	.dataa(!a[28]),
	.datab(!a[6]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a16.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a16.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a16(
	.dataa(!b[6]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a16.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a16.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a17(
	.dataa(!a[28]),
	.datab(!a[5]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a17.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a17.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a17(
	.dataa(!b[5]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a17.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a17.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a18(
	.dataa(!a[28]),
	.datab(!a[4]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a18.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a18.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a18(
	.dataa(!b[4]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a18.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a18.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a19(
	.dataa(!a[28]),
	.datab(!a[3]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a19.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a19.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a19(
	.dataa(!b[3]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a19.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a19.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a20(
	.dataa(!a[28]),
	.datab(!a[2]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a20.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a20.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a20(
	.dataa(!b[2]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a20.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a20.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a21(
	.dataa(!a[28]),
	.datab(!a[1]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a21.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a21.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a21(
	.dataa(!b[1]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a21.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a21.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a(
	.dataa(!a[28]),
	.datab(!a[0]),
	.datac(!fp_functions_0_areduce_nor_1_a0_combout),
	.datad(!fp_functions_0_areduce_nor_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a.extended_lut = "off";
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a.lut_mask = 64'h3331333133313331;
defparam fp_functions_0_afracXPS_uid41_fpCompareTest_qi_a0_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a(
	.dataa(!b[0]),
	.datab(!fp_functions_0_areduce_nor_0_a0_combout),
	.datac(!fp_functions_0_areduce_nor_0_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a.extended_lut = "off";
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a.lut_mask = 64'h5454545454545454;
defparam fp_functions_0_afracYPS_uid42_fpCompareTest_qi_a0_a.shared_arith = "off";

assign q[0] = fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0_combout;

endmodule
