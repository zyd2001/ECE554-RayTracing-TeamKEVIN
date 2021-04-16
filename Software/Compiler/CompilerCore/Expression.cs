using System.Collections.Generic;
using System.Numerics;

namespace CompilerCore
{
    using ExpressionList = List<Expression>;
    abstract class Expression : ASTNode { }

    abstract class ArithmeticExpression : Expression { }

    abstract class LiteralExpression : Expression { }

    class IntLiteralExpression : LiteralExpression
    {
        int i;
        internal IntLiteralExpression(int i)
        {
            this.i = i;
        }
    }
    class FloatLiteralExpression : LiteralExpression
    {
        float f;
        internal FloatLiteralExpression(float f)
        {
            this.f = f;
        }
    }

    class VectorLiteralExpression : LiteralExpression
    {
        Vector4 vector;
        internal VectorLiteralExpression(string text)
        {
            var splits = text[1..^1].Split(",");
            float[] floats = new float[4];
            for (int i = 0; i < 4; i++)
                floats[i] = float.Parse(splits[i]);
            vector = new Vector4(floats[0], floats[1], floats[2], floats[3]);
        }
    }
    class BinaryExpression : ArithmeticExpression
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
        internal BinaryExpression(Type type, Expression e1, Expression e2)
        {
            this.type = type;
            exp1 = e1;
            exp2 = e2;
        }
    }

    class UnaryExpression : ArithmeticExpression
    {
        Type type;
        Expression exp;
        internal enum Type
        {
            NOT, NEGATE
        }
        internal UnaryExpression(Type type, Expression e1)
        {
            this.type = type;
            exp = e1;
        }
    }

    class IndexExpression : Expression
    {
        Expression expression;
        Expression indexExpression;
        internal IndexExpression(Expression exp, Expression index)
        {
            expression = exp;
            indexExpression = index;
        }
    }

    class FunctionCallExpression : Expression
    {
        string identifier;
        ExpressionList expressionList;
        internal FunctionCallExpression(string id, ExpressionList expList)
        {
            identifier = id;
            expressionList = expList;
        }
    }

    class IdentifierExpression : Expression
    {
        string identifier;
        internal IdentifierExpression(string id)
        {
            identifier = id;
        }
    }
}