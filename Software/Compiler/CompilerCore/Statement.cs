using System.Collections.Generic;
using System;
using QUT.Gppg;

namespace CompilerCore
{
    abstract class Statement : ASTNode
    {
        internal Statement(LexLocation location) : base(location) { }
        abstract internal bool SyntaxCheck(bool topLevel, bool inLoop);
        internal static FunctionDefinitionStatement CurrentFunction = null;
        internal static bool SecondPassAnalysis = false;
        static internal bool AssignmentTypeHelper(Type lhsType, Type rhsType)
        {
            switch (lhsType)
            {
                case Type.INT:
                case Type.VECTOR:
                    return lhsType == rhsType;
                case Type.FLOAT:
                    switch (rhsType)
                    {
                        case Type.INT:
                        case Type.FLOAT:
                            return true;
                        default:
                            return false;
                    }
                case Type.INT_POINTER:
                case Type.FLOAT_POINTER:
                case Type.VECTOR_POINTER:
                    return lhsType == rhsType || rhsType == Type.INT;
                default:
                    return false;
            }
        }

        static Stack<(string Begin, string End)> loopStack = new Stack<(string Begin, string End)>();
        static internal void NewLoop(string begin, string end)
        {
            loopStack.Push((begin, end));
        }
        static internal void EndLoop()
        {
            loopStack.Pop();
        }

        static internal string CurrentLoopBeginLabel { get => loopStack.Peek().Begin; }
        static internal string CurrentLoopEndLabel { get => loopStack.Peek().Begin; }
    }

    partial class StatementList : ASTNodeList<Statement, StatementList>
    {
        internal StatementList(LexLocation location) : base(location) { }
        internal StatementList(LexLocation location, Statement node) : base(location, node) { }

        SymbolTable globalTable;

        internal override bool NameAnalysis(SymbolTable table)
        {
            bool pass = true;
            foreach (var item in list)
                pass &= item.NameAnalysis(table);
            return pass;
        }

        internal bool StaticCheck()
        {
            if (SyntaxCheck(true, false))
            {
                globalTable = new SymbolTable();
                NameAnalysis(globalTable); // first pass for function definition
                Statement.SecondPassAnalysis = true;
                if (NameAnalysis(globalTable)) // second pass for real analysis
                    if (TypeCheck(out _))
                        return true;
            }
            return false;
        }

        internal bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            bool pass = true;
            foreach (var item in list)
                pass &= item.SyntaxCheck(topLevel, inLoop);
            return pass;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            bool pass = true;
            foreach (var item in list)
                pass &= item.TypeCheck(out _);
            return pass;
        }
    }

    enum Type
    {
        INT_POINTER, FLOAT_POINTER, VECTOR_POINTER,
        INT, FLOAT, VECTOR, VOID, NULL
    }

    partial class ReturnStatement : Statement
    {
        Expression expression = null;
        FunctionDefinitionStatement function;
        internal ReturnStatement(LexLocation location) : base(location) { }
        internal ReturnStatement(LexLocation location, Expression exp) : base(location)
        {
            expression = exp;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return expression?.NameAnalysis(table) ?? true;
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (topLevel)
            {
                Error("Return statement must be in a function");
                return false;
            }
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            if (expression is not null)
            {
                if (CurrentFunction.returnType == Type.VOID)
                {
                    Error("Return statement cannot have value in void function");
                    return false;
                }
                if (expression.TypeCheck(out Type returnType))
                {
                    if (!AssignmentTypeHelper(CurrentFunction.returnType, returnType))
                    {
                        Error($"Return type doens't match. Expect: {TypeString(CurrentFunction.returnType)}," +
                            $" Got: {TypeString(returnType)}");
                        return false;
                    }
                }
                else
                    return false;
            }
            this.function = CurrentFunction;
            return true;
        }
    }

    partial class ControlStatement : Statement
    {
        internal enum Type
        {
            CONTINUE, BREAK
        }
        Type type;
        internal ControlStatement(LexLocation location, Type type) : base(location)
        {
            this.type = type;
        }
        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            var str = type == Type.CONTINUE ? "Continue" : "Break";
            if (topLevel || !inLoop)
            {
                Error($"{str} statement must be in a loop");
                return false;
            }
            return true;
        }

        internal override bool TypeCheck(out CompilerCore.Type type)
        {
            type = CompilerCore.Type.NULL;
            return true;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return true;
        }
    }

    partial class LoopStatement : Statement
    {
        Statement initialStatement = null;
        Expression condition;
        Statement iterateStatement = null;
        Statement loopBody;
        internal LoopStatement(LexLocation location, Expression exp, Statement body) : base(location)
        {
            condition = exp;
            loopBody = body;
        }

        internal LoopStatement(LexLocation location, Statement initial, Expression exp,
            Statement iterate, Statement body) : base(location)
        {
            initialStatement = initial;
            condition = exp;
            iterateStatement = iterate;
            loopBody = body;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            bool pass = true;
            table.AddScope(); // possible nested two scope with block statement, but no real problem
            pass &= (initialStatement?.NameAnalysis(table) ?? true);
            pass &= condition.NameAnalysis(table);
            pass &= (iterateStatement?.NameAnalysis(table) ?? true);
            pass &= loopBody.NameAnalysis(table);
            table.RemoveScope();
            return pass;
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (topLevel)
            {
                Error("Loop must be in a function");
                return false;
            }
            return loopBody.SyntaxCheck(topLevel, true);
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            bool pass = true;
            pass &= (initialStatement?.TypeCheck(out _) ?? true);
            pass &= condition.TypeCheck(out Type conditionType);
            if (conditionType != Type.INT)
            {
                Error("Loop condition must be an integer or comparison expression");
                return false;
            }
            pass &= (iterateStatement?.TypeCheck(out _) ?? true);
            pass &= loopBody.TypeCheck(out _);
            return pass;
        }
    }

    partial class IfStatement : Statement
    {
        Expression condition;
        Statement statement;
        Statement elseStatement = null;
        internal IfStatement(LexLocation location, Expression exp, Statement statement) : base(location)
        {
            condition = exp;
            this.statement = statement;
        }

        internal IfStatement AddElse(Statement statement)
        {
            elseStatement = statement;
            return this;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            bool pass = true;
            pass &= condition.NameAnalysis(table);
            pass &= statement.NameAnalysis(table);
            pass &= (elseStatement?.NameAnalysis(table) ?? true);
            return pass;
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (topLevel)
            {
                Error("If statement must be in a function");
                return false;
            }
            var result = statement.SyntaxCheck(topLevel, inLoop);
            result = result & (elseStatement?.SyntaxCheck(topLevel, inLoop) ?? true);
            return result;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            bool pass = true;
            pass &= condition.TypeCheck(out Type conditionType);
            if (conditionType != Type.INT)
            {
                Error("If condition must be an integer or comparison expression");
                return false;
            }
            pass &= statement.TypeCheck(out _);
            pass &= (elseStatement?.TypeCheck(out _) ?? true);
            return pass;
        }
    }

    partial class BlockStatement : Statement
    {
        StatementList statementList;
        internal BlockStatement(LexLocation location, StatementList list) : base(location)
        {
            statementList = list;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            table.AddScope();
            bool pass = statementList.NameAnalysis(table);
            table.RemoveScope();
            return pass;
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (topLevel)
            {
                Error("Block must be in a function");
                return false;
            }
            return statementList.SyntaxCheck(topLevel, inLoop);
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            return statementList.TypeCheck(out _);
        }
    }

    partial class AssignmentStatement : Statement
    {
        Expression left;
        Expression right;
        Type leftType = Type.NULL;
        Type rightType = Type.NULL;
        internal AssignmentStatement(LexLocation location, Expression l, Expression r) : base(location)
        {
            left = l;
            right = r;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return left.NameAnalysis(table) & right.NameAnalysis(table);
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (topLevel)
            {
                Error("Assignment statement must be in a function");
                return false;
            }
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            bool pass = true;
            pass &= left.TypeCheck(out Type lhsType);
            pass &= right.TypeCheck(out Type rhsType);
            if (!AssignmentTypeHelper(lhsType, rhsType))
            {
                Error($"Assign {TypeString(rhsType)} to {TypeString(lhsType)}");
                return false;
            }
            rightType = rhsType;
            leftType = lhsType;
            return pass;
        }
    }

    partial class DeclarationStatement : Statement
    {
        Type type;
        bool constant;
        DeclarationList declarationList;
        internal DeclarationStatement(LexLocation location, Type type, DeclarationList list,
            bool c = false) : base(location)
        {
            this.type = type;
            declarationList = list;
            constant = c;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            if (SecondPassAnalysis)
                return declarationList.NameAnalysisType(table, type, constant);
            else
                return true;
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (constant && !topLevel)
            {
                Error("Only allow global constant variable");
                return false;
            }
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            if (type == Type.VOID)
            {
                Error("Cannot declare void variable");
                return false;
            }
            return declarationList.TypeCheckType(this.type);
        }
    }

    partial class DeclarationList : ASTNodeList<DeclarationItem, DeclarationList>
    {
        internal DeclarationList(LexLocation location) : base(location) { }
        internal DeclarationList(LexLocation location, DeclarationItem node) : base(location, node) { }

        internal override bool NameAnalysis(SymbolTable table)
        {
            throw new NotImplementedException();
        }

        internal bool NameAnalysisType(SymbolTable table, Type type, bool con)
        {
            bool pass = true;
            foreach (var item in list)
                pass &= item.NameAnalysisType(table, type, con);
            return pass;
        }

        internal bool TypeCheckType(Type type)
        {
            bool pass = true;
            foreach (var item in list)
                pass &= item.TypeCheckType(type);
            return pass;
        }

        internal override bool TypeCheck(out Type type)
        {
            throw new NotImplementedException();
        }
    }

    partial class DeclarationItem : ASTNode
    {
        static int constantOffset = 0;
        string identifier;
        string scopedIdentifier;
        Type type;
        Expression initializer;
        int arraySize; // -1 means normal type, 0 means pointer, > 0 means array
        int offset;
        internal DeclarationItem(LexLocation location, string id, Expression init = null,
            int size = -1) : base(location)
        {
            identifier = id;
            initializer = init;
            arraySize = size;
        }

        internal DeclarationItem(LexLocation location, string id, bool placeholder) : base(location)
        {
            identifier = id;
            initializer = null;
            arraySize = 0;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            throw new NotImplementedException();
        }

        internal bool NameAnalysisType(SymbolTable table, Type type, bool constant)
        {
            if (table.LocalSearch(identifier) is not null)
            {
                Error($"{identifier} is declared in the same scope");
                return false;
            }
            // check the initializer first, prevent using declaring variable
            bool pass = initializer?.NameAnalysis(table) ?? true;
            if (arraySize >= 0)
                type -= 3; // make a pointer type
            string t = type == Type.VECTOR ? "V" : "S";
            string id;
            int cOffset = constantOffset;
            if (table.ScopeLevel > 1)
                id = $".{t}.{Statement.CurrentFunction.functionName}.{table.ScopeLevel}.{identifier}";
            else
            {
                constantOffset += type == Type.VECTOR ? 16 : 4;
                id = $"c{t}.{identifier}";
            }
            scopedIdentifier = id;
            table.AddSymbol(identifier, new Symbol(type, id, cOffset));
            if (arraySize > 0)
            {
                offset = Statement.CurrentFunction.StackSize;
                Statement.CurrentFunction.StackSize += arraySize *
                    (type == Type.VECTOR_POINTER ? 16 : 4);
            }
            return pass;
        }

        internal bool TypeCheckType(Type type)
        {
            if (initializer is not null)
            {
                if (Statement.CurrentFunction == null) // global variable check
                {
                    if (initializer is not LiteralExpression)
                    {
                        Error("Global variable can only be initialized with literal");
                        return false;
                    }
                }
                if (initializer.TypeCheck(out Type resultType))
                {
                    if (!Statement.AssignmentTypeHelper(type, resultType))
                    {
                        Error($"Declaraion type {TypeString(type)} doesn't match with" +
                            $" initializer type {TypeString(resultType)}");
                        return false;
                    }
                }
                else return false;
            }
            this.type = type;
            return true;
        }

        internal override bool TypeCheck(out Type type)
        {
            throw new NotImplementedException();
        }
    }
    partial class FunctionDefinitionStatement : Statement
    {
        internal Type returnType;
        internal string functionName;
        internal ParameterList parameterList;
        StatementList statementList;
        internal int StackSize = 0;
        internal FunctionDefinitionStatement(LexLocation location, Type type, string name,
            ParameterList parameters, StatementList statements) : base(location)
        {
            returnType = type;
            functionName = name;
            parameterList = parameters;
            statementList = statements;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            if (SecondPassAnalysis)
            {
                table.AddScope();
                CurrentFunction = this;
                parameterList.NameAnalysis(table); // only add new symbol, no possible error
                bool pass = statementList.NameAnalysis(table);
                CurrentFunction = null;
                table.RemoveScope();
                return pass;
            }

            // first pass for function definition
            if (table.GlobalSearch(functionName) is not null)
            {
                Error($"{functionName} is declared in the same scope");
                return false;
            }
            List<Type> parameterType = new List<Type>();
            table.AddSymbol(functionName, new Symbol(returnType, functionName, true, parameterType, this));
            foreach (var type in parameterList.Types()) // must take care of parameter type before type checking
                parameterType.Add(type);
            return true;
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (!topLevel)
            {
                Error("Function cannot be nested");
                return false;
            }
            return statementList.SyntaxCheck(false, false);
        }

        internal override bool TypeCheck(out Type type)
        {
            type = Type.NULL;
            parameterList.TypeCheck(out _); // check for void parameter
            CurrentFunction = this;
            bool pass = statementList.TypeCheck(out _);
            CurrentFunction = null;
            return pass;
        }
    }

    class ParameterList : ASTNodeList<Parameter, ParameterList>
    {
        internal ParameterList(LexLocation location) : base(location) { }
        internal ParameterList(LexLocation location, Parameter node) : base(location, node) { }

        internal override string Generate(DirectTranslation translation)
        {
            throw new NotImplementedException();
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            foreach (var item in list)
                item.NameAnalysis(table);
            return true;
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = Type.NULL;
            bool pass = true;
            foreach (var item in list)
                pass &= item.TypeCheck(out _);
            return pass;
        }

        internal List<Type> Types()
        {
            List<Type> types = new List<Type>(list.Count);
            foreach (var item in list)
                types.Add(item.Type());
            return types;
        }

        internal List<string> Names()
        {
            List<string> ret = new List<string>(list.Count);
            foreach (var item in list)
                ret.Add(item.Name());
            return ret;
        }
    }
    internal class Parameter : ASTNode
    {
        Type type;
        string identifier;
        string name;
        internal Parameter(LexLocation location, Type type, string id) : base(location)
        {
            this.type = type;
            identifier = id;
        }

        internal Parameter(LexLocation location, Type type, string id, bool placeholder) : base(location)
        {
            this.type = type - 3;
            identifier = id;
        }

        internal override string Generate(DirectTranslation translation)
        {
            throw new NotImplementedException();
        }

        internal string Name()
        {
            return name;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            string id;
            string t = type == CompilerCore.Type.VECTOR ? "V" : "S";
            id = $".{t}.{Statement.CurrentFunction.functionName}.{table.ScopeLevel}.{identifier}";
            name = id;
            table.AddSymbol(identifier, new Symbol(type, id));
            return true;
        }

        internal Type Type()
        {
            return type;
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = type;
            if (type == CompilerCore.Type.NULL)
            {
                Error("Cannot declare void variable");
                return false;
            }
            return true;
        }
    }

    class FunctionCallStatement : Statement
    {
        internal FunctionCallExpression expression;
        internal FunctionCallStatement(LexLocation location, FunctionCallExpression exp) : base(location)
        {
            expression = exp;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return expression.NameAnalysis(table);
        }
        internal override string Generate(DirectTranslation translation)
        {
            expression.Generate(translation);
            return null;
        }
        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (topLevel)
            {
                Error("Function call in toplevel");
                return false;
            }
            return true;
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = Type.NULL;
            return expression.TypeCheck(out _);
        }
    }

    class TraceStatement : Statement
    {
        Expression id1;
        Expression id2;
        Expression expression1;
        Expression expression2;

        internal TraceStatement(LexLocation location, Expression i1, Expression i2,
            Expression e1, Expression e2) : base(location)
        {
            id1 = i1;
            id2 = i2;
            expression1 = e1;
            expression2 = e2;
        }

        internal override string Generate(DirectTranslation translation)
        {
            string v1 = expression1.Generate(translation);
            string v2 = expression2.Generate(translation);
            string i1 = id1.Generate(translation);
            string i2 = id2.Generate(translation);
            translation.AddAssembly("v_mov", "RV14", v1);
            translation.AddAssembly("v_mov", "RV15", v2);
            translation.AddCallerSave();
            translation.AddAssembly("Trace");
            translation.AddCallerRestore();
            translation.AddAssembly("v_mov", i1, "RV14");
            translation.AddAssembly("v_mov", i2, "RV15");
            return null;
        }

        internal override bool NameAnalysis(SymbolTable table)
        {
            return id1.NameAnalysis(table) & id2.NameAnalysis(table)
                & expression1.NameAnalysis(table) & expression2.NameAnalysis(table);
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            return true;
        }

        internal override bool TypeCheck(out Type resultType)
        {
            resultType = Type.NULL;
            id1.TypeCheck(out _);
            id2.TypeCheck(out _);
            expression1.TypeCheck(out _);
            expression2.TypeCheck(out _);
            return true;
        }
    }
}