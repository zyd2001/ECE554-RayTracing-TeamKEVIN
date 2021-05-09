using System;
using System.IO;

namespace CompilerCore
{
    class Test
    {
        public static void Main(string[] args)
        {
            Scanner scanner = new Scanner(new FileStream(args[0], FileMode.Open));
            Parser parser = new Parser(scanner);

            if (parser.Parse())
                if (parser.AST.StaticCheck())
                {
                    CodeGenerator generator = new CodeGenerator(parser.AST);
                    generator.generate();
                }
        }
    }
}