using System;
using System.IO;

namespace CompilerCore
{
    class Test
    {
        // public static void Main(string[] args)
        // {
        //     Scanner scanner = new Scanner(new FileStream("test.rt", FileMode.Open));
        //     Parser parser = new Parser(scanner);

        //     Console.WriteLine(parser.Parse());
        //     Console.WriteLine(parser.AST.StaticCheck());
        //     CodeGenerator generator = new CodeGenerator(parser.AST);
        //     generator.generate();
        //     // DirectTranslation d = new DirectTranslation();
        //     // d.AddAssembly("s_movi", ".a", "0");
        //     // d.AddLabel("L1");
        //     // d.AddAssembly("ii_addi", ".b", ".a", "1");
        //     // d.AddAssembly("ii_add", ".c", ".c", ".b");
        //     // d.AddAssembly("ii_muli", ".a", ".b", "2");
        //     // d.AddAssembly("cmp_i", ".a", ".a");
        //     // d.AddAssembly("bl", "L1");
        //     // d.List[^1].UsedLabel = "L1";
        //     // d.AddAssembly("s_store_4byte", ".c", ".c");
        //     // d.ConstructFlowGraph();
        //     // d.CalculateLiveSpan();
        // }
    }
}