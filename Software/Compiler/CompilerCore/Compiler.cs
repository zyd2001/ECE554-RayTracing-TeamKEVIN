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
        abstract internal bool TypeCheck();
        abstract internal bool NameAnalysis();
        internal void Error(string str)
        {
            Console.Write($"{location.StartLine}:{location.StartColumn}: ");
            Console.WriteLine(str);
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