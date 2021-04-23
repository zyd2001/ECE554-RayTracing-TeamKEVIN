using System;
using System.Collections.Generic;

namespace CompilerCore
{
    partial class StatementList
    {
        internal override string generate(DirectTranslation trans)
        {
            foreach (var item in list)
                item.generate(trans);
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
            main.FunctionDefinition.generate(translation);
            translation.AddAssembly("Fin");
            return true;
        }
    }

    partial class FunctionDefinitionStatement
    {
        internal override string generate(DirectTranslation translation)
        {
            translation.AddLabel(functionName);

            statementList.generate(translation);
            return null;
        }
    }

    partial class DeclarationStatement
    {
        internal override string generate(DirectTranslation list)
        {
            return declarationList.generate(list);
        }
    }

    partial class DeclarationList
    {
        internal override string generate(DirectTranslation trans)
        {
            foreach (var item in list)
                item.generate(trans);
            return null;
        }
    }

    partial class DeclarationItem
    {
        internal override string generate(DirectTranslation translation)
        {
            if (arraySize <= 0)
            {
                if (initializer is not null)
                {
                    string tempVar = initializer.generate(translation);
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
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = right.generate(translation);
            if (left is IdentifierExpression)
            {
                if (leftType == Type.VECTOR)
                    translation.AddAssembly("v_mov", left.generate(translation), tempVar);
                else
                    translation.AddAssembly("s_mov", left.generate(translation), tempVar);
            }
            else
            {
                IndexExpression ie = (left as IndexExpression);
                string pointer = ie.expression.generate(translation);
                string index = ie.indexExpression.generate(translation);
                if (ie.valueType == Type.VECTOR)
                {
                    translation.AddAssembly("v_get_from_s", pointer, tempVar,
                        (ie.indexExpression as IntLiteralExpression).i.ToString());
                }
                else if (ie.valueType == Type.VECTOR_POINTER)
                {
                    translation.AddAssembly("ii_muli", index, index, "16");
                    translation.AddAssembly("ii_add", pointer, index, pointer);
                    translation.AddAssembly("v_store_16byte", tempVar, pointer, "0");
                }
                else
                {
                    translation.AddAssembly("ii_muli", index, index, "4");
                    translation.AddAssembly("ii_add", pointer, index, pointer);
                    translation.AddAssembly("s_store_4byte", tempVar, pointer, "0");
                }
            }
            return null;
        }
    }

    partial class BlockStatement
    {
        internal override string generate(DirectTranslation list)
        {
            return statementList.generate(list);
        }
    }

    partial class IfStatement
    {
        internal override string generate(DirectTranslation translation)
        {
            string trueLabel = "L" + LabelCounter;
            string skipLabel = "L" + LabelCounter;
            if (condition is BinaryExpression)
            {
                BinaryExpression be = condition as BinaryExpression;
                if (be.type < BinaryExpression.Type.EQ || be.type > BinaryExpression.Type.LE)
                {
                    string cond = condition.generate(translation);
                    translation.AddAssembly("cmp_i", cond, "R0");
                    translation.AddBranch("bne", trueLabel);
                }
                else
                {
                    string temp1 = be.exp1.generate(translation);
                    string temp2 = be.exp2.generate(translation);
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
                string cond = condition.generate(translation);
                translation.AddAssembly("cmp_i", cond, "R0");
                translation.AddBranch("bne", trueLabel);
            }
            if (elseStatement is not null)
                elseStatement.generate(translation);
            translation.AddBranch("jmp", skipLabel);
            translation.AddLabel(trueLabel);
            statement.generate(translation);
            translation.AddLabel(skipLabel);
            return null;
        }
    }

    partial class LoopStatement
    {
        internal override string generate(DirectTranslation translation)
        {
            string begin = "L" + LabelCounter;
            string end = "L" + LabelCounter;
            string realBegin = "L" + LabelCounter;
            NewLoop(begin, end);
            if (initialStatement is not null)
                initialStatement.generate(translation);
            conditionHelper(translation, end, realBegin, true);
            translation.AddLabel(realBegin);
            loopBody.generate(translation);
            translation.AddLabel(begin);
            if (iterateStatement is not null)
                iterateStatement.generate(translation);
            conditionHelper(translation, end, realBegin, false);
            translation.AddLabel(end);
            EndLoop();
            return null;
        }

        private void conditionHelper(DirectTranslation translation, string end, string realBegin, bool fisrt)
        {
            if (condition is BinaryExpression)
            {
                BinaryExpression be = condition as BinaryExpression;
                if (be.type < BinaryExpression.Type.EQ || be.type > BinaryExpression.Type.LE)
                {
                    string cond = condition.generate(translation);
                    translation.AddAssembly("cmp_i", cond, "R0");
                    if (fisrt)
                        translation.AddBranch("be", end);
                    else
                        translation.AddBranch("bne", realBegin);
                }
                else
                {
                    string temp1 = be.exp1.generate(translation);
                    string temp2 = be.exp2.generate(translation);
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
                string cond = condition.generate(translation);
                translation.AddAssembly("cmp_i", cond, "R0");
                if (fisrt)
                    translation.AddBranch("be", end);
                else
                    translation.AddBranch("bne", realBegin);
            }
        }
    }

    partial class ControlStatement
    {
        internal override string generate(DirectTranslation translation)
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
        internal override string generate(DirectTranslation translation)
        {
            if (expression is not null)
            {
                string tempVar = expression.generate(translation);
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
        internal override string generate(DirectTranslation translation)
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
    }
    partial class IntLiteralExpression
    {
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = ".S" + VaraibleCounter;
            LiteralHelper(translation, tempVar, i);
            return tempVar;
        }
    }

    partial class FloatLiteralExpression
    {
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = ".S" + VaraibleCounter;
            int i = BitConverter.SingleToInt32Bits(f);
            LiteralHelper(translation, tempVar, i);
            return tempVar;
        }
    }

    partial class VectorLiteralExpression
    {
        internal override string generate(DirectTranslation translation)
        {
            string tempScalar = ".S" + VaraibleCounter;
            string tempVar = ".V" + VaraibleCounter;
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
    }

    partial class VectorConstructorExpression
    {
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = ".V" + VaraibleCounter;
            string tempScalar;
            for (int i = 0; i < 4; i++)
            {
                tempScalar = expressions[i].generate(translation);
                if (types[i] == Type.INT)
                    translation.AddAssembly("s_itof", tempScalar, tempScalar);
                translation.AddAssembly("v_get_from_s", tempVar, tempScalar, i.ToString());
            }
            return tempVar;
        }
    }

    partial class BinaryExpression
    {
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = resultType == CompilerCore.Type.VECTOR ? ".V" : ".S" + VaraibleCounter;
            string temp1 = exp1.generate(translation);
            string temp2 = exp2.generate(translation);
            if (type >= Type.EQ && type <= Type.LE)
            {
                if (type1 == CompilerCore.Type.FLOAT || type2 == CompilerCore.Type.FLOAT)
                    translation.AddAssembly("cmp_f", temp1, temp2);
                else
                    translation.AddAssembly("cmp_i", temp1, temp2);
                string skipLabel = "L" + LabelCounter;
                translation.AddAssembly("ii_addi", tempVar, "R0", "1"); // !=
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
                        translation.AddAssembly("vv_mul", tempVar, temp1, temp2);
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
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = expType == CompilerCore.Type.VECTOR ? ".V" : ".S" + VaraibleCounter;
            string temp = exp.generate(translation);
            switch (expType)
            {
                case CompilerCore.Type.INT:
                    switch (type)
                    {
                        case Type.NEGATE:
                            translation.AddAssembly("ii_sub", tempVar, "R0", temp);
                            break;
                        case Type.NOT:
                            {
                                string skipLabel = "L" + LabelCounter;
                                translation.AddAssembly("cmp_i", "R0", temp);
                                translation.AddAssembly("xor", tempVar, tempVar, tempVar); // != 0
                                translation.AddBranch("bne", skipLabel);
                                translation.AddAssembly("ii_addi", tempVar, "R0", "1"); // == 0
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
                    translation.AddAssembly("ff_sub", tempVar, "R0", temp);
                    break;
                case CompilerCore.Type.VECTOR:
                    translation.AddAssembly("vv_sub", tempVar, "R0", temp);
                    break;
            }
            return tempVar;
        }
    }

    partial class IndexExpression
    {
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = valueType == Type.VECTOR_POINTER ? ".V" : ".S" + VaraibleCounter;
            string pointer = expression.generate(translation);
            string index = indexExpression.generate(translation);
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
        internal override string generate(DirectTranslation translation)
        {
            string tempVar = func.Type == Type.VECTOR ? ".V" : ".S" + VaraibleCounter;
            expressionList.generate(translation);
            translation.AddBranch("jmp_link", identifier);
            //
            return tempVar;
        }
    }

    partial class ExpressionList
    {
        internal override string generate(DirectTranslation translation)
        {
            throw new NotImplementedException();
        }
    }
}