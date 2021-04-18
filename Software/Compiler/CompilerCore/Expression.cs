using System.Collections.Generic;
using System.Numerics;
using QUT.Gppg;

namespace CompilerCore
{
    using ExpressionList = List<Expression>;
    abstract class Expression : ASTNode
    {
        internal Expression(LexLocation location) : base(location) { }
    }

    class IntLiteralExpression : Expression
    {
        int i;
        internal IntLiteralExpression(LexLocation location, int i) : base(location)
        {
            this.i = i;
        }
    }
    class FloatLiteralExpression : Expression
    {
        float f;
        internal FloatLiteralExpression(LexLocation location, float f) : base(location)
        {
            this.f = f;
        }
    }

    class VectorLiteralExpression : Expression
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
    }

    class FunctionCallExpression : Expression
    {
        string identifier;
        ExpressionList expressionList;
        internal FunctionCallExpression(LexLocation location, string id, ExpressionList expList) : base(location)
        {
            identifier = id;
            expressionList = expList;
        }
    }

    class IdentifierExpression : Expression
    {
        string identifier;
        internal IdentifierExpression(LexLocation location, string id) : base(location)
        {
            identifier = id;
        }
    }
}