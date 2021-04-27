using System;

namespace CompilerCore
{
    class test
    {
        // public static void Main(string[] args)
        // {
        //     DirectTranslation d = new DirectTranslation();
        //     d.AddAssembly("s_mov", ".c", "R3");
        //     d.AddAssembly("s_mov", ".a", "R1");
        //     d.AddAssembly("s_mov", ".b", "R2");
        //     d.AddAssembly("s_movi", ".d", "0");
        //     d.AddAssembly("s_mov", ".e", ".a");
        //     d.AddLabel("loop");
        //     d.AddAssembly("ii_add", ".d", ".d", ".b");
        //     d.AddAssembly("ii_addi", ".e", ".e", "-1");
        //     d.AddAssembly("ii_subi", ".e", ".e", "1");
        //     d.AddAssembly("cmp_i", ".e", ".e");
        //     d.AddBranch("bg", "loop");
        //     d.AddAssembly("s_mov", "R1", ".d");
        //     d.AddAssembly("s_mov", "R3", ".c");
        //     d.ResolveLabel();
        //     d.ConstructFlowGraph();
        //     d.CalculateLiveSpan();
        //     Console.WriteLine(d.CreateInferenceGraph().ToString());
        // }
    }
}