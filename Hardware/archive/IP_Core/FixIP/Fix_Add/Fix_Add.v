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

// DATE "04/20/2021 21:15:50"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module Fix_Add (
	result,
	clk,
	rst,
	en,
	a1,
	a0)/* synthesis synthesis_greybox=0 */;
output 	[32:0] result;
input 	clk;
input 	rst;
input 	[0:0] en;
input 	[31:0] a1;
input 	[31:0] a0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire fxp_functions_0_aadder_o_a0_a_aq;
wire fxp_functions_0_aadder_o_a1_a_aq;
wire fxp_functions_0_aadder_o_a2_a_aq;
wire fxp_functions_0_aadder_o_a3_a_aq;
wire fxp_functions_0_aadder_o_a4_a_aq;
wire fxp_functions_0_aadder_o_a5_a_aq;
wire fxp_functions_0_aadder_o_a6_a_aq;
wire fxp_functions_0_aadder_o_a7_a_aq;
wire fxp_functions_0_aadder_o_a8_a_aq;
wire fxp_functions_0_aadder_o_a9_a_aq;
wire fxp_functions_0_aadder_o_a10_a_aq;
wire fxp_functions_0_aadder_o_a11_a_aq;
wire fxp_functions_0_aadder_o_a12_a_aq;
wire fxp_functions_0_aadder_o_a13_a_aq;
wire fxp_functions_0_aadder_o_a14_a_aq;
wire fxp_functions_0_aadder_o_a15_a_aq;
wire fxp_functions_0_aadder_o_a16_a_aq;
wire fxp_functions_0_aadder_o_a17_a_aq;
wire fxp_functions_0_aadder_o_a18_a_aq;
wire fxp_functions_0_aadder_o_a19_a_aq;
wire fxp_functions_0_aadder_o_a20_a_aq;
wire fxp_functions_0_aadder_o_a21_a_aq;
wire fxp_functions_0_aadder_o_a22_a_aq;
wire fxp_functions_0_aadder_o_a23_a_aq;
wire fxp_functions_0_aadder_o_a24_a_aq;
wire fxp_functions_0_aadder_o_a25_a_aq;
wire fxp_functions_0_aadder_o_a26_a_aq;
wire fxp_functions_0_aadder_o_a27_a_aq;
wire fxp_functions_0_aadder_o_a28_a_aq;
wire fxp_functions_0_aadder_o_a29_a_aq;
wire fxp_functions_0_aadder_o_a30_a_aq;
wire fxp_functions_0_aadder_o_a31_a_aq;
wire fxp_functions_0_aadder_o_a32_a_aq;
wire fxp_functions_0_aadd_0_a1_sumout;
wire fxp_functions_0_aadd_0_a2;
wire fxp_functions_0_aadd_0_a6_sumout;
wire fxp_functions_0_aadd_0_a7;
wire fxp_functions_0_aadd_0_a11_sumout;
wire fxp_functions_0_aadd_0_a12;
wire fxp_functions_0_aadd_0_a16_sumout;
wire fxp_functions_0_aadd_0_a17;
wire fxp_functions_0_aadd_0_a21_sumout;
wire fxp_functions_0_aadd_0_a22;
wire fxp_functions_0_aadd_0_a26_sumout;
wire fxp_functions_0_aadd_0_a27;
wire fxp_functions_0_aadd_0_a31_sumout;
wire fxp_functions_0_aadd_0_a32;
wire fxp_functions_0_aadd_0_a36_sumout;
wire fxp_functions_0_aadd_0_a37;
wire fxp_functions_0_aadd_0_a41_sumout;
wire fxp_functions_0_aadd_0_a42;
wire fxp_functions_0_aadd_0_a46_sumout;
wire fxp_functions_0_aadd_0_a47;
wire fxp_functions_0_aadd_0_a51_sumout;
wire fxp_functions_0_aadd_0_a52;
wire fxp_functions_0_aadd_0_a56_sumout;
wire fxp_functions_0_aadd_0_a57;
wire fxp_functions_0_aadd_0_a61_sumout;
wire fxp_functions_0_aadd_0_a62;
wire fxp_functions_0_aadd_0_a66_sumout;
wire fxp_functions_0_aadd_0_a67;
wire fxp_functions_0_aadd_0_a71_sumout;
wire fxp_functions_0_aadd_0_a72;
wire fxp_functions_0_aadd_0_a76_sumout;
wire fxp_functions_0_aadd_0_a77;
wire fxp_functions_0_aadd_0_a81_sumout;
wire fxp_functions_0_aadd_0_a82;
wire fxp_functions_0_aadd_0_a86_sumout;
wire fxp_functions_0_aadd_0_a87;
wire fxp_functions_0_aadd_0_a91_sumout;
wire fxp_functions_0_aadd_0_a92;
wire fxp_functions_0_aadd_0_a96_sumout;
wire fxp_functions_0_aadd_0_a97;
wire fxp_functions_0_aadd_0_a101_sumout;
wire fxp_functions_0_aadd_0_a102;
wire fxp_functions_0_aadd_0_a106_sumout;
wire fxp_functions_0_aadd_0_a107;
wire fxp_functions_0_aadd_0_a111_sumout;
wire fxp_functions_0_aadd_0_a112;
wire fxp_functions_0_aadd_0_a116_sumout;
wire fxp_functions_0_aadd_0_a117;
wire fxp_functions_0_aadd_0_a121_sumout;
wire fxp_functions_0_aadd_0_a122;
wire fxp_functions_0_aadd_0_a126_sumout;
wire fxp_functions_0_aadd_0_a127;
wire fxp_functions_0_aadd_0_a131_sumout;
wire fxp_functions_0_aadd_0_a132;
wire fxp_functions_0_aadd_0_a136_sumout;
wire fxp_functions_0_aadd_0_a137;
wire fxp_functions_0_aadd_0_a141_sumout;
wire fxp_functions_0_aadd_0_a142;
wire fxp_functions_0_aadd_0_a146_sumout;
wire fxp_functions_0_aadd_0_a147;
wire fxp_functions_0_aadd_0_a151_sumout;
wire fxp_functions_0_aadd_0_a152;
wire fxp_functions_0_aadd_0_a156_sumout;
wire fxp_functions_0_aadd_0_a157;
wire fxp_functions_0_aadd_0_a161_sumout;
wire fxp_functions_0_aadder_o_a25_a_a0_combout;


fourteennm_ff fxp_functions_0_aadder_o_a0_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a1_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a0_a_aq));
defparam fxp_functions_0_aadder_o_a0_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a0_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a1_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a6_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a1_a_aq));
defparam fxp_functions_0_aadder_o_a1_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a1_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a2_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a11_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a2_a_aq));
defparam fxp_functions_0_aadder_o_a2_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a2_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a3_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a16_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a3_a_aq));
defparam fxp_functions_0_aadder_o_a3_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a3_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a4_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a21_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a4_a_aq));
defparam fxp_functions_0_aadder_o_a4_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a4_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a5_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a26_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a5_a_aq));
defparam fxp_functions_0_aadder_o_a5_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a5_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a6_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a31_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a6_a_aq));
defparam fxp_functions_0_aadder_o_a6_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a6_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a7_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a36_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a7_a_aq));
defparam fxp_functions_0_aadder_o_a7_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a7_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a8_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a41_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a8_a_aq));
defparam fxp_functions_0_aadder_o_a8_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a8_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a9_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a46_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a9_a_aq));
defparam fxp_functions_0_aadder_o_a9_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a9_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a10_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a51_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a10_a_aq));
defparam fxp_functions_0_aadder_o_a10_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a10_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a11_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a56_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a11_a_aq));
defparam fxp_functions_0_aadder_o_a11_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a11_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a12_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a61_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a12_a_aq));
defparam fxp_functions_0_aadder_o_a12_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a12_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a13_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a66_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a13_a_aq));
defparam fxp_functions_0_aadder_o_a13_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a13_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a14_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a71_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a14_a_aq));
defparam fxp_functions_0_aadder_o_a14_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a14_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a15_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a76_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a15_a_aq));
defparam fxp_functions_0_aadder_o_a15_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a15_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a16_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a81_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a16_a_aq));
defparam fxp_functions_0_aadder_o_a16_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a16_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a17_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a86_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a17_a_aq));
defparam fxp_functions_0_aadder_o_a17_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a17_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a18_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a91_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a18_a_aq));
defparam fxp_functions_0_aadder_o_a18_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a18_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a19_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a96_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a19_a_aq));
defparam fxp_functions_0_aadder_o_a19_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a19_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a20_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a101_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a20_a_aq));
defparam fxp_functions_0_aadder_o_a20_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a20_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a21_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a106_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a21_a_aq));
defparam fxp_functions_0_aadder_o_a21_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a21_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a22_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a111_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a22_a_aq));
defparam fxp_functions_0_aadder_o_a22_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a22_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a23_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a116_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a23_a_aq));
defparam fxp_functions_0_aadder_o_a23_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a23_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a24_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a121_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a24_a_aq));
defparam fxp_functions_0_aadder_o_a24_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a24_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a25_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a126_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a25_a_aq));
defparam fxp_functions_0_aadder_o_a25_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a25_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a26_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a131_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a26_a_aq));
defparam fxp_functions_0_aadder_o_a26_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a26_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a27_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a136_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a27_a_aq));
defparam fxp_functions_0_aadder_o_a27_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a27_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a28_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a141_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a28_a_aq));
defparam fxp_functions_0_aadder_o_a28_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a28_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a29_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a146_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a29_a_aq));
defparam fxp_functions_0_aadder_o_a29_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a29_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a30_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a151_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a30_a_aq));
defparam fxp_functions_0_aadder_o_a30_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a30_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a31_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a156_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a31_a_aq));
defparam fxp_functions_0_aadder_o_a31_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a31_a.power_up = "dont_care";

fourteennm_ff fxp_functions_0_aadder_o_a32_a(
	.clk(clk),
	.d(fxp_functions_0_aadd_0_a161_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(rst),
	.sload(gnd),
	.ena(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sclr1(gnd),
	.q(fxp_functions_0_aadder_o_a32_a_aq));
defparam fxp_functions_0_aadder_o_a32_a.is_wysiwyg = "true";
defparam fxp_functions_0_aadder_o_a32_a.power_up = "dont_care";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[0]),
	.datad(!a0[0]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a1_sumout),
	.cout(fxp_functions_0_aadd_0_a2),
	.shareout());
defparam fxp_functions_0_aadd_0_a1.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a1.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a1.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a6(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[1]),
	.datad(!a0[1]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a2),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a6_sumout),
	.cout(fxp_functions_0_aadd_0_a7),
	.shareout());
defparam fxp_functions_0_aadd_0_a6.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a6.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a6.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a11(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[2]),
	.datad(!a0[2]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a7),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a11_sumout),
	.cout(fxp_functions_0_aadd_0_a12),
	.shareout());
defparam fxp_functions_0_aadd_0_a11.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a11.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a11.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a16(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[3]),
	.datad(!a0[3]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a12),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a16_sumout),
	.cout(fxp_functions_0_aadd_0_a17),
	.shareout());
defparam fxp_functions_0_aadd_0_a16.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a16.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a16.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a21(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[4]),
	.datad(!a0[4]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a17),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a21_sumout),
	.cout(fxp_functions_0_aadd_0_a22),
	.shareout());
defparam fxp_functions_0_aadd_0_a21.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a21.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a21.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a26(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[5]),
	.datad(!a0[5]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a22),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a26_sumout),
	.cout(fxp_functions_0_aadd_0_a27),
	.shareout());
defparam fxp_functions_0_aadd_0_a26.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a26.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a26.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a31(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[6]),
	.datad(!a0[6]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a27),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a31_sumout),
	.cout(fxp_functions_0_aadd_0_a32),
	.shareout());
defparam fxp_functions_0_aadd_0_a31.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a31.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a31.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a36(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[7]),
	.datad(!a0[7]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a36_sumout),
	.cout(fxp_functions_0_aadd_0_a37),
	.shareout());
defparam fxp_functions_0_aadd_0_a36.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a36.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a36.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a41(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[8]),
	.datad(!a0[8]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a37),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a41_sumout),
	.cout(fxp_functions_0_aadd_0_a42),
	.shareout());
defparam fxp_functions_0_aadd_0_a41.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a41.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a41.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a46(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[9]),
	.datad(!a0[9]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a42),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a46_sumout),
	.cout(fxp_functions_0_aadd_0_a47),
	.shareout());
defparam fxp_functions_0_aadd_0_a46.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a46.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a46.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a51(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[10]),
	.datad(!a0[10]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a47),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a51_sumout),
	.cout(fxp_functions_0_aadd_0_a52),
	.shareout());
defparam fxp_functions_0_aadd_0_a51.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a51.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a51.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a56(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[11]),
	.datad(!a0[11]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a56_sumout),
	.cout(fxp_functions_0_aadd_0_a57),
	.shareout());
defparam fxp_functions_0_aadd_0_a56.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a56.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a56.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a61(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[12]),
	.datad(!a0[12]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a57),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a61_sumout),
	.cout(fxp_functions_0_aadd_0_a62),
	.shareout());
defparam fxp_functions_0_aadd_0_a61.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a61.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a61.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a66(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[13]),
	.datad(!a0[13]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a62),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a66_sumout),
	.cout(fxp_functions_0_aadd_0_a67),
	.shareout());
defparam fxp_functions_0_aadd_0_a66.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a66.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a66.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a71(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[14]),
	.datad(!a0[14]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a67),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a71_sumout),
	.cout(fxp_functions_0_aadd_0_a72),
	.shareout());
defparam fxp_functions_0_aadd_0_a71.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a71.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a71.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a76(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[15]),
	.datad(!a0[15]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a72),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a76_sumout),
	.cout(fxp_functions_0_aadd_0_a77),
	.shareout());
defparam fxp_functions_0_aadd_0_a76.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a76.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a76.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a81(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[16]),
	.datad(!a0[16]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a77),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a81_sumout),
	.cout(fxp_functions_0_aadd_0_a82),
	.shareout());
defparam fxp_functions_0_aadd_0_a81.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a81.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a81.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a86(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[17]),
	.datad(!a0[17]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a82),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a86_sumout),
	.cout(fxp_functions_0_aadd_0_a87),
	.shareout());
defparam fxp_functions_0_aadd_0_a86.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a86.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a86.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a91(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[18]),
	.datad(!a0[18]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a87),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a91_sumout),
	.cout(fxp_functions_0_aadd_0_a92),
	.shareout());
defparam fxp_functions_0_aadd_0_a91.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a91.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a91.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a96(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[19]),
	.datad(!a0[19]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a92),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a96_sumout),
	.cout(fxp_functions_0_aadd_0_a97),
	.shareout());
defparam fxp_functions_0_aadd_0_a96.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a96.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a96.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a101(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[20]),
	.datad(!a0[20]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a97),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a101_sumout),
	.cout(fxp_functions_0_aadd_0_a102),
	.shareout());
defparam fxp_functions_0_aadd_0_a101.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a101.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a101.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a106(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[21]),
	.datad(!a0[21]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a102),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a106_sumout),
	.cout(fxp_functions_0_aadd_0_a107),
	.shareout());
defparam fxp_functions_0_aadd_0_a106.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a106.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a106.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a111(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[22]),
	.datad(!a0[22]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a107),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a111_sumout),
	.cout(fxp_functions_0_aadd_0_a112),
	.shareout());
defparam fxp_functions_0_aadd_0_a111.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a111.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a111.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a116(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[23]),
	.datad(!a0[23]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a112),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a116_sumout),
	.cout(fxp_functions_0_aadd_0_a117),
	.shareout());
defparam fxp_functions_0_aadd_0_a116.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a116.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a116.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a121(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[24]),
	.datad(!a0[24]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a117),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a121_sumout),
	.cout(fxp_functions_0_aadd_0_a122),
	.shareout());
defparam fxp_functions_0_aadd_0_a121.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a121.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a121.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a126(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[25]),
	.datad(!a0[25]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a122),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a126_sumout),
	.cout(fxp_functions_0_aadd_0_a127),
	.shareout());
defparam fxp_functions_0_aadd_0_a126.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a126.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a126.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a131(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[26]),
	.datad(!a0[26]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a127),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a131_sumout),
	.cout(fxp_functions_0_aadd_0_a132),
	.shareout());
defparam fxp_functions_0_aadd_0_a131.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a131.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a131.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a136(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[27]),
	.datad(!a0[27]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a132),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a136_sumout),
	.cout(fxp_functions_0_aadd_0_a137),
	.shareout());
defparam fxp_functions_0_aadd_0_a136.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a136.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a136.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a141(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[28]),
	.datad(!a0[28]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a137),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a141_sumout),
	.cout(fxp_functions_0_aadd_0_a142),
	.shareout());
defparam fxp_functions_0_aadd_0_a141.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a141.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a141.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a146(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[29]),
	.datad(!a0[29]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a142),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a146_sumout),
	.cout(fxp_functions_0_aadd_0_a147),
	.shareout());
defparam fxp_functions_0_aadd_0_a146.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a146.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a146.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a151(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[30]),
	.datad(!a0[30]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a147),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a151_sumout),
	.cout(fxp_functions_0_aadd_0_a152),
	.shareout());
defparam fxp_functions_0_aadd_0_a151.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a151.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a151.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a156(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[31]),
	.datad(!a0[31]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a152),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a156_sumout),
	.cout(fxp_functions_0_aadd_0_a157),
	.shareout());
defparam fxp_functions_0_aadd_0_a156.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a156.lut_mask = 64'h00000000000F0FF0;
defparam fxp_functions_0_aadd_0_a156.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadd_0_a161(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a1[31]),
	.datad(!a0[31]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fxp_functions_0_aadd_0_a157),
	.sharein(gnd),
	.combout(),
	.sumout(fxp_functions_0_aadd_0_a161_sumout),
	.cout(),
	.shareout());
defparam fxp_functions_0_aadd_0_a161.extended_lut = "off";
defparam fxp_functions_0_aadd_0_a161.lut_mask = 64'h0000000000000FF0;
defparam fxp_functions_0_aadd_0_a161.shared_arith = "off";

fourteennm_lcell_comb fxp_functions_0_aadder_o_a25_a_a0(
	.dataa(!rst),
	.datab(!en[0]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fxp_functions_0_aadder_o_a25_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fxp_functions_0_aadder_o_a25_a_a0.extended_lut = "off";
defparam fxp_functions_0_aadder_o_a25_a_a0.lut_mask = 64'h7777777777777777;
defparam fxp_functions_0_aadder_o_a25_a_a0.shared_arith = "off";

assign result[0] = fxp_functions_0_aadder_o_a0_a_aq;

assign result[10] = fxp_functions_0_aadder_o_a10_a_aq;

assign result[11] = fxp_functions_0_aadder_o_a11_a_aq;

assign result[12] = fxp_functions_0_aadder_o_a12_a_aq;

assign result[13] = fxp_functions_0_aadder_o_a13_a_aq;

assign result[14] = fxp_functions_0_aadder_o_a14_a_aq;

assign result[15] = fxp_functions_0_aadder_o_a15_a_aq;

assign result[16] = fxp_functions_0_aadder_o_a16_a_aq;

assign result[17] = fxp_functions_0_aadder_o_a17_a_aq;

assign result[18] = fxp_functions_0_aadder_o_a18_a_aq;

assign result[19] = fxp_functions_0_aadder_o_a19_a_aq;

assign result[1] = fxp_functions_0_aadder_o_a1_a_aq;

assign result[20] = fxp_functions_0_aadder_o_a20_a_aq;

assign result[21] = fxp_functions_0_aadder_o_a21_a_aq;

assign result[22] = fxp_functions_0_aadder_o_a22_a_aq;

assign result[23] = fxp_functions_0_aadder_o_a23_a_aq;

assign result[24] = fxp_functions_0_aadder_o_a24_a_aq;

assign result[25] = fxp_functions_0_aadder_o_a25_a_aq;

assign result[26] = fxp_functions_0_aadder_o_a26_a_aq;

assign result[27] = fxp_functions_0_aadder_o_a27_a_aq;

assign result[28] = fxp_functions_0_aadder_o_a28_a_aq;

assign result[29] = fxp_functions_0_aadder_o_a29_a_aq;

assign result[2] = fxp_functions_0_aadder_o_a2_a_aq;

assign result[30] = fxp_functions_0_aadder_o_a30_a_aq;

assign result[31] = fxp_functions_0_aadder_o_a31_a_aq;

assign result[32] = fxp_functions_0_aadder_o_a32_a_aq;

assign result[3] = fxp_functions_0_aadder_o_a3_a_aq;

assign result[4] = fxp_functions_0_aadder_o_a4_a_aq;

assign result[5] = fxp_functions_0_aadder_o_a5_a_aq;

assign result[6] = fxp_functions_0_aadder_o_a6_a_aq;

assign result[7] = fxp_functions_0_aadder_o_a7_a_aq;

assign result[8] = fxp_functions_0_aadder_o_a8_a_aq;

assign result[9] = fxp_functions_0_aadder_o_a9_a_aq;

endmodule
