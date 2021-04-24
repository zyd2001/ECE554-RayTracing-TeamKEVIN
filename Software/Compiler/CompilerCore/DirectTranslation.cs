using System;
using System.Collections.Generic;
using System.Numerics;

namespace CompilerCore
{
    partial class StatementList
    {
        internal override string Generate(DirectTranslation trans)
        {
            foreach (var item in list)
                item.Generate(trans);
            return null;
        }

        internal bool translate(DirectTranslation translation)
        {
            Symbol main = globalTable.LocalSearch("main");
            if (main is null)
            {
                Console.Error.WriteLine("No main function");
                return false;
            }
            foreach (var item in globalTable.LocalScope)
            {
                if (!item.Value.IsFunction) // global variable
                {

                }
            }
            main.FunctionDefinition.Generate(translation);
            translation.AddAssembly("Fin");
            return true;
        }
    }

    partial class FunctionDefinitionStatement
    {
        internal override string Generate(DirectTranslation translation)
        {
            translation.AddLabel(functionName);

            statementList.Generate(translation);
            return null;
        }
    }

    partial class DeclarationStatement
    {
        internal override string Generate(DirectTranslation list)
        {
            return declarationList.Generate(list);
        }
    }

    partial class DeclarationList
    {
        internal override string Generate(DirectTranslation trans)
        {
            foreach (var item in list)
                item.Generate(trans);
            return null;
        }
    }

    partial class DeclarationItem
    {
        internal override string Generate(DirectTranslation translation)
        {
            if (arraySize <= 0)
            {
                if (initializer is not null)
                {
                    string tempVar = initializer.Generate(translation);
                    if (type == Type.VECTOR)
                        translation.AddAssembly("v_mov", scopedIdentifier, tempVar);
                    else
                        translation.AddAssembly("s_mov", scopedIdentifier, tempVar);
                }
            }
            else // array
            {
                // translation.AddAssembly("s_mov", identifier, tempVar);
            }
            return null;
        }
    }

    partial class AssignmentStatement
    {
        internal override string Generate(DirectTranslation translation)
        {
            string rhsVar = right.Generate(translation);
            if (left is IdentifierExpression)
            {
                if (leftType == Type.VECTOR)
                    translation.AddAssembly("v_mov", left.Generate(translation), rhsVar);
                else
                    translation.AddAssembly("s_mov", left.Generate(translation), rhsVar);
            }
            else
            {
                IndexExpression ie = (left as IndexExpression);
                string pointer = ie.expression.Generate(translation);
                string index = ie.indexExpression.Generate(translation);
                if (ie.valueType == Type.VECTOR)
                {
                    translation.AddAssembly("v_get_from_s", pointer, rhsVar,
                        (ie.indexExpression as IntLiteralExpression).i.ToString());
                }
                else if (ie.valueType == Type.VECTOR_POINTER)
                {
                    translation.AddAssembly("ii_muli", index, index, "16");
                    translation.AddAssembly("ii_add", pointer, index, pointer);
                    translation.AddAssembly("v_store_16byte", rhsVar, pointer, "0");
                }
                else
                {
                    translation.AddAssembly("ii_muli", index, index, "4");
                    translation.AddAssembly("ii_add", pointer, index, pointer);
                    translation.AddAssembly("s_store_4byte", rhsVar, pointer, "0");
                }
            }
            return null;
        }
    }

    partial class BlockStatement
    {
        internal override string Generate(DirectTranslation list)
        {
            return statementList.Generate(list);
        }
    }

    partial class IfStatement
    {
        internal override string Generate(DirectTranslation translation)
        {
            string trueLabel = "L" + LabelCounter;
            string skipLabel = "L" + LabelCounter;
            if (condition is BinaryExpression)
            {
                BinaryExpression be = condition as BinaryExpression;
                if (be.type < BinaryExpression.Type.EQ || be.type > BinaryExpression.Type.LE)
                {
                    string cond = condition.Generate(translation);
                    translation.AddAssembly("cmp_i", cond, "RS0");
                    translation.AddBranch("bne", trueLabel);
                }
                else
                {
                    string temp1 = be.exp1.Generate(translation);
                    string temp2 = be.exp2.Generate(translation);
                    if (be.type1 == Type.INT && be.type2 == Type.INT)
                        translation.AddAssembly("cmp_i", temp1, temp2);
                    else
                    {
                        if (be.type1 == Type.INT)
                            translation.AddAssembly("s_itof", temp1, temp1);
                        if (be.type2 == Type.INT)
                            translation.AddAssembly("s_itof", temp2, temp2);
                        translation.AddAssembly("cmp_f", temp1, temp2);
                    }
                    switch (be.type)
                    {
                        case BinaryExpression.Type.EQ:
                            translation.AddBranch("be", trueLabel);
                            break;
                        case BinaryExpression.Type.NE:
                            translation.AddBranch("bne", trueLabel);
                            break;
                        case BinaryExpression.Type.GT:
                            translation.AddBranch("bg", trueLabel);
                            break;
                        case BinaryExpression.Type.GE:
                            translation.AddBranch("bge", trueLabel);
                            break;
                        case BinaryExpression.Type.LT:
                            translation.AddBranch("bl", trueLabel);
                            break;
                        case BinaryExpression.Type.LE:
                            translation.AddBranch("ble", trueLabel);
                            break;
                    }
                }
            }
            else
            {
                string cond = condition.Generate(translation);
                translation.AddAssembly("cmp_i", cond, "RS0");
                translation.AddBranch("bne", trueLabel);
            }
            if (elseStatement is not null)
                elseStatement.Generate(translation);
            translation.AddBranch("jmp", skipLabel);
            translation.AddLabel(trueLabel);
            statement.Generate(translation);
            translation.AddLabel(skipLabel);
            return null;
        }
    }

    partial class LoopStatement
    {
        internal override string Generate(DirectTranslation translation)
        {
            string begin = "L" + LabelCounter;
            string end = "L" + LabelCounter;
            string realBegin = "L" + LabelCounter;
            NewLoop(begin, end);
            if (initialStatement is not null)
                initialStatement.Generate(translation);
            conditionHelper(translation, end, realBegin, true);
            translation.AddLabel(realBegin);
            loopBody.Generate(translation);
            translation.AddLabel(begin);
            if (iterateStatement is not null)
                iterateStatement.Generate(translation);
            conditionHelper(translation, end, realBegin, false);
            translation.AddLabel(end);
            EndLoop();
            return null;
        }

        private void conditionHelper(DirectTranslation translation, string end, string realBegin, bool fisrt)
        {
            if (condition is null)
            {
                if (!fisrt)
                    translation.AddBranch("jmp", realBegin);
            }
            else
            {
                if (condition is BinaryExpression)
                {
                    BinaryExpression be = condition as BinaryExpression;
                    if (be.type < BinaryExpression.Type.EQ || be.type > BinaryExpression.Type.LE)
                    {
                        string cond = condition.Generate(translation);
                        translation.AddAssembly("cmp_i", cond, "RS0");
                        if (fisrt)
                            translation.AddBranch("be", end);
                        else
                            translation.AddBranch("bne", realBegin);
                    }
                    else
                    {
                        string temp1 = be.exp1.Generate(translation);
                        string temp2 = be.exp2.Generate(translation);
                        if (be.type1 == Type.INT && be.type2 == Type.INT)
                            translation.AddAssembly("cmp_i", temp1, temp2);
                        else
                        {
                            if (be.type1 == Type.INT)
                                translation.AddAssembly("s_itof", temp1, temp1);
                            if (be.type2 == Type.INT)
                                translation.AddAssembly("s_itof", temp2, temp2);
                            translation.AddAssembly("cmp_f", temp1, temp2);
                        }
                        switch (be.type)
                        {
                            case BinaryExpression.Type.EQ:
                                if (fisrt)
                                    translation.AddBranch("bne", end);
                                else
                                    translation.AddBranch("be", realBegin);
                                break;
                            case BinaryExpression.Type.NE:
                                if (fisrt)
                                    translation.AddBranch("be", end);
                                else
                                    translation.AddBranch("bne", realBegin);
                                break;
                            case BinaryExpression.Type.GT:
                                if (fisrt)
                                    translation.AddBranch("ble", end);
                                else
                                    translation.AddBranch("bg", realBegin);
                                break;
                            case BinaryExpression.Type.GE:
                                if (fisrt)
                                    translation.AddBranch("bl", end);
                                else
                                    translation.AddBranch("bge", realBegin);
                                break;
                            case BinaryExpression.Type.LT:
                                if (fisrt)
                                    translation.AddBranch("bge", end);
                                else
                                    translation.AddBranch("bl", realBegin);
                                break;
                            case BinaryExpression.Type.LE:
                                if (fisrt)
                                    translation.AddBranch("bg", end);
                                else
                                    translation.AddBranch("ble", realBegin);
                                break;
                        }
                    }
                }
                else
                {
                    string cond = condition.Generate(translation);
                    translation.AddAssembly("cmp_i", cond, "RS0");
                    if (fisrt)
                        translation.AddBranch("be", end);
                    else
                        translation.AddBranch("bne", realBegin);
                }
            }
        }
    }

    partial class ControlStatement
    {
        internal override string Generate(DirectTranslation translation)
        {
            switch (type)
            {
                case Type.BREAK:
                    translation.AddBranch("jmp", CurrentLoopEndLabel);
                    break;
                case Type.CONTINUE:
                    translation.AddBranch("jmp", CurrentLoopBeginLabel);
                    break;
                default:
                    break;
            }
            return null;
        }
    }

    partial class ReturnStatement
    {
        internal override string Generate(DirectTranslation translation)
        {
            if (expression is not null)
            {
                string tempVar = expression.Generate(translation);
                if (function.returnType == Type.VECTOR)
                    translation.AddAssembly("v_mov", ".V" + function.functionName, tempVar);
                else
                    translation.AddAssembly("s_mov", ".S" + function.functionName, tempVar);
            }
            translation.AddAssembly("ret");
            return null;
        }
    }

    partial class IdentifierExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            return LinkedSymbol.Identifier; // scoped identifier
        }
    }

    partial class LiteralExpression
    {
        protected static void LiteralHelper(DirectTranslation translation, string tempScalar, int i)
        {
            ushort high = (ushort)(i >> 16);
            ushort low = (ushort)i;
            if (i == 0)
                translation.AddAssembly("xor", tempScalar, tempScalar);
            else
            {
                translation.AddAssembly("s_write_low", tempScalar, (low).ToString());
                translation.AddAssembly("s_write_high", tempScalar, (high).ToString());
            }
        }

        abstract internal (int type, int i, float f, Vector4 v) GetLiteral();
    }
    partial class IntLiteralExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            string tempVar = ".S" + VariableCounter;
            LiteralHelper(translation, tempVar, i);
            return tempVar;
        }

        internal override (int type, int i, float f, Vector4 v) GetLiteral()
        {
            return (0, i, 0, Vector4.Zero);
        }
    }

    partial class FloatLiteralExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            string tempVar = ".S" + VariableCounter;
            int i = BitConverter.SingleToInt32Bits(f);
            LiteralHelper(translation, tempVar, i);
            return tempVar;
        }

        internal override (int type, int i, float f, Vector4 v) GetLiteral()
        {
            return (1, 0, f, Vector4.Zero);
        }
    }

    partial class VectorLiteralExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            string tempScalar = ".S" + VariableCounter;
            string tempVar = ".V" + VariableCounter;
            int i;
            i = BitConverter.SingleToInt32Bits(vector.X);
            LiteralHelper(translation, tempScalar, i);
            translation.AddAssembly("v_get_from_s", tempVar, tempScalar, "0");
            i = BitConverter.SingleToInt32Bits(vector.Y);
            LiteralHelper(translation, tempScalar, i);
            translation.AddAssembly("v_get_from_s", tempVar, tempScalar, "1");
            i = BitConverter.SingleToInt32Bits(vector.Z);
            LiteralHelper(translation, tempScalar, i);
            translation.AddAssembly("v_get_from_s", tempVar, tempScalar, "2");
            i = BitConverter.SingleToInt32Bits(vector.W);
            LiteralHelper(translation, tempScalar, i);
            translation.AddAssembly("v_get_from_s", tempVar, tempScalar, "3");
            return tempVar;
        }

        internal override (int type, int i, float f, Vector4 v) GetLiteral()
        {
            return (2, 0, 0, vector);
        }
    }

    partial class VectorConstructorExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            string tempVar = ".V" + VariableCounter;
            string tempScalar;
            for (int i = 0; i < 4; i++)
            {
                tempScalar = expressions[i].Generate(translation);
                if (types[i] == Type.INT)
                    translation.AddAssembly("s_itof", tempScalar, tempScalar);
                translation.AddAssembly("v_get_from_s", tempVar, tempScalar, i.ToString());
            }
            return tempVar;
        }
    }

    partial class BinaryExpression
    {
        static Vector4 getVectorFromLiteral((int type, int i, float f, Vector4 v) l)
        {
            switch (l.type)
            {
                case 0:
                    return new Vector4(l.i);
                case 1:
                    return new Vector4(l.f);
                case 2:
                    return l.v;
            }
            return Vector4.Zero;
        }
        static float getFloatFromLiteral((int type, int i, float f, Vector4 v) l)
        {
            switch (l.type)
            {
                case 0:
                    return l.i;
                case 1:
                    return l.f;
            }
            return float.NaN;
        }
        // internal (string result, bool success) constantOptimize(DirectTranslation translation)
        // {
        //     if (exp1 is LiteralExpression && exp2 is LiteralExpression)
        //         if (type1 == CompilerCore.Type.VECTOR)
        //         {
        //             var vector = (exp1 as VectorLiteralExpression).GetLiteral().v;
        //             var literal = (exp2 as LiteralExpression).GetLiteral();
        //             switch (type)
        //             {
        //                 case Type.ADD:
        //                     vector += getVectorFromLiteral(literal);
        //                     break;
        //                 case Type.SUB:
        //                     vector -= getVectorFromLiteral(literal);
        //                     break;
        //                 case Type.MUL:
        //                     vector *= getVectorFromLiteral(literal);
        //                     break;
        //                 case Type.DIV:
        //                     vector /= getVectorFromLiteral(literal);
        //                     break;
        //             }
        //             vector *= getVectorFromLiteral(literal);
        //             string tempVar = ".V" + VariableCounter;
        //             translation.AddAssembly("");
        //         }
        //         else
        //         {
        //             if (resultType == CompilerCore.Type.FLOAT)
        //             {

        //             }
        //         }
        // }

        internal override string Generate(DirectTranslation translation)
        {
            // var result = constantOptimize(translation);
            // if (result.success)
            //     return result.result;

            string temp1 = exp1.Generate(translation);
            string temp2 = exp2.Generate(translation);
            string tempVar;
            if (temp1[2] == '.') // temp1 is not temporary
                tempVar = $".{temp1[1]}{VariableCounter}";
            else
                tempVar = temp1;
            if (type >= Type.EQ && type <= Type.LE)
            {
                if (type1 == CompilerCore.Type.FLOAT || type2 == CompilerCore.Type.FLOAT)
                    translation.AddAssembly("cmp_f", temp1, temp2);
                else
                    translation.AddAssembly("cmp_i", temp1, temp2);
                string skipLabel = "L" + LabelCounter;
                translation.AddAssembly("ii_addi", tempVar, "RS0", "1"); // !=
                switch (type)
                {
                    case Type.EQ:
                        translation.AddBranch("be", skipLabel);
                        break;
                    case Type.NE:
                        translation.AddBranch("bne", skipLabel);
                        break;
                    case Type.GT:
                        translation.AddBranch("bg", skipLabel);
                        break;
                    case Type.GE:
                        translation.AddBranch("bge", skipLabel);
                        break;
                    case Type.LT:
                        translation.AddBranch("bl", skipLabel);
                        break;
                    case Type.LE:
                        translation.AddBranch("ble", skipLabel);
                        break;
                    default:
                        break;
                }
                translation.AddAssembly("xor", tempVar, tempVar, tempVar);
                translation.AddLabel(skipLabel);
            }
            else
                switch (resultType)
                {
                    case CompilerCore.Type.INT: // two int
                        intHelper(translation, tempVar, temp1, temp2);
                        break;
                    case CompilerCore.Type.FLOAT:
                        floatHelper(translation, tempVar, temp1, temp2);
                        break;
                    case CompilerCore.Type.VECTOR:
                        vectorHelper(translation, tempVar, temp1, temp2);
                        break;
                    default:
                        if (type1 <= CompilerCore.Type.VECTOR_POINTER)
                            intHelper(translation, tempVar, temp1, temp2);
                        break;
                }
            return tempVar;
        }

        private void intHelper(DirectTranslation translation, string tempVar, string temp1, string temp2)
        {
            switch (type)
            {
                case Type.ADD:
                    translation.AddAssembly("ii_add", tempVar, temp1, temp2);
                    break;
                case Type.SUB:
                    translation.AddAssembly("ii_sub", tempVar, temp1, temp2);
                    break;
                case Type.MUL:
                    translation.AddAssembly("ii_mul", tempVar, temp1, temp2);
                    break;
                case Type.DIV:
                    translation.AddAssembly("ii_div", tempVar, temp1, temp2);
                    break;
                case Type.MOD:
                    translation.AddAssembly("ii_mod", tempVar, temp1, temp2);
                    break;
                case Type.AND:
                    translation.AddAssembly("and", tempVar, temp1, temp2);
                    break;
                case Type.OR:
                    translation.AddAssembly("or", tempVar, temp1, temp2);
                    break;
                case Type.XOR:
                    translation.AddAssembly("xor", tempVar, temp1, temp2);
                    break;
                default:
                    break;
            }
        }

        private void vectorHelper(DirectTranslation translation, string tempVar, string temp1, string temp2)
        {
            if (type2 == CompilerCore.Type.INT)
            {
                translation.AddAssembly("s_itof", temp2, temp2);
                switch (type)
                {
                    case Type.ADD:
                        translation.AddAssembly("vf_add", tempVar, temp1, temp2);
                        break;
                    case Type.SUB:
                        translation.AddAssembly("vf_sub", tempVar, temp1, temp2);
                        break;
                    case Type.MUL:
                        translation.AddAssembly("vf_mul", tempVar, temp1, temp2);
                        break;
                    case Type.DIV:
                        translation.AddAssembly("vf_div", tempVar, temp1, temp2);
                        break;
                    default:
                        break;
                }
            }
            else
            {
                switch (type)
                {
                    case Type.ADD:
                        translation.AddAssembly("vv_add", tempVar, temp1, temp2);
                        break;
                    case Type.SUB:
                        translation.AddAssembly("vv_sub", tempVar, temp1, temp2);
                        break;
                    case Type.MUL:
                        translation.AddAssembly("vv_mul_ele", tempVar, temp1, temp2);
                        break;
                    case Type.DIV:
                        translation.AddAssembly("vv_div", tempVar, temp1, temp2);
                        break;
                }
            }
        }

        private void floatHelper(DirectTranslation translation, string tempVar, string temp1, string temp2)
        {
            if (type1 == CompilerCore.Type.INT)
                translation.AddAssembly("s_itof", temp1, temp1);
            if (type2 == CompilerCore.Type.INT)
                translation.AddAssembly("s_itof", temp2, temp2);
            switch (type)
            {
                case Type.ADD:
                    translation.AddAssembly("ff_add", tempVar, temp1, temp2);
                    break;
                case Type.SUB:
                    translation.AddAssembly("ff_sub", tempVar, temp1, temp2);
                    break;
                case Type.MUL:
                    translation.AddAssembly("ff_mul", tempVar, temp1, temp2);
                    break;
                case Type.DIV:
                    translation.AddAssembly("ff_div", tempVar, temp1, temp2);
                    break;
                default:
                    break;
            }
        }
    }

    partial class UnaryExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            string temp = exp.Generate(translation);
            string tempVar;
            if (temp[2] == '.') // temp is not temporary
                tempVar = $".{temp[1]}{VariableCounter}";
            else
                tempVar = temp;
            switch (expType)
            {
                case CompilerCore.Type.INT:
                    switch (type)
                    {
                        case Type.NEGATE:
                            translation.AddAssembly("ii_sub", tempVar, "RS0", temp);
                            break;
                        case Type.NOT:
                            {
                                string skipLabel = "L" + LabelCounter;
                                translation.AddAssembly("cmp_i", "RS0", temp);
                                translation.AddAssembly("xor", tempVar, tempVar, tempVar); // != 0
                                translation.AddBranch("bne", skipLabel);
                                translation.AddAssembly("ii_addi", tempVar, "RS0", "1"); // == 0
                                translation.AddLabel(skipLabel);
                            }
                            break;
                        case Type.BITWISE_NOT:
                            translation.AddAssembly("not", tempVar, temp);
                            break;
                        default:
                            break;
                    }
                    break;
                case CompilerCore.Type.FLOAT:
                    translation.AddAssembly("ff_sub", tempVar, "RS0", temp);
                    break;
                case CompilerCore.Type.VECTOR:
                    translation.AddAssembly("vv_sub", tempVar, "RV0", temp);
                    break;
            }
            return tempVar;
        }
    }

    partial class IndexExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            string pointer = expression.Generate(translation);
            string index = indexExpression.Generate(translation);
            string tempVar = valueType == Type.VECTOR_POINTER ? $".V{VariableCounter}" :
               pointer[2] == '.' ? $".S{VariableCounter}" : pointer;
            if (valueType == Type.VECTOR)
            {
                translation.AddAssembly("s_get_from_v", tempVar, pointer,
                    (indexExpression as IntLiteralExpression).i.ToString());
            }
            else if (valueType == Type.VECTOR_POINTER)
            {
                translation.AddAssembly("ii_muli", index, index, "16");
                translation.AddAssembly("ii_add", pointer, index, pointer);
                translation.AddAssembly("v_load_16byte", tempVar, pointer, "0");
            }
            else
            {
                translation.AddAssembly("ii_muli", index, index, "4");
                translation.AddAssembly("ii_add", pointer, index, pointer);
                translation.AddAssembly("s_load_4byte", tempVar, pointer, "0");
            }
            return tempVar;
        }
    }

    partial class FunctionCallExpression
    {
        internal override string Generate(DirectTranslation translation)
        {
            string tempVar = func.Type == Type.VECTOR ? ".V" : ".S" + VariableCounter;
            expressionList.Generate(translation);
            translation.AddBranch("jmp_link", identifier);
            //
            return tempVar;
        }
    }

    partial class ExpressionList
    {
        internal override string Generate(DirectTranslation translation)
        {
            throw new NotImplementedException();
        }
    }
}