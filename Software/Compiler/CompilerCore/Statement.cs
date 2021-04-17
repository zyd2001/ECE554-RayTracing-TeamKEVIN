using System.Collections.Generic;

namespace CompilerCore
{
    abstract class Statement : ASTNode { }

    enum Type
    {
        INT, FLOAT, VECTOR, VOID
    }
    class ExpressionStatement : Statement
    {
        Expression expression;
        internal ExpressionStatement(Expression exp)
        {
            expression = exp;
        }
    }

    class ReturnStatement : Statement
    {
        Expression expression = null;
        internal ReturnStatement() { }
        internal ReturnStatement(Expression exp)
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
        internal ControlStatement(Type type)
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
        internal LoopStatement(Expression exp, Statement body)
        {
            condition = exp;
            loopBody = body;
        }

        internal LoopStatement(Statement initial, Expression exp, Statement iterate, Statement body)
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
        internal IfStatement(Expression exp, Statement statement)
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
        internal BlockStatement(List<Statement> list)
        {
            statementList = list;
        }
    }

    class AssignmentStatement : Statement
    {
        Expression left;
        Expression right;
        internal AssignmentStatement(Expression l, Expression r)
        {
            left = l;
            right = r;
        }
    }

    class DeclarationStatement : Statement
    {
        internal class DeclarationItem
        {
            string identifier;
            Expression initializer;
            int arraySize;
            internal DeclarationItem(string id, Expression init = null, int size = 1)
            {
                identifier = id;
                initializer = init;
                arraySize = size;
            }
        }
        Type type;
        bool constant;
        List<DeclarationItem> declarationList;
        internal DeclarationStatement(Type type, List<DeclarationItem> list, bool c = false)
        {
            this.type = type;
            declarationList = list;
            constant = c;
        }
    }

    class FunctionDefinitionStatement : Statement
    {
        internal class Parameter
        {
            Type type;
            string identifier;
            internal Parameter(Type type, string id)
            {
                this.type = type;
                identifier = id;
            }
        }
        Type returnType;
        string functionName;
        List<Parameter> parameterList;
        List<Statement> statementList;
        internal FunctionDefinitionStatement(Type type, string name, List<Parameter> parameters, List<Statement> statements)
        {
            returnType = type;
            functionName = name;
            parameterList = parameters;
            statementList = statements;
        }
    }
}