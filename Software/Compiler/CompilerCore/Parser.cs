// This code was generated by the Gardens Point Parser Generator
// Copyright (c) Wayne Kelly, John Gough, QUT 2005-2014
// (see accompanying GPPGcopyright.rtf)

// GPPG version 1.5.2
// Machine:  LAPTOP-KDKHEG7R
// DateTime: 2021/4/17 0:12:58
// UserName: zyd20
// Input file <RT.y - 2021/4/17 0:12:56>

// options: lines gplex

using System;
using System.Collections.Generic;
using System.CodeDom.Compiler;
using System.Globalization;
using System.Text;
using QUT.Gppg;

namespace CompilerCore
{
internal enum Tokens {
    error=127,EOF=128,AND=129,OR=130,EQ=131,NE=132,
    GT=133,GE=134,LT=135,LE=136,UMINUS=137,INT_LITERAL=138,
    FLOAT_LITERAL=139,VECTOR_LITERAL=140,IDENTIFIER=141,INT=142,FLOAT=143,VECTOR=144,
    IF=145,ELSE=146,ELSEIF=147,FOR=148,WHILE=149,BREAK=150,
    CONTINUE=151,RETURN=152,STRUCT=153,CONST=154,INCREMENT=155,DECREMENT=156};

internal struct ValueType
#line 7 "RT.y"
{ 
    internal Expression Expression;
    internal Statement Statement;
    internal List<Expression> ExpressionList;
    internal List<Statement> StatementList;
    internal string Identifier;
    internal DeclarationStatement.DeclarationItem DeclaraionItem;
    internal List<DeclarationStatement.DeclarationItem> DeclarationList;
    internal int IntLiteral;
    internal float FloatLiteral;
    internal string VectorLiteral;
    internal IfStatement IfStatement;
    internal Type Type;
    internal List<FunctionDefinitionStatement.Parameter> ParameterList;
}
#line default
// Abstract base class for GPLEX scanners
[GeneratedCodeAttribute( "Gardens Point Parser Generator", "1.5.2")]
internal abstract class ScanBase : AbstractScanner<ValueType,LexLocation> {
  private LexLocation __yylloc = new LexLocation();
  public override LexLocation yylloc { get { return __yylloc; } set { __yylloc = value; } }
  protected virtual bool yywrap() { return true; }
}

// Utility class for encapsulating token information
[GeneratedCodeAttribute( "Gardens Point Parser Generator", "1.5.2")]
internal class ScanObj {
  public int token;
  public ValueType yylval;
  public LexLocation yylloc;
  public ScanObj( int t, ValueType val, LexLocation loc ) {
    this.token = t; this.yylval = val; this.yylloc = loc;
  }
}

[GeneratedCodeAttribute( "Gardens Point Parser Generator", "1.5.2")]
internal class Parser: ShiftReduceParser<ValueType, LexLocation>
{
#pragma warning disable 649
  private static Dictionary<int, string> aliases;
#pragma warning restore 649
  private static Rule[] rules = new Rule[77];
  private static State[] states = new State[143];
  private static string[] nonTerms = new string[] {
      "statement_list", "value_type", "statement", "loop_statement", "return_statement", 
      "assignment_statement", "function_definition_statement", "declaration_statement", 
      "for_special_statement", "block_statement", "if_statement", "declaration_item", 
      "declaration_list", "optional_statement_list", "expression_list", "expression", 
      "binary_expression", "unary_expression", "literal_expression", "index_expression", 
      "possible_array_expression", "optional_expression", "assignment_lval_expression", 
      "identifier_expression", "function_call_expression", "parameter_list", 
      "$accept", };

  static Parser() {
    states[0] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128},new int[]{-1,1,-3,131,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[1] = new State(new int[]{128,2,40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128},new int[]{-3,3,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[2] = new State(-1);
    states[3] = new State(-3);
    states[4] = new State(new int[]{59,5,43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30});
    states[5] = new State(-4);
    states[6] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,7,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[7] = new State(new int[]{43,-49,45,-49,42,10,47,12,37,14,131,-49,132,-49,133,-49,134,-49,135,-49,136,-49,129,-49,130,-49,59,-49,41,-49,93,-49,44,-49});
    states[8] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,9,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[9] = new State(new int[]{43,-50,45,-50,42,10,47,12,37,14,131,-50,132,-50,133,-50,134,-50,135,-50,136,-50,129,-50,130,-50,59,-50,41,-50,93,-50,44,-50});
    states[10] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,11,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[11] = new State(-51);
    states[12] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,13,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[13] = new State(-52);
    states[14] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,15,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[15] = new State(-53);
    states[16] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,17,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[17] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,-54,132,-54,133,-54,134,-54,135,-54,136,-54,129,-54,130,-54,59,-54,41,-54,93,-54,44,-54});
    states[18] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,19,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[19] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,-55,132,-55,133,-55,134,-55,135,-55,136,-55,129,-55,130,-55,59,-55,41,-55,93,-55,44,-55});
    states[20] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,21,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[21] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,-56,132,-56,133,-56,134,-56,135,-56,136,-56,129,-56,130,-56,59,-56,41,-56,93,-56,44,-56});
    states[22] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,23,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[23] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,-57,132,-57,133,-57,134,-57,135,-57,136,-57,129,-57,130,-57,59,-57,41,-57,93,-57,44,-57});
    states[24] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,25,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[25] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,-58,132,-58,133,-58,134,-58,135,-58,136,-58,129,-58,130,-58,59,-58,41,-58,93,-58,44,-58});
    states[26] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,27,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[27] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,-59,132,-59,133,-59,134,-59,135,-59,136,-59,129,-59,130,-59,59,-59,41,-59,93,-59,44,-59});
    states[28] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,29,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[29] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,-60,130,-60,59,-60,41,-60,93,-60,44,-60});
    states[30] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,31,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[31] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,-61,130,-61,59,-61,41,-61,93,-61,44,-61});
    states[32] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,33,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[33] = new State(new int[]{41,34,43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30});
    states[34] = new State(-33);
    states[35] = new State(-34);
    states[36] = new State(-35);
    states[37] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,38,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[38] = new State(-62);
    states[39] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,40,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[40] = new State(-63);
    states[41] = new State(new int[]{91,42,59,-36,43,-36,45,-36,42,-36,47,-36,37,-36,131,-36,132,-36,133,-36,134,-36,135,-36,136,-36,129,-36,130,-36,41,-36,93,-36,44,-36});
    states[42] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,43,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[43] = new State(new int[]{93,44,43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30});
    states[44] = new State(-69);
    states[45] = new State(-65);
    states[46] = new State(-70);
    states[47] = new State(-71);
    states[48] = new State(-72);
    states[49] = new State(-66);
    states[50] = new State(-67);
    states[51] = new State(new int[]{40,52,91,-64,59,-64,43,-64,45,-64,42,-64,47,-64,37,-64,131,-64,132,-64,133,-64,134,-64,135,-64,136,-64,129,-64,130,-64,61,-64,155,-64,156,-64,41,-64,93,-64,44,-64});
    states[52] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,41,-74,44,-74},new int[]{-15,53,-16,58,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[53] = new State(new int[]{41,54,44,55});
    states[54] = new State(-73);
    states[55] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,56,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[56] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30,41,-76,44,-76});
    states[57] = new State(-68);
    states[58] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30,41,-75,44,-75});
    states[59] = new State(new int[]{91,-66,59,-66,43,-66,45,-66,42,-66,47,-66,37,-66,131,-66,132,-66,133,-66,134,-66,135,-66,136,-66,129,-66,130,-66,61,-47,155,-47,156,-47});
    states[60] = new State(new int[]{91,-68,59,-68,43,-68,45,-68,42,-68,47,-68,37,-68,131,-68,132,-68,133,-68,134,-68,135,-68,136,-68,129,-68,130,-68,61,-48,155,-48,156,-48});
    states[61] = new State(new int[]{146,62,128,-5,40,-5,45,-5,33,-5,138,-5,139,-5,140,-5,141,-5,145,-5,148,-5,149,-5,152,-5,142,-5,143,-5,144,-5,154,-5,151,-5,150,-5,123,-5,125,-5});
    states[62] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128},new int[]{-3,63,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[63] = new State(-24);
    states[64] = new State(new int[]{40,65});
    states[65] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,66,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[66] = new State(new int[]{41,67,43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30});
    states[67] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128},new int[]{-3,68,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[68] = new State(-23);
    states[69] = new State(-6);
    states[70] = new State(new int[]{40,71});
    states[71] = new State(new int[]{142,116,143,117,144,118,154,119,138,46,139,47,140,48,141,51},new int[]{-9,72,-8,138,-2,139,-6,140,-23,91,-20,59,-21,141,-19,45,-25,50,-24,60});
    states[72] = new State(new int[]{59,73});
    states[73] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,59,-19},new int[]{-22,74,-16,142,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[74] = new State(new int[]{59,75});
    states[75] = new State(new int[]{142,116,143,117,144,118,154,119,138,46,139,47,140,48,141,51},new int[]{-9,76,-8,138,-2,139,-6,140,-23,91,-20,59,-21,141,-19,45,-25,50,-24,60});
    states[76] = new State(new int[]{41,77});
    states[77] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128},new int[]{-3,78,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[78] = new State(-17);
    states[79] = new State(new int[]{40,80});
    states[80] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,81,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[81] = new State(new int[]{41,82,43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30});
    states[82] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128},new int[]{-3,83,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[83] = new State(-18);
    states[84] = new State(-7);
    states[85] = new State(new int[]{59,86,40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,87,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[86] = new State(-14);
    states[87] = new State(new int[]{59,88,43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30});
    states[88] = new State(-15);
    states[89] = new State(new int[]{59,90});
    states[90] = new State(-8);
    states[91] = new State(new int[]{61,92,155,94,156,95});
    states[92] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,93,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[93] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30,59,-44,41,-44});
    states[94] = new State(-45);
    states[95] = new State(-46);
    states[96] = new State(new int[]{59,97});
    states[97] = new State(-9);
    states[98] = new State(new int[]{141,108},new int[]{-13,99,-12,122});
    states[99] = new State(new int[]{44,100,59,-37,41,-37});
    states[100] = new State(new int[]{141,102},new int[]{-12,101});
    states[101] = new State(-40);
    states[102] = new State(new int[]{61,103,91,105,44,-41,59,-41,41,-41});
    states[103] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51},new int[]{-16,104,-17,35,-18,36,-21,41,-19,45,-20,49,-25,50,-24,57});
    states[104] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30,44,-42,59,-42,41,-42});
    states[105] = new State(new int[]{138,106});
    states[106] = new State(new int[]{93,107});
    states[107] = new State(-43);
    states[108] = new State(new int[]{40,109,61,103,91,105,44,-41,59,-41});
    states[109] = new State(new int[]{142,116,143,117,144,118},new int[]{-26,110,-2,136});
    states[110] = new State(new int[]{41,111,44,133});
    states[111] = new State(new int[]{123,112});
    states[112] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128,125,-26},new int[]{-14,113,-1,115,-3,131,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[113] = new State(new int[]{125,114});
    states[114] = new State(-25);
    states[115] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128,125,-27},new int[]{-3,3,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[116] = new State(-30);
    states[117] = new State(-31);
    states[118] = new State(-32);
    states[119] = new State(new int[]{142,116,143,117,144,118},new int[]{-2,120});
    states[120] = new State(new int[]{141,102},new int[]{-13,121,-12,122});
    states[121] = new State(new int[]{44,100,59,-38,41,-38});
    states[122] = new State(-39);
    states[123] = new State(new int[]{59,124});
    states[124] = new State(-10);
    states[125] = new State(new int[]{59,126});
    states[126] = new State(-11);
    states[127] = new State(-12);
    states[128] = new State(new int[]{40,32,45,37,33,39,138,46,139,47,140,48,141,51,145,64,148,70,149,79,152,85,142,116,143,117,144,118,154,119,151,123,150,125,123,128,125,-26},new int[]{-14,129,-1,115,-3,131,-16,4,-17,35,-18,36,-21,41,-19,45,-20,59,-25,50,-24,60,-11,61,-4,69,-5,84,-6,89,-23,91,-8,96,-2,98,-10,127,-7,132});
    states[129] = new State(new int[]{125,130});
    states[130] = new State(-16);
    states[131] = new State(-2);
    states[132] = new State(-13);
    states[133] = new State(new int[]{142,116,143,117,144,118},new int[]{-2,134});
    states[134] = new State(new int[]{141,135});
    states[135] = new State(-29);
    states[136] = new State(new int[]{141,137});
    states[137] = new State(-28);
    states[138] = new State(-21);
    states[139] = new State(new int[]{141,102},new int[]{-13,99,-12,122});
    states[140] = new State(-22);
    states[141] = new State(new int[]{91,42});
    states[142] = new State(new int[]{43,6,45,8,42,10,47,12,37,14,131,16,132,18,133,20,134,22,135,24,136,26,129,28,130,30,59,-20});

    for (int sNo = 0; sNo < states.Length; sNo++) states[sNo].number = sNo;

    rules[1] = new Rule(-27, new int[]{-1,128});
    rules[2] = new Rule(-1, new int[]{-3});
    rules[3] = new Rule(-1, new int[]{-1,-3});
    rules[4] = new Rule(-3, new int[]{-16,59});
    rules[5] = new Rule(-3, new int[]{-11});
    rules[6] = new Rule(-3, new int[]{-4});
    rules[7] = new Rule(-3, new int[]{-5});
    rules[8] = new Rule(-3, new int[]{-6,59});
    rules[9] = new Rule(-3, new int[]{-8,59});
    rules[10] = new Rule(-3, new int[]{151,59});
    rules[11] = new Rule(-3, new int[]{150,59});
    rules[12] = new Rule(-3, new int[]{-10});
    rules[13] = new Rule(-3, new int[]{-7});
    rules[14] = new Rule(-5, new int[]{152,59});
    rules[15] = new Rule(-5, new int[]{152,-16,59});
    rules[16] = new Rule(-10, new int[]{123,-14,125});
    rules[17] = new Rule(-4, new int[]{148,40,-9,59,-22,59,-9,41,-3});
    rules[18] = new Rule(-4, new int[]{149,40,-16,41,-3});
    rules[19] = new Rule(-22, new int[]{});
    rules[20] = new Rule(-22, new int[]{-16});
    rules[21] = new Rule(-9, new int[]{-8});
    rules[22] = new Rule(-9, new int[]{-6});
    rules[23] = new Rule(-11, new int[]{145,40,-16,41,-3});
    rules[24] = new Rule(-11, new int[]{-11,146,-3});
    rules[25] = new Rule(-7, new int[]{-2,141,40,-26,41,123,-14,125});
    rules[26] = new Rule(-14, new int[]{});
    rules[27] = new Rule(-14, new int[]{-1});
    rules[28] = new Rule(-26, new int[]{-2,141});
    rules[29] = new Rule(-26, new int[]{-26,44,-2,141});
    rules[30] = new Rule(-2, new int[]{142});
    rules[31] = new Rule(-2, new int[]{143});
    rules[32] = new Rule(-2, new int[]{144});
    rules[33] = new Rule(-16, new int[]{40,-16,41});
    rules[34] = new Rule(-16, new int[]{-17});
    rules[35] = new Rule(-16, new int[]{-18});
    rules[36] = new Rule(-16, new int[]{-21});
    rules[37] = new Rule(-8, new int[]{-2,-13});
    rules[38] = new Rule(-8, new int[]{154,-2,-13});
    rules[39] = new Rule(-13, new int[]{-12});
    rules[40] = new Rule(-13, new int[]{-13,44,-12});
    rules[41] = new Rule(-12, new int[]{141});
    rules[42] = new Rule(-12, new int[]{141,61,-16});
    rules[43] = new Rule(-12, new int[]{141,91,138,93});
    rules[44] = new Rule(-6, new int[]{-23,61,-16});
    rules[45] = new Rule(-6, new int[]{-23,155});
    rules[46] = new Rule(-6, new int[]{-23,156});
    rules[47] = new Rule(-23, new int[]{-20});
    rules[48] = new Rule(-23, new int[]{-24});
    rules[49] = new Rule(-17, new int[]{-16,43,-16});
    rules[50] = new Rule(-17, new int[]{-16,45,-16});
    rules[51] = new Rule(-17, new int[]{-16,42,-16});
    rules[52] = new Rule(-17, new int[]{-16,47,-16});
    rules[53] = new Rule(-17, new int[]{-16,37,-16});
    rules[54] = new Rule(-17, new int[]{-16,131,-16});
    rules[55] = new Rule(-17, new int[]{-16,132,-16});
    rules[56] = new Rule(-17, new int[]{-16,133,-16});
    rules[57] = new Rule(-17, new int[]{-16,134,-16});
    rules[58] = new Rule(-17, new int[]{-16,135,-16});
    rules[59] = new Rule(-17, new int[]{-16,136,-16});
    rules[60] = new Rule(-17, new int[]{-16,129,-16});
    rules[61] = new Rule(-17, new int[]{-16,130,-16});
    rules[62] = new Rule(-18, new int[]{45,-16});
    rules[63] = new Rule(-18, new int[]{33,-16});
    rules[64] = new Rule(-24, new int[]{141});
    rules[65] = new Rule(-21, new int[]{-19});
    rules[66] = new Rule(-21, new int[]{-20});
    rules[67] = new Rule(-21, new int[]{-25});
    rules[68] = new Rule(-21, new int[]{-24});
    rules[69] = new Rule(-20, new int[]{-21,91,-16,93});
    rules[70] = new Rule(-19, new int[]{138});
    rules[71] = new Rule(-19, new int[]{139});
    rules[72] = new Rule(-19, new int[]{140});
    rules[73] = new Rule(-25, new int[]{141,40,-15,41});
    rules[74] = new Rule(-15, new int[]{});
    rules[75] = new Rule(-15, new int[]{-16});
    rules[76] = new Rule(-15, new int[]{-15,44,-16});

    aliases = new Dictionary<int, string>();
    aliases.Add(129, "&&");
    aliases.Add(130, "||");
    aliases.Add(131, "==");
    aliases.Add(132, "!=");
    aliases.Add(133, ">");
    aliases.Add(134, ">=");
    aliases.Add(135, "<");
    aliases.Add(136, "<=");
  }

  protected override void Initialize() {
    this.InitSpecialTokens((int)Tokens.error, (int)Tokens.EOF);
    this.InitStates(states);
    this.InitRules(rules);
    this.InitNonTerminals(nonTerms);
  }

  protected override void DoAction(int action)
  {
#pragma warning disable 162, 1522
    switch (action)
    {
      case 2: // statement_list -> statement
#line 50 "RT.y"
    {
        CurrentSemanticValue.StatementList = new List<Statement>{ValueStack[ValueStack.Depth-1].Statement};
    }
#line default
        break;
      case 3: // statement_list -> statement_list, statement
#line 54 "RT.y"
    {
        ValueStack[ValueStack.Depth-2].StatementList.Add(ValueStack[ValueStack.Depth-1].Statement);
        CurrentSemanticValue.StatementList = ValueStack[ValueStack.Depth-2].StatementList;
    }
#line default
        break;
      case 4: // statement -> expression, ';'
#line 61 "RT.y"
    {
        CurrentSemanticValue.Statement = new ExpressionStatement(ValueStack[ValueStack.Depth-2].Expression);
    }
#line default
        break;
      case 10: // statement -> CONTINUE, ';'
#line 70 "RT.y"
    {
        CurrentSemanticValue.Statement = new ControlStatement(ControlStatement.Type.CONTINUE);
    }
#line default
        break;
      case 11: // statement -> BREAK, ';'
#line 74 "RT.y"
    {
        CurrentSemanticValue.Statement = new ControlStatement(ControlStatement.Type.BREAK);
    }
#line default
        break;
      case 14: // return_statement -> RETURN, ';'
#line 81 "RT.y"
    {
        CurrentSemanticValue.Statement = new ReturnStatement();
    }
#line default
        break;
      case 15: // return_statement -> RETURN, expression, ';'
#line 85 "RT.y"
    {
        CurrentSemanticValue.Statement = new ReturnStatement(ValueStack[ValueStack.Depth-2].Expression);
    }
#line default
        break;
      case 16: // block_statement -> '{', optional_statement_list, '}'
#line 90 "RT.y"
    {
        CurrentSemanticValue.Statement = new BlockStatement(ValueStack[ValueStack.Depth-2].StatementList);
    }
#line default
        break;
      case 17: // loop_statement -> FOR, '(', for_special_statement, ';', optional_expression, 
               //                   ';', for_special_statement, ')', statement
#line 95 "RT.y"
    {
        CurrentSemanticValue.Statement = new LoopStatement(ValueStack[ValueStack.Depth-7].Statement, ValueStack[ValueStack.Depth-5].Expression, ValueStack[ValueStack.Depth-3].Statement, ValueStack[ValueStack.Depth-1].Statement);
    }
#line default
        break;
      case 18: // loop_statement -> WHILE, '(', expression, ')', statement
#line 99 "RT.y"
    {
        CurrentSemanticValue.Statement = new LoopStatement(ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Statement);
    }
#line default
        break;
      case 23: // if_statement -> IF, '(', expression, ')', statement
#line 110 "RT.y"
    {
        CurrentSemanticValue.IfStatement = new IfStatement(ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Statement);
    }
#line default
        break;
      case 24: // if_statement -> if_statement, ELSE, statement
#line 114 "RT.y"
    {
        CurrentSemanticValue.IfStatement = ValueStack[ValueStack.Depth-3].IfStatement.AddElse(ValueStack[ValueStack.Depth-1].Statement);
    }
#line default
        break;
      case 25: // function_definition_statement -> value_type, IDENTIFIER, '(', parameter_list, 
               //                                  ')', '{', optional_statement_list, '}'
#line 119 "RT.y"
    {
        CurrentSemanticValue.Statement = new FunctionDefinitionStatement(ValueStack[ValueStack.Depth-8].Type, ValueStack[ValueStack.Depth-7].Identifier, ValueStack[ValueStack.Depth-5].ParameterList, ValueStack[ValueStack.Depth-2].StatementList);
    }
#line default
        break;
      case 26: // optional_statement_list -> /* empty */
#line 124 "RT.y"
    {
        CurrentSemanticValue.StatementList = new List<Statement>();
    }
#line default
        break;
      case 28: // parameter_list -> value_type, IDENTIFIER
#line 130 "RT.y"
    {
        CurrentSemanticValue.ParameterList = new List<FunctionDefinitionStatement.Parameter>{new FunctionDefinitionStatement.Parameter(ValueStack[ValueStack.Depth-2].Type, ValueStack[ValueStack.Depth-1].Identifier)};
    }
#line default
        break;
      case 29: // parameter_list -> parameter_list, ',', value_type, IDENTIFIER
#line 134 "RT.y"
    {
        ValueStack[ValueStack.Depth-4].ParameterList.Add(new FunctionDefinitionStatement.Parameter(ValueStack[ValueStack.Depth-2].Type, ValueStack[ValueStack.Depth-1].Identifier));
        CurrentSemanticValue.ParameterList = ValueStack[ValueStack.Depth-4].ParameterList;
    }
#line default
        break;
      case 30: // value_type -> INT
#line 139 "RT.y"
                {CurrentSemanticValue.Type = Type.INT;}
#line default
        break;
      case 31: // value_type -> FLOAT
#line 140 "RT.y"
            {CurrentSemanticValue.Type = Type.FLOAT;}
#line default
        break;
      case 32: // value_type -> VECTOR
#line 141 "RT.y"
             {CurrentSemanticValue.Type = Type.VECTOR;}
#line default
        break;
      case 33: // expression -> '(', expression, ')'
#line 145 "RT.y"
    {
        CurrentSemanticValue.Expression = ValueStack[ValueStack.Depth-2].Expression;
    }
#line default
        break;
      case 37: // declaration_statement -> value_type, declaration_list
#line 153 "RT.y"
    {
        CurrentSemanticValue.Statement = new DeclarationStatement(ValueStack[ValueStack.Depth-2].Type, ValueStack[ValueStack.Depth-1].DeclarationList);
    }
#line default
        break;
      case 38: // declaration_statement -> CONST, value_type, declaration_list
#line 157 "RT.y"
    {
        CurrentSemanticValue.Statement = new DeclarationStatement(ValueStack[ValueStack.Depth-2].Type, ValueStack[ValueStack.Depth-1].DeclarationList, true);
    }
#line default
        break;
      case 39: // declaration_list -> declaration_item
#line 162 "RT.y"
    {
        CurrentSemanticValue.DeclarationList = new List<DeclarationStatement.DeclarationItem>{ValueStack[ValueStack.Depth-1].DeclaraionItem};
    }
#line default
        break;
      case 40: // declaration_list -> declaration_list, ',', declaration_item
#line 166 "RT.y"
    {
        ValueStack[ValueStack.Depth-3].DeclarationList.Add(ValueStack[ValueStack.Depth-1].DeclaraionItem);
        CurrentSemanticValue.DeclarationList = ValueStack[ValueStack.Depth-3].DeclarationList;
    }
#line default
        break;
      case 41: // declaration_item -> IDENTIFIER
#line 172 "RT.y"
    {
        CurrentSemanticValue.DeclaraionItem = new DeclarationStatement.DeclarationItem(ValueStack[ValueStack.Depth-1].Identifier);
    }
#line default
        break;
      case 42: // declaration_item -> IDENTIFIER, '=', expression
#line 176 "RT.y"
    {
        CurrentSemanticValue.DeclaraionItem = new DeclarationStatement.DeclarationItem(ValueStack[ValueStack.Depth-3].Identifier, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 43: // declaration_item -> IDENTIFIER, '[', INT_LITERAL, ']'
#line 180 "RT.y"
    {
        CurrentSemanticValue.DeclaraionItem = new DeclarationStatement.DeclarationItem(ValueStack[ValueStack.Depth-4].Identifier, null, ValueStack[ValueStack.Depth-2].IntLiteral);
    }
#line default
        break;
      case 44: // assignment_statement -> assignment_lval_expression, '=', expression
#line 185 "RT.y"
    {
        CurrentSemanticValue.Statement = new AssignmentStatement(ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 45: // assignment_statement -> assignment_lval_expression, INCREMENT
#line 189 "RT.y"
    {
        var one = new IntLiteralExpression(1);
        CurrentSemanticValue.Statement = new AssignmentStatement(ValueStack[ValueStack.Depth-2].Expression, new BinaryExpression(BinaryExpression.Type.ADD, ValueStack[ValueStack.Depth-2].Expression, one));
    }
#line default
        break;
      case 46: // assignment_statement -> assignment_lval_expression, DECREMENT
#line 194 "RT.y"
    {
        var one = new IntLiteralExpression(1);
        CurrentSemanticValue.Statement = new AssignmentStatement(ValueStack[ValueStack.Depth-2].Expression, new BinaryExpression(BinaryExpression.Type.SUB, ValueStack[ValueStack.Depth-2].Expression, one));
    }
#line default
        break;
      case 49: // binary_expression -> expression, '+', expression
#line 203 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.ADD, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 50: // binary_expression -> expression, '-', expression
#line 207 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.SUB, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);            
    }
#line default
        break;
      case 51: // binary_expression -> expression, '*', expression
#line 211 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.MUL, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);            
    }
#line default
        break;
      case 52: // binary_expression -> expression, '/', expression
#line 215 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.DIV, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);            
    }
#line default
        break;
      case 53: // binary_expression -> expression, '%', expression
#line 219 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.MOD, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);            
    }
#line default
        break;
      case 54: // binary_expression -> expression, "==", expression
#line 223 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.EQ, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 55: // binary_expression -> expression, "!=", expression
#line 227 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.NE, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 56: // binary_expression -> expression, ">", expression
#line 231 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.GT, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 57: // binary_expression -> expression, ">=", expression
#line 235 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.GE, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 58: // binary_expression -> expression, "<", expression
#line 239 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.LT, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 59: // binary_expression -> expression, "<=", expression
#line 243 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.LE, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 60: // binary_expression -> expression, "&&", expression
#line 247 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.AND, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 61: // binary_expression -> expression, "||", expression
#line 251 "RT.y"
    {
        CurrentSemanticValue.Expression = new BinaryExpression(BinaryExpression.Type.OR, ValueStack[ValueStack.Depth-3].Expression, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 62: // unary_expression -> '-', expression
#line 256 "RT.y"
    {
        CurrentSemanticValue.Expression = new UnaryExpression(UnaryExpression.Type.NEGATE, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 63: // unary_expression -> '!', expression
#line 260 "RT.y"
    {
        CurrentSemanticValue.Expression = new UnaryExpression(UnaryExpression.Type.NOT, ValueStack[ValueStack.Depth-1].Expression);
    }
#line default
        break;
      case 64: // identifier_expression -> IDENTIFIER
#line 265 "RT.y"
    {
        CurrentSemanticValue.Expression = new IdentifierExpression(ValueStack[ValueStack.Depth-1].Identifier);
    }
#line default
        break;
      case 69: // index_expression -> possible_array_expression, '[', expression, ']'
#line 275 "RT.y"
    {
        CurrentSemanticValue.Expression = new IndexExpression(ValueStack[ValueStack.Depth-4].Expression, ValueStack[ValueStack.Depth-2].Expression);
    }
#line default
        break;
      case 70: // literal_expression -> INT_LITERAL
#line 280 "RT.y"
    {
        CurrentSemanticValue.Expression = new IntLiteralExpression(ValueStack[ValueStack.Depth-1].IntLiteral);
    }
#line default
        break;
      case 71: // literal_expression -> FLOAT_LITERAL
#line 284 "RT.y"
    {
        CurrentSemanticValue.Expression = new FloatLiteralExpression(ValueStack[ValueStack.Depth-1].FloatLiteral);
    }
#line default
        break;
      case 72: // literal_expression -> VECTOR_LITERAL
#line 288 "RT.y"
    {
        CurrentSemanticValue.Expression = new VectorLiteralExpression(ValueStack[ValueStack.Depth-1].VectorLiteral);
    }
#line default
        break;
      case 73: // function_call_expression -> IDENTIFIER, '(', expression_list, ')'
#line 293 "RT.y"
    {
        CurrentSemanticValue.Expression = new FunctionCallExpression(ValueStack[ValueStack.Depth-4].Identifier, ValueStack[ValueStack.Depth-2].ExpressionList);
    }
#line default
        break;
      case 75: // expression_list -> expression
#line 299 "RT.y"
    {
        CurrentSemanticValue.ExpressionList = new List<Expression>{ValueStack[ValueStack.Depth-1].Expression};
    }
#line default
        break;
      case 76: // expression_list -> expression_list, ',', expression
#line 303 "RT.y"
    {
        ValueStack[ValueStack.Depth-3].ExpressionList.Add(ValueStack[ValueStack.Depth-1].Expression);
        CurrentSemanticValue.ExpressionList = ValueStack[ValueStack.Depth-3].ExpressionList;
    }
#line default
        break;
    }
#pragma warning restore 162, 1522
  }

  protected override string TerminalToString(int terminal)
  {
    if (aliases != null && aliases.ContainsKey(terminal))
        return aliases[terminal];
    else if (((Tokens)terminal).ToString() != terminal.ToString(CultureInfo.InvariantCulture))
        return ((Tokens)terminal).ToString();
    else
        return CharToString((char)terminal);
  }

#line 309 "RT.y"
public Parser(Scanner scnr) : base(scnr) { }
#line default
}
}
