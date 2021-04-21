using System.Collections.Generic;
using System;
using QUT.Gppg;

namespace CompilerCore
{
    abstract class Statement : ASTNode
    {
        internal Statement(LexLocation location) : base(location) { }
        abstract internal bool SyntaxCheck(bool topLevel, bool inLoop);
    }

    class StatementList : ASTNodeList<Statement, StatementList>
    {
        internal StatementList(LexLocation location) : base(location) { }
        internal StatementList(LexLocation location, Statement node) : base(location, node) { }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }

        internal bool StaticCheck()
        {
            bool pass = true;
            pass = pass && SyntaxCheck(true, false);
            return pass;
        }

        internal bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            bool pass = true;
            foreach (var item in list)
                pass = pass && item.SyntaxCheck(topLevel, inLoop);
            return pass;
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    enum Type
    {
        INT, FLOAT, VECTOR, VOID
    }

    class ReturnStatement : Statement
    {
        Expression expression = null;
        internal ReturnStatement(LexLocation location) : base(location) { }
        internal ReturnStatement(LexLocation location, Expression exp) : base(location)
        {
            expression = exp;
        }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
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

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    class ControlStatement : Statement
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
            if (topLevel)
            {
                Error($"{str} statement must be in a loop");
                return false;
            }
            if (!inLoop)
            {
                Error($"{str} statement must be in a loop");
                return false;
            }
            return true;
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }
    }

    class LoopStatement : Statement
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

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
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

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    class IfStatement : Statement
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

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            if (topLevel)
            {
                Error("If statement must be in a function");
                return false;
            }
            var result = statement.SyntaxCheck(topLevel, inLoop);
            result = result && (elseStatement?.SyntaxCheck(topLevel, inLoop) ?? false);
            return result;
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    class BlockStatement : Statement
    {
        StatementList statementList;
        internal BlockStatement(LexLocation location, StatementList list) : base(location)
        {
            statementList = list;
        }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
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

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    class AssignmentStatement : Statement
    {
        Expression left;
        Expression right;
        internal AssignmentStatement(LexLocation location, Expression l, Expression r) : base(location)
        {
            left = l;
            right = r;
        }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
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

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    class DeclarationStatement : Statement
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

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }

        internal override bool SyntaxCheck(bool topLevel, bool inLoop)
        {
            return true;
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    class DeclarationList : ASTNodeList<DeclarationItem, DeclarationList>
    {
        internal DeclarationList(LexLocation location) : base(location) { }
        internal DeclarationList(LexLocation location, DeclarationItem node) : base(location, node) { }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    internal class DeclarationItem : ASTNode
    {
        string identifier;
        Expression initializer;
        int arraySize;
        internal DeclarationItem(LexLocation location, string id, Expression init = null,
            int size = 1) : base(location)
        {
            identifier = id;
            initializer = init;
            arraySize = size;
        }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }
    class FunctionDefinitionStatement : Statement
    {
        Type returnType;
        string functionName;
        ParameterList parameterList;
        StatementList statementList;
        internal FunctionDefinitionStatement(LexLocation location, Type type, string name,
            ParameterList parameters, StatementList statements) : base(location)
        {
            returnType = type;
            functionName = name;
            parameterList = parameters;
            statementList = statements;
        }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
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

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }

    class ParameterList : ASTNodeList<Parameter, ParameterList>
    {
        internal ParameterList(LexLocation location) : base(location) { }
        internal ParameterList(LexLocation location, Parameter node) : base(location, node) { }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }
    internal class Parameter : ASTNode
    {
        Type type;
        string identifier;
        internal Parameter(LexLocation location, Type type, string id) : base(location)
        {
            this.type = type;
            identifier = id;
        }

        internal override bool NameAnalysis()
        {
            throw new NotImplementedException();
        }

        internal override bool TypeCheck()
        {
            throw new NotImplementedException();
        }
    }
}