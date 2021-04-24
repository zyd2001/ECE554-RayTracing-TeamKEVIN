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
        internal Set SUse { get; set; } = Set.Empty;
        internal Set VUse { get; set; } = Set.Empty;
        internal Set SDef { get; set; } = Set.Empty;
        internal Set VDef { get; set; } = Set.Empty;
        internal string UsedLabel { get; set; } = null;
        internal HashSet<int> Predecessor { get; } = new HashSet<int>();
        internal HashSet<int> Successor { get; } = new HashSet<int>();
        internal Set SIn { get; set; } = Set.Empty;
        internal Set VIn { get; set; } = Set.Empty;
        internal Set SOut { get; set; } = Set.Empty;
        internal Set VOut { get; set; } = Set.Empty;

        internal Assembly(string opcode, List<string> operands)
        {
            OPCode = opcode;
            Operands = operands;
            var vuse = ImmutableHashSet.CreateBuilder<string>();
            var suse = ImmutableHashSet.CreateBuilder<string>();
            var vdef = ImmutableHashSet.CreateBuilder<string>();
            var sdef = ImmutableHashSet.CreateBuilder<string>();
            if (operands.Count > 0)
            {
                if (withVariable(opcode))
                {
                    if (opcode[0] == 'c' || opcode == "s_store_4byte" || opcode == "v_store_4byte")
                    {
                        for (int i = 0; i < 2; i++)
                            if (operands[i][1] == 'V')
                                vuse.Add(operands[i]);
                            else
                                suse.Add(operands[i]);
                    }
                    else
                    {
                        if (operands[0][1] == 'V')
                            vdef.Add(operands[0]);
                        else
                            sdef.Add(operands[0]);
                        for (int i = 1; i < operands.Count; i++)
                        {
                            // TODO: register
                            string op = operands[i];
                            if (op[0] == '.') // do not add constant
                            {
                                if (op[1] == 'V')
                                    vuse.Add(op);
                                else
                                    suse.Add(op);
                            }
                        }
                    }
                    SUse = suse.ToImmutable();
                    VUse = vuse.ToImmutable();
                    SDef = sdef.ToImmutable();
                    VDef = vdef.ToImmutable();
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
        internal List<Set> SIns { get; set; } = null;
        internal List<Set> VIns { get; set; } = null;
        internal List<Set> SOuts { get; set; } = null;
        internal List<Set> VOuts { get; set; } = null;
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
            SIns = new List<Set>(new Set[List.Count]);
            VIns = new List<Set>(new Set[List.Count]);
            SOuts = new List<Set>(new Set[List.Count]);
            VOuts = new List<Set>(new Set[List.Count]);
            while (true)
            {
                for (int i = List.Count - 1; i >= 0; i--)
                {
                    Assembly ins = List[i];
                    SIns[i] = ins.SIn;
                    VIns[i] = ins.VIn;
                    SOuts[i] = ins.SOut;
                    VOuts[i] = ins.VOut;
                    ins.SIn = ins.SUse.Union(ins.SOut.Except(ins.SDef));
                    ins.VIn = ins.VUse.Union(ins.VOut.Except(ins.VDef));
                    HashSet<string> tempSIn = new HashSet<string>();
                    foreach (var index in ins.Successor)
                        if (index < List.Count)
                            tempSIn.UnionWith(List[index].SIn);
                    ins.SOut = tempSIn.ToImmutableHashSet();
                    HashSet<string> tempVIn = new HashSet<string>();
                    foreach (var index in ins.Successor)
                        if (index < List.Count)
                            tempVIn.UnionWith(List[index].VIn);
                    ins.VOut = tempVIn.ToImmutableHashSet();
                }
                int _i = 0;
                if (!SIns.TrueForAll((Set s) =>
                {
                    bool ret = s.SetEquals(List[_i].SIn);
                    _i++;
                    return ret;
                })) continue;
                _i = 0;
                if (!SOuts.TrueForAll((Set s) =>
                {
                    bool ret = s.SetEquals(List[_i].SOut);
                    _i++;
                    return ret;
                })) continue;
                if (!VIns.TrueForAll((Set s) =>
                {
                    bool ret = s.SetEquals(List[_i].VIn);
                    _i++;
                    return ret;
                })) continue;
                _i = 0;
                if (!VOuts.TrueForAll((Set s) =>
                {
                    bool ret = s.SetEquals(List[_i].VOut);
                    _i++;
                    return ret;
                })) continue;
                break;
            }
        }

        internal (InferenceGraph sgraph, InferenceGraph vgraph) CreateInferenceGraph()
        {
            InferenceGraph sgraph = new InferenceGraph(SIns, SOuts);
            InferenceGraph vgraph = new InferenceGraph(VIns, VOuts);
            foreach (var ins in List)
            {
                if (ins.OPCode.Contains("mov"))
                {
                    foreach (var a in ins.SDef)
                        foreach (var b in ins.SOut)
                        {
                            if (ins.Operands[1] != b)
                                sgraph.AddEdge(a, b);
                        }
                    foreach (var a in ins.VDef)
                        foreach (var b in ins.VOut)
                        {
                            if (ins.Operands[1] != b)
                                vgraph.AddEdge(a, b);
                        }
                }
                else
                {
                    foreach (var a in ins.SDef)
                        foreach (var b in ins.SOut)
                            sgraph.AddEdge(a, b);
                    foreach (var a in ins.VDef)
                        foreach (var b in ins.VOut)
                            vgraph.AddEdge(a, b);
                }
            }
            return (sgraph, vgraph);
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
    class InferenceGraph
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

        internal void Allocation(int k)
        {
            HashSet<int> InitialNodes = new HashSet<int>();
            HashSet<int> PrecoloredNodes = new HashSet<int>();
            HashSet<int> SimplifyNodes = new HashSet<int>();
            HashSet<int> FreezeNodes = new HashSet<int>();
            HashSet<int> SiginificantNodes = new HashSet<int>();
            HashSet<int> SpilledNodes = new HashSet<int>();
            HashSet<int> ColoredNodes = new HashSet<int>();
            HashSet<int> CoalescedNodes = new HashSet<int>();
            HashSet<int> NodeMoves = new HashSet<int>();
            Stack<int> SelectStack = new Stack<int>();
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