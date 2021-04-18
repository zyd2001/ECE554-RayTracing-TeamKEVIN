using System;
using QUT.Gppg;

namespace CompilerCore
{
    class ASTNode
    {
        LexLocation location;
        internal ASTNode(LexLocation location)
        {
            this.location = location;
        }
        // abstract internal void StaticCheck(bool topLevel);
        internal void Error(string str)
        {
            Console.Write($"{location.StartLine}:{location.StartColumn}: ");
            Console.WriteLine(str);
        }
    }
}