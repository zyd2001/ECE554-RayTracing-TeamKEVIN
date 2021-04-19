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

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
        }
    }

    class IntLiteralExpression : Expression
    {
        int i;
        internal IntLiteralExpression(LexLocation location, int i) : base(location)
        {
            this.i = i;
        }

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
        }
    }
    class FloatLiteralExpression : Expression
    {
        float f;
        internal FloatLiteralExpression(LexLocation location, float f) : base(location)
        {
            this.f = f;
        }

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
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

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
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

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
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

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
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

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
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

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
        }
    }

    class IdentifierExpression : Expression
    {
        string identifier;
        internal IdentifierExpression(LexLocation location, string id) : base(location)
        {
            identifier = id;
        }

        internal override void StaticCheck(bool topLevel)
        {
            throw new System.NotImplementedException();
        }
    }
}