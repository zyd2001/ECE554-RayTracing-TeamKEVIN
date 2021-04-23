using System;
using System.Collections.Generic;

namespace CompilerCore
{
    class Assembly
    {
        internal string OPCode { get; }
        internal List<string> Operands { get; }
        internal HashSet<string> Use { get; } = new HashSet<string>();
        internal HashSet<string> Def { get; } = new HashSet<string>();
        internal string UsedLabel { get; set; } = null;
        internal HashSet<int> Predecessor { get; } = new HashSet<int>();
        internal HashSet<int> Successor { get; } = new HashSet<int>();

        internal Assembly(string opcode, List<string> operands)
        {
            OPCode = opcode;
            Operands = operands;
            if (operands.Count > 0)
            {
                if (withVariable(opcode))
                {
                    if (opcode == "s_store_4byte" || opcode == "v_store_4byte")
                    {
                        Use.Add(operands[0]);
                        Use.Add(operands[1]);
                    }
                    else
                    {
                        Def.Add(operands[0]);
                        for (int i = 1; i < operands.Count; i++)
                        {
                            if (operands[i][0] == '.')
                                Use.Add(operands[i]);
                        }
                    }
                }
            }
        }

        private static bool withVariable(string opcode)
        {
            switch (opcode[0])
            {
                case 'b':
                case 'j':
                    return false;
                default:
                    return true;
            }
        }

        internal Assembly(string opcode)
        {
            OPCode = opcode;
            Operands = new List<string>();
        }

        public override string ToString()
        {
            string str = OPCode;
            foreach (var item in Operands)
                str += " " + item;
            return str;
        }
    }

    class DirectTranslation
    {
        internal List<Assembly> List { get; } = new List<Assembly>();
        internal List<(Assembly ins, int index)> BranchList { get; } = new List<(Assembly ins, int index)>();
        internal Dictionary<string, int> Labels { get; } = new Dictionary<string, int>();
        internal Dictionary<int, string> ReverseLabels { get; } = new Dictionary<int, string>();
        internal void AddLabel(string label, bool nextLine = true)
        {
            int index = nextLine ? List.Count : List.Count - 1;
            ReverseLabels.TryAdd(index, label);
            Labels.Add(label, index);
        }

        internal void AddAssembly(string opcode, params string[] operands)
        {
            List.Add(new Assembly(opcode, new List<string>(operands)));
        }

        internal void AddBranch(string opcode, string label)
        {
            BranchList.Add((new Assembly(opcode, new List<string> { label }), List.Count));
            AddAssembly(""); // placeholder
        }

        internal void ResolveLabel()
        {
            foreach (var item in BranchList)
            {
                string label = item.ins.Operands[0];
                string resultLabel = ReverseLabels[Labels[label]];
                item.ins.Operands[0] = resultLabel;
                item.ins.UsedLabel = resultLabel;
                List[item.index] = item.ins;
            }
        }

        internal void ConstructFlowGraph()
        {
            for (int i = 0; i < List.Count; i++)
            {
                Assembly ins = List[i];
                if (ins.UsedLabel == null)
                    ins.Successor.Add(i + 1);
                else // is branch
                {
                    if (ins.OPCode[0] == 'b')
                        ins.Successor.Add(i + 1);
                    int index = Labels[ins.UsedLabel];
                    ins.Successor.Add(index);
                    List[index].Predecessor.Add(i);
                }
            }
        }

        internal void Print()
        {
            for (int i = 0; i < List.Count; i++)
            {
                if (ReverseLabels.TryGetValue(i, out string label))
                    Console.Write(label + ":");
                Console.WriteLine("\t" + List[i]);
            }
        }
    }
    class CodeGenerator
    {
        StatementList ast;
        DirectTranslation directTranslation;
        internal CodeGenerator(StatementList AST)
        {
            ast = AST;
            directTranslation = new DirectTranslation();
        }

        internal void generate()
        {
            ast.translate(directTranslation);
            directTranslation.ResolveLabel();
            directTranslation.ConstructFlowGraph();
            directTranslation.Print();
        }
    }
}