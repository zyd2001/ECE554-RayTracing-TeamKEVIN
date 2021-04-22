using System.Collections.Generic;
using System.Numerics;
using QUT.Gppg;

namespace CompilerCore
{
    abstract class Expression : ASTNode
    {
        internal Expression(LexLocation location) : base(location) { }
    }

    class ExpressionList : ASTNodeList<Expression, ExpressionList>
    {
        internal ExpressionList(LexLocation location) : base(location) { }
        internal ExpressionList(LexLocation location, Expression node) : base(location, node) { }

        internal override bool NameAnalysis(SymbolTable table)
        {
            bool pass = true;
            foreach (var item in list)
                pass &= item.NameAnalysis(table);
            return pass;
        }

        internal override bool TypeCheck(out Type type)
        {
            throw new System.NotImplementedException();
        }

        internal bool TypeCheckArguments(List<Type> parametersType)
        {
            if (list.Count != parametersType.Count)
            {
                Error("Arguments number doesn't match");
                return false;
            }
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].TypeCheck(out Type type))
                {
                    if (type != parametersType[i])
                    {
                        Error($"Argument type {TypeString(type)} doesn't match with" +
                            $" parameter type {TypeString(parametersType[i])}");
                        return false;
                    }
                }
            }
            return true;
        }
    }

    abstract class LiteralExpression : Expression
    {
        internal LiteralExpression(LexLocation location) : base(location) { }
    }

    class IntLiteralExpression : LiteralExpression
    {
        int i;
        internal IntLiteralExpression(LexLocation location, int i) : base(location)
        {
            this.i = i;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.INT;
            return true;
        }
    }
    class FloatLiteralExpression : LiteralExpression
    {
        float f;
        internal FloatLiteralExpression(LexLocation location, float f) : base(location)
        {
            this.f = f;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.FLOAT;
            return true;
        }
    }

    class VectorLiteralExpression : LiteralExpression
    {
        Vector4 vector;
        internal VectorLiteralExpression(LexLocation location, string text) : base(location)
        {
            var splits = text[1..^1].Split(",");
            float[] floats = new float[4];
            for (int i = 0; i < 4; i++)
                floats[i] = float.Parse(splits[i]);
            vector = new Vector4(floats[0], floats[1], floats[2], floats[3]);
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.VECTOR;
            return true;
        }
    }
    class BinaryExpression : Expression
    {
        Type type;
        Expression exp1;
        Expression exp2;
        internal enum Type
        {
            ADD, SUB, MUL, DIV, MOD,
            EQ, NE, GT, GE, LT, LE,
            AND, OR
        }
        internal BinaryExpression(LexLocation location, Type type, Expression e1, Expression e2) : base(location)
        {
            this.type = type;
            exp1 = e1;
            exp2 = e2;
        }

        internal override bool TypeCheck(out CompilerCore.Type resultType)
        {
            if (exp1.TypeCheck(out CompilerCore.Type type1))
                if (exp2.TypeCheck(out CompilerCore.Type type2))
                {
                    if (type1 != type2)
                    {
                        resultType = CompilerCore.Type.NULL;
                        Error("Binary expression has unmatched operand type " +
                            $"{TypeString(type1)} and {TypeString(type2)}");
                        return false;
                    }
                    resultType = type1;
                    return true;
                }
            resultType = CompilerCore.Type.NULL;
            return false;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return exp1.NameAnalysis(table) & exp2.NameAnalysis(table);
        }
    }

    class UnaryExpression : Expression
    {
        Type type;
        Expression exp;
        internal enum Type
        {
            NOT, NEGATE
        }
        internal UnaryExpression(LexLocation location, Type type, Expression e1) : base(location)
        {
            this.type = type;
            exp = e1;
        }

        internal override bool TypeCheck(out CompilerCore.Type resultType)
        {
            bool pass = exp.TypeCheck(out CompilerCore.Type expressionType);
            if (pass)
            {
                if (type == Type.NOT && expressionType != CompilerCore.Type.INT)
                {
                    resultType = CompilerCore.Type.NULL;
                    Error("! operator can only be used on integer or comparison expression");
                    return false;
                }
                resultType = expressionType;
                return true;
            }
            resultType = CompilerCore.Type.NULL;
            return false;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return exp.NameAnalysis(table);
        }
    }

    class IndexExpression : Expression
    {
        Expression expression;
        Expression indexExpression;
        internal IndexExpression(LexLocation location, Expression exp, Expression index) : base(location)
        {
            expression = exp;
            indexExpression = index;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return expression.NameAnalysis(table) & indexExpression.NameAnalysis(table);
        }

        internal override bool TypeCheck(out Type type)
        {
            if (indexExpression.TypeCheck(out Type indexType))
            {
                if (indexType != Type.INT)
                {
                    type = Type.NULL;
                    Error("Index must be an integer expression");
                    return false;
                }
                if (expression.TypeCheck(out Type valueType))
                {
                    type = valueType;
                    return true;
                }
            }
            type = Type.NULL;
            return false;
        }
    }

    class FunctionCallExpression : Expression
    {
        string identifier;
        ExpressionList expressionList;
        Symbol func = null;
        internal FunctionCallExpression(LexLocation location, string id, ExpressionList expList) : base(location)
        {
            identifier = id;
            expressionList = expList;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            func = table.GlobalSearch(identifier);
            if (!func?.IsFunction ?? false)
            {
                Error($"Function {identifier} not found");
                return false;
            }
            return expressionList.NameAnalysis(table);
        }

        internal override bool TypeCheck(out Type type)
        {
            if (expressionList.TypeCheckArguments(func.ParametersType))
            {
                type = func.Type;
                return true;
            }
            type = Type.NULL;
            return false;
        }
    }

    class IdentifierExpression : Expression
    {
        internal Symbol LinkedSymbol { get; set; }
        string identifier;
        internal IdentifierExpression(LexLocation location, string id) : base(location)
        {
            identifier = id;
            LinkedSymbol = null;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            Symbol symbol = table.GlobalSearch(identifier);
            if (symbol is null)
            {
                Error($"Variable {identifier} not found");
                return false;
            }
            LinkedSymbol = symbol;
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = LinkedSymbol.Type;
            return true;
        }
    }
}