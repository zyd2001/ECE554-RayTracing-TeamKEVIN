using System;
using System.Collections.Generic;
using QUT.Gppg;

namespace CompilerCore
{
    abstract class ASTNode
    {
        LexLocation location;
        internal ASTNode(LexLocation location)
        {
            this.location = location;
        }
        abstract internal bool TypeCheck(out Type resultType);
        abstract internal bool NameAnalysis(SymbolTable table);
        internal void Error(string str)
        {
            Console.Error.Write($"{location.StartLine}:{location.StartColumn}: ");
            Console.Error.WriteLine(str);
        }

        internal static string TypeString(Type type)
        {
            switch (type)
            {
                case Type.INT:
                    return "int";
                case Type.FLOAT:
                    return "float";
                case Type.VECTOR:
                    return "vector";
                case Type.VOID:
                    return "void";
                case Type.INT_POINTER:
                    return "int*";
                case Type.FLOAT_POINTER:
                    return "float*";
                case Type.VECTOR_POINTER:
                    return "vector*";
                default:
                    return "NULL";
            }
        }

        abstract internal string generate(DirectTranslation translation);

        static int varaibleCounter = 0;
        internal static int VaraibleCounter
        {
            get
            {
                int ret = varaibleCounter;
                varaibleCounter++;
                return ret;
            }
        }
        static int labelCounter = 0;
        internal static int LabelCounter
        {
            get
            {
                int ret = labelCounter;
                labelCounter++;
                return ret;
            }
        }
    }

    abstract class ASTNodeList<NodeType, T> : ASTNode where T : ASTNodeList<NodeType, T>
    {
        protected List<NodeType> list = new List<NodeType>();
        internal ASTNodeList(LexLocation location) : base(location) { }
        internal ASTNodeList(LexLocation location, NodeType node) : base(location)
        {
            list = new List<NodeType> { node };
        }
        internal T Add(NodeType node)
        {
            list.Add(node);
            return this as T;
        }
    }
}