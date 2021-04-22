using System;
using System.IO;

namespace CompilerCore
{
    class Test
    {
        public static void Main(string[] args)
        {
            Scanner scanner = new Scanner(new FileStream("test.rt", FileMode.Open));
            Parser parser = new Parser(scanner);

            Console.WriteLine(parser.Parse());
            Console.WriteLine(parser.AST.StaticCheck());
        }
    }
}