using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Text;
using Set = System.Collections.Immutable.ImmutableHashSet<string>;

namespace CompilerCore
{
    class Assembly
    {
        internal string OPCode { get; }
        internal List<string> Operands { get; }
        internal Set Use { get; set; } = Set.Empty;
        internal Set Def { get; set; } = Set.Empty;
        internal string UsedLabel { get; set; } = null;
        internal HashSet<int> Predecessor { get; } = new HashSet<int>();
        internal HashSet<int> Successor { get; } = new HashSet<int>();
        internal Set In { get; set; } = Set.Empty;
        internal Set Out { get; set; } = Set.Empty;

        internal Assembly(string opcode, List<string> operands)
        {
            OPCode = opcode;
            Operands = operands;
            var use = ImmutableHashSet.CreateBuilder<string>();
            var def = ImmutableHashSet.CreateBuilder<string>();
            if (operands.Count > 0)
            {
                if (withVariable(opcode))
                {
                    if (opcode[0] == 'c' || opcode == "s_store_4byte" || opcode == "v_store_4byte")
                    {
                        use.Add(operands[0]);
                        use.Add(operands[1]);
                    }
                    else
                    {
                        def.Add(operands[0]);
                        for (int i = 1; i < operands.Count; i++)
                        {
                            // TODO: register
                            if (operands[i][0] == '.' || operands[i][0] == 'R') // do not add constant
                                use.Add(operands[i]);
                        }
                    }
                    Use = use.ToImmutable();
                    Def = def.ToImmutable();
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
        internal List<Set> Ins { get; set; } = null;
        internal List<Set> Outs { get; set; } = null;
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
                ins.Predecessor.Add(i - 1);
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

        internal void CalculateLiveSpan()
        {
            Ins = new List<Set>(new Set[List.Count]);
            Outs = new List<Set>(new Set[List.Count]);
            while (true)
            {
                for (int i = List.Count - 1; i >= 0; i--)
                {
                    Assembly ins = List[i];
                    Ins[i] = ins.In;
                    Outs[i] = ins.Out;
                    ins.In = ins.Use.Union(ins.Out.Except(ins.Def));
                    HashSet<string> tempIn = new HashSet<string>();
                    foreach (var index in ins.Successor)
                    {
                        if (index < List.Count)
                            tempIn.UnionWith(List[index].In);
                    }
                    ins.Out = tempIn.ToImmutableHashSet();
                }
                int _i = 0;
                if (!Ins.TrueForAll((Set s) =>
                {
                    bool ret = s.SetEquals(List[_i].In);
                    _i++;
                    return ret;
                })) continue;
                _i = 0;
                if (!Outs.TrueForAll((Set s) =>
                {
                    bool ret = s.SetEquals(List[_i].Out);
                    _i++;
                    return ret;
                })) continue;
                break;
            }
        }

        internal class InferenceGraph
        {
            internal Dictionary<string, int> Dict { get; } = new Dictionary<string, int>();
            internal List<string> ReverseDict { get; } = new List<string>();

            internal HashSet<int>[] AdjacentList { get; } = null;
            internal bool[,] AdjacentMatrix { get; } = null;

            public InferenceGraph(List<Set> ins, List<Set> outs)
            {
                for (int i = 0; i < ins.Count; i++)
                {
                    foreach (var item in ins[i])
                    {
                        if (Dict.TryAdd(item, ReverseDict.Count))
                            ReverseDict.Add(item);
                    }
                    foreach (var item in outs[i])
                    {
                        if (Dict.TryAdd(item, ReverseDict.Count))
                            ReverseDict.Add(item);
                    }
                }
                AdjacentList = Enumerable.Range(0, ReverseDict.Count).Select((i) => new HashSet<int>()).ToArray();
                AdjacentMatrix = new bool[ReverseDict.Count, ReverseDict.Count];
            }
            internal void AddEdge(string a, string b)
            {
                int ia = Dict[a];
                int ib = Dict[b];
                AdjacentList[ia].Add(ib);
                AdjacentList[ib].Add(ia);
                AdjacentMatrix[ia, ib] = true;
                AdjacentMatrix[ib, ia] = true;
            }

            public override string ToString()
            {
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < AdjacentList.Length; i++)
                {
                    builder.AppendLine(ReverseDict[i]);
                    foreach (var item in AdjacentList[i])
                        builder.AppendLine($"{ReverseDict[i]} {ReverseDict[item]}");
                }
                return builder.ToString();
            }
        }
        internal InferenceGraph CreateInferenceGraph()
        {
            InferenceGraph graph = new InferenceGraph(Ins, Outs);
            foreach (var ins in List)
            {
                if (ins.OPCode.Contains("mov"))
                {
                    foreach (var a in ins.Def)
                        foreach (var b in ins.Out)
                        {
                            if (ins.Operands[1] != b)
                                graph.AddEdge(a, b);
                        }
                }
                else
                {
                    foreach (var a in ins.Def)
                        foreach (var b in ins.Out)
                            graph.AddEdge(a, b);
                }
            }
            return graph;
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
            directTranslation.CalculateLiveSpan();
            directTranslation.Print();
        }
    }
}