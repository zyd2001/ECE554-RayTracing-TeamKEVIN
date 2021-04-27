using System.Collections.Generic;
using System.Numerics;
using QUT.Gppg;

namespace CompilerCore
{
    abstract class Expression : ASTNode
    {
        internal Expression(LexLocation location) : base(location) { }
    }

    partial class ExpressionList : ASTNodeList<Expression, ExpressionList>
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
                    if (!Statement.AssignmentTypeHelper(parametersType[i], type))
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

    class AsExpression : Expression
    {
        Expression expression;
        Type type;
        internal AsExpression(LexLocation location, Type type, Expression exp) : base(location)
        {
            this.type = type;
            expression = exp;
        }

        internal override string Generate(DirectTranslation translation)
        {
            return expression.Generate(translation);
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return expression.NameAnalysis(table);
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = type;
            expression.TypeCheck(out _);
            return true;
        }
    }

    abstract partial class LiteralExpression : Expression
    {
        internal LiteralExpression(LexLocation location) : base(location) { }
    }

    partial class IntLiteralExpression : LiteralExpression
    {
        internal int i { get; }
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
    partial class FloatLiteralExpression : LiteralExpression
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

    partial class VectorLiteralExpression : LiteralExpression
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
    partial class BinaryExpression : Expression
    {
        internal Type type;
        internal Expression exp1;
        internal Expression exp2;
        internal CompilerCore.Type resultType;
        internal CompilerCore.Type type1;
        internal CompilerCore.Type type2;
        internal enum Type
        {
            ADD, SUB, MUL, DIV, MOD,
            EQ, NE, GT, GE, LT, LE,
            AND, OR, XOR
        }
        internal BinaryExpression(LexLocation location, Type type, Expression e1, Expression e2) : base(location)
        {
            this.type = type;
            exp1 = e1;
            exp2 = e2;
        }

        CompilerCore.Type typeHelper(CompilerCore.Type type1, CompilerCore.Type type2)
        {
            if (type1 <= CompilerCore.Type.VECTOR_POINTER)
            {
                if (type2 != type1)
                {
                    if (type2 != CompilerCore.Type.INT)
                    {
                        Error("Pointer can only add or subtract an integer");
                        return CompilerCore.Type.NULL;
                    }
                }
                if (type < Type.EQ || type > Type.LE)
                {
                    Error("Pointer can only do comparison with pointer"); // no other operation allowed
                    return CompilerCore.Type.NULL;
                }
                return type1;
            }
            else
            {
                if (type2 <= CompilerCore.Type.VECTOR_POINTER)
                {
                    Error("Pointer can only add or subtract an integer");
                    return CompilerCore.Type.NULL;
                }
                if (type == Type.MOD)
                {
                    if (type1 != CompilerCore.Type.INT || type2 != CompilerCore.Type.INT)
                    {
                        Error("Mod with non-int type");
                        return CompilerCore.Type.NULL;
                    }
                    else
                        return CompilerCore.Type.INT;
                }
                if (type >= Type.EQ && type <= Type.LE)
                {
                    // if (type1 <= CompilerCore.Type.VECTOR_POINTER || type2 <= CompilerCore.Type.VECTOR_POINTER)
                    // {
                    //     if (type1 != type2)
                    //     {
                    //         Error("Comparison with different pointers");
                    //         return CompilerCore.Type.NULL;
                    //     }
                    // }
                    if (type1 == CompilerCore.Type.VECTOR || type2 == CompilerCore.Type.VECTOR)
                    {
                        Error("Cannot compare vector");
                        return CompilerCore.Type.NULL;
                    }
                    if (type1 == CompilerCore.Type.FLOAT || type2 == CompilerCore.Type.FLOAT)
                    {
                        if (type == Type.EQ || type == Type.NE)
                        {
                            Error("Cannot compare equality with float");
                            return CompilerCore.Type.NULL;
                        }
                        // if (type1 <= CompilerCore.Type.VECTOR_POINTER || type2 <= CompilerCore.Type.VECTOR_POINTER)
                        // {
                        //     Error("Cannot compare pointer with float");
                        //     return CompilerCore.Type.NULL;
                        // }
                    }
                    return CompilerCore.Type.INT;
                }
                if (type >= Type.AND)
                {
                    if (type1 != CompilerCore.Type.INT || type2 != CompilerCore.Type.INT)
                    {
                        Error("And or Or with non-int type");
                        return CompilerCore.Type.NULL;
                    }
                    else
                        return CompilerCore.Type.INT;
                }
                if (type <= Type.DIV)
                {
                    if (type2 == CompilerCore.Type.VECTOR && type1 != CompilerCore.Type.VECTOR)
                    {
                        Error("Scalar and Vector computation");
                        return CompilerCore.Type.NULL;
                    }
                    return (CompilerCore.Type)System.Math.Max((int)type1, (int)type2);
                }
                Error("Unexpected error, .....");
                return CompilerCore.Type.NULL;
            }
        }

        internal override bool TypeCheck(out CompilerCore.Type resultType)
        {
            if (exp1.TypeCheck(out type1))
                if (exp2.TypeCheck(out type2))
                {
                    resultType = typeHelper(type1, type2);
                    if (resultType == CompilerCore.Type.NULL)
                        return false;
                    this.resultType = resultType;
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

    partial class UnaryExpression : Expression
    {
        Type type;
        Expression exp;
        CompilerCore.Type expType;
        internal enum Type
        {
            NEGATE, NOT, BITWISE_NOT
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
                if (type >= Type.NOT && expressionType != CompilerCore.Type.INT)
                {
                    resultType = CompilerCore.Type.NULL;
                    Error("! and ~ operator can only be used on integer or comparison expression");
                    return false;
                }
                if (expressionType <= CompilerCore.Type.VECTOR_POINTER)
                {
                    resultType = CompilerCore.Type.NULL;
                    Error("- operator cannot be used on pointer");
                    return false;
                }
                resultType = expressionType;
                expType = expressionType;
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

    partial class IndexExpression : Expression
    {
        internal Expression expression;
        internal Expression indexExpression;
        internal Type valueType;
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
                    if (valueType == Type.VECTOR)
                    {
                        if (indexExpression is not IntLiteralExpression)
                        {
                            type = Type.NULL;
                            Error("Vector index can only be 0-3");
                            return false;
                        }
                        if ((indexExpression as IntLiteralExpression).i > 3 ||
                            (indexExpression as IntLiteralExpression).i < 0)
                        {
                            Error("Vector index can only be 0-3");
                            type = Type.NULL;
                            return false;
                        }
                        type = Type.FLOAT;
                    }
                    else if (valueType <= Type.VECTOR_POINTER)
                        type = valueType + 3; // become value type
                    else
                    {
                        type = Type.NULL;
                        Error($"Type {valueType} cannot use index");
                        return false;
                    }
                    this.valueType = valueType;
                    return true;
                }
            }
            type = Type.NULL;
            return false;
        }
    }

    partial class VectorConstructorExpression : Expression
    {
        List<Expression> expressions;
        List<Type> types = new List<Type>();

        internal VectorConstructorExpression(LexLocation location, Expression e1, Expression e2,
            Expression e3, Expression e4) : base(location)
        {
            expressions = new List<Expression> { e1, e2, e3, e4 };
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            foreach (var item in expressions)
                if (!item.NameAnalysis(table))
                    return false;
            return true;
        }

        internal override bool TypeCheck(out Type resultType)
        {
            foreach (var item in expressions)
                if (!item.TypeCheck(out Type type))
                {
                    resultType = Type.NULL;
                    return false;
                }
                else
                {
                    if (type >= Type.VECTOR || type <= Type.VECTOR_POINTER)
                    {
                        Error("Vector can only have integer or float elements");
                        resultType = Type.NULL;
                        return false;
                    }
                    types.Add(type);
                }
            resultType = Type.VECTOR;
            return true;
        }
    }

    partial class FunctionCallExpression : Expression
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

    partial class IdentifierExpression : Expression
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

    partial class TypeCastExpression : Expression
    {
        Type type;
        Expression expression;
        internal TypeCastExpression(LexLocation location, Type type, Expression exp) : base(location)
        {
            this.type = type;
            expression = exp;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return expression.NameAnalysis(table);
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = type;
            expression.TypeCheck(out _);
            return true;
        }
    }

    partial class ReduceExpression : Expression
    {
        Expression expression;
        internal ReduceExpression(LexLocation location, Expression exp) : base(location)
        {
            expression = exp;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return expression.NameAnalysis(table);
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = Type.FLOAT;
            expression.TypeCheck(out _);
            return true;
        }
    }

    partial class SquareRootExpression : Expression
    {
        Expression expression;
        internal SquareRootExpression(LexLocation location, Expression exp) : base(location)
        {
            expression = exp;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return expression.NameAnalysis(table);
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = Type.FLOAT;
            expression.TypeCheck(out _);
            return true;
        }
    }
}