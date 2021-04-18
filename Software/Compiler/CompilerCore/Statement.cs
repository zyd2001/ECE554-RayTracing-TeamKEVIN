using System.Collections.Generic;
using System;
using QUT.Gppg;

namespace CompilerCore
{
    abstract class Statement : ASTNode
    {
        internal Statement(LexLocation location) : base(location) { }
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
    }

    class BlockStatement : Statement
    {
        List<Statement> statementList;
        internal BlockStatement(LexLocation location, List<Statement> list) : base(location)
        {
            statementList = list;
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
    }

    class DeclarationStatement : Statement
    {
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
        }
        Type type;
        bool constant;
        List<DeclarationItem> declarationList;
        internal DeclarationStatement(LexLocation location, Type type, List<DeclarationItem> list,
            bool c = false) : base(location)
        {
            this.type = type;
            declarationList = list;
            constant = c;
        }
    }

    class FunctionDefinitionStatement : Statement
    {
        internal class Parameter : ASTNode
        {
            Type type;
            string identifier;
            internal Parameter(LexLocation location, Type type, string id) : base(location)
            {
                this.type = type;
                identifier = id;
            }
        }
        Type returnType;
        string functionName;
        List<Parameter> parameterList;
        List<Statement> statementList;
        internal FunctionDefinitionStatement(LexLocation location, Type type, string name,
            List<Parameter> parameters, List<Statement> statements) : base(location)
        {
            returnType = type;
            functionName = name;
            parameterList = parameters;
            statementList = statements;
        }
        internal void StaticCheck(bool topLevel)
        {
            if (!topLevel)
                Error("sble");
        }
    }
}