using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Text;
using Set = System.Collections.Immutable.ImmutableHashSet<string>;
using Move = System.ValueTuple<int, int>;


namespace CompilerCore
{
    class Assembly
    {
        internal string OPCode { get; set; }
        internal List<string> Operands { get; set; }
        internal Set SUse { get; set; } = Set.Empty;
        internal Set VUse { get; set; } = Set.Empty;
        internal Set SDef { get; set; } = Set.Empty;
        internal Set VDef { get; set; } = Set.Empty;
        internal string UsedLabel { get; set; } = null;
        // internal HashSet<int> Predecessor { get; } = new HashSet<int>();
        internal HashSet<Assembly> Successor { get; } = new HashSet<Assembly>();
        internal Set SIn { get; set; } = Set.Empty;
        internal Set VIn { get; set; } = Set.Empty;
        internal Set SOut { get; set; } = Set.Empty;
        internal Set VOut { get; set; } = Set.Empty;
        internal string Label { get; set; } = null;

        internal void Copy(Assembly asm)
        {
            this.OPCode = asm.OPCode;
            this.Operands = asm.Operands;
            this.UsedLabel = asm.UsedLabel;
            this.Label = asm.Label;
        }

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
                            if (op[0] == '.' || op[0] == 'R') // do not add constant
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
        internal Dictionary<string, Assembly> LabelReferences { get; } = new Dictionary<string, Assembly>();
        internal Dictionary<string, int> Labels { get; } = new Dictionary<string, int>();
        internal Dictionary<int, string> ReverseLabels { get; } = new Dictionary<int, string>();
        internal Dictionary<string, Assembly> FunctionStackWaiting { get; } = new Dictionary<string, Assembly>();
        internal Dictionary<string, (List<(int, int)> s, List<(int, int)> v)> FunctionSaveRegisterPair { get; }
            = new Dictionary<string, (List<Move> s, List<Move> v)>();
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
                List[item.index].Copy(item.ins);
                Assembly target = List[Labels[label]];
                target.Label = resultLabel;
                LabelReferences.TryAdd(resultLabel, target);
            }
        }

        internal void ConstructFlowGraph()
        {
            for (int i = 0; i < List.Count; i++)
            {
                Assembly ins = List[i];
                // ins.Predecessor.Add(i - 1);
                if (ins.UsedLabel == null || ins.OPCode == "jmp_link") // function call will return
                {
                    if (i + 1 < List.Count)
                        ins.Successor.Add(List[i + 1]);
                }
                else  // is branch
                {
                    if (ins.OPCode[0] == 'b')
                        if (i + 1 < List.Count)
                            ins.Successor.Add(List[i + 1]); // branch may not proceed
                    Assembly target = LabelReferences[ins.UsedLabel];
                    ins.Successor.Add(target);
                    // List[index].Predecessor.Add(i);
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
                    SOuts[i] = ins.SOut;
                    ins.SIn = ins.SUse.Union(ins.SOut.Except(ins.SDef));
                    HashSet<string> tempSIn = new HashSet<string>();
                    foreach (var assembly in ins.Successor)
                        tempSIn.UnionWith(assembly.SIn);
                    ins.SOut = tempSIn.ToImmutableHashSet();
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
                break;
            }
            while (true)
            {
                for (int i = List.Count - 1; i >= 0; i--)
                {
                    Assembly ins = List[i];
                    VIns[i] = ins.VIn;
                    VOuts[i] = ins.VOut;
                    ins.VIn = ins.VUse.Union(ins.VOut.Except(ins.VDef));
                    HashSet<string> tempVIn = new HashSet<string>();
                    foreach (var assembly in ins.Successor)
                        tempVIn.UnionWith(assembly.VIn);
                    ins.VOut = tempVIn.ToImmutableHashSet();
                }
                int _i = 0;
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

        // v_get_from_s always appear consecutively on same temp var, so there will be no inference

        internal (InferenceGraph sgraph, InferenceGraph vgraph) CreateInferenceGraph()
        {
            ConstructFlowGraph();
            CalculateLiveSpan();
            InferenceGraph sgraph = new InferenceGraph(SIns, SOuts);
            InferenceGraph vgraph = new InferenceGraph(VIns, VOuts);
            foreach (var ins in List)
            {
                if (ins.OPCode.Contains("mov"))
                {
                    ins.SOut = ins.SOut.Except(ins.SUse);
                    ins.VOut = ins.VOut.Except(ins.VUse);
                    if (ins.OPCode[0] == 's')
                    {
                        if (ins.SDef.Overlaps(ins.SOut)) // if define is used
                        {
                            sgraph.AddToWorklistMoves(ins.SDef, ins.SUse);
                            foreach (var item in ins.SUse.Union(ins.SDef))
                                sgraph.AddToMoveList(item, ins.SDef, ins.SUse);
                        }
                    }
                    else
                    {
                        if (ins.VDef.Overlaps(ins.VOut))
                        {
                            vgraph.AddToWorklistMoves(ins.VDef, ins.VUse);
                            foreach (var item in ins.VUse.Union(ins.VDef))
                                vgraph.AddToMoveList(item, ins.VDef, ins.VUse);
                        }
                    }
                }
                // if define is not used
                if (ins.SDef.Overlaps(ins.SOut))
                    foreach (var a in ins.SDef)
                        foreach (var b in ins.SOut)
                            sgraph.AddEdge(a, b);
                if (ins.VDef.Overlaps(ins.VOut))
                    foreach (var a in ins.VDef)
                        foreach (var b in ins.VOut)
                            vgraph.AddEdge(a, b);
            }
            return (sgraph, vgraph);
        }

        internal void Print()
        {
            for (int i = 0; i < List.Count; i++)
            {
                if (List[i].Label is not null)
                    Console.Write(List[i].Label + ":");
                Console.WriteLine("\t" + List[i]);
            }
        }

        internal void AddPrologue(FunctionDefinitionStatement function)
        {
            AddAssembly("s_push", "R28");
            AddAssembly("s_mov", "R28", "R29");
            AddAssembly("ii_addi", "R29", "R29", "wtf");
            FunctionStackWaiting.Add(function.functionName, List[^1]); // wait for calculating stack size
            var types = function.parameterList.Types();
            int vectors = 0, scalars;
            foreach (var t in types)
                if (t == Type.VECTOR)
                    vectors++;
            scalars = types.Count - vectors;
            var d = (new List<(int, int)>(), new List<(int, int)>());
            FunctionSaveRegisterPair.Add(function.functionName, d);
            for (int i = 0, index = 27; i < scalars; i++, index--)
            {
                int c = Statement.VariableCounter;
                AddAssembly("s_mov", $".S{c}", $"RS{index}");
                d.Item1.Add((c, index));
            }
            for (int i = 0, index = 15; i < vectors; i++, index--)
            {
                int c = Statement.VariableCounter;
                AddAssembly("v_mov", $".V{c}", $"RV{index}");
                d.Item2.Add((c, index));
            }
        }

        internal void AddEpilogue(FunctionDefinitionStatement function)
        {
            foreach (var item in FunctionSaveRegisterPair[function.functionName].s)
                AddAssembly("s_mov", $"RS{item.Item2}", $".S{item.Item1}");
            foreach (var item in FunctionSaveRegisterPair[function.functionName].v)
                AddAssembly("v_mov", $"RV{item.Item2}", $".V{item.Item1}");
            AddAssembly("s_mov", "R29", "R28");
            AddAssembly("s_pop", "R28");
        }
    }
    class InferenceGraph
    {
        internal Dictionary<string, int> Map { get; } = new Dictionary<string, int>();
        internal List<string> ReverseMap { get; } = new List<string>();

        internal ImmutableHashSet<int>[] AdjacentList { get; set; } = null;
        internal ImmutableHashSet<int>.Builder[] AdjacentListBuilder { get; } = null;
        internal bool[,] AdjacentMatrix { get; } = null;
        // internal Dictionary<Move, int> MoveMap { get; } = new Dictionary<Move, int>();
        // internal List<Move> ReverseMoveMap { get; } = new List<Move>();
        internal HashSet<Move>[] MoveList = null;
        internal HashSet<Move> WorklistMoves = new HashSet<Move>();
        internal int[] Degree = null;

        public InferenceGraph(List<Set> ins, List<Set> outs)
        {
            for (int i = 0; i < ins.Count; i++)
            {
                foreach (var item in ins[i])
                {
                    if (Map.TryAdd(item, ReverseMap.Count))
                        ReverseMap.Add(item);
                }
                foreach (var item in outs[i])
                {
                    if (Map.TryAdd(item, ReverseMap.Count))
                        ReverseMap.Add(item);
                }
            }
            AdjacentListBuilder = Enumerable.Range(0, ReverseMap.Count).Select((i) => ImmutableHashSet.CreateBuilder<int>()).ToArray();
            AdjacentList = new ImmutableHashSet<int>[ReverseMap.Count];
            AdjacentMatrix = new bool[ReverseMap.Count, ReverseMap.Count];
            MoveList = Enumerable.Range(0, ReverseMap.Count).Select((i) => new HashSet<Move>()).ToArray();
            Degree = new int[ReverseMap.Count];
        }
        internal void AddEdge(string a, string b)
        {
            int ia = Map[a];
            int ib = Map[b];
            Degree[ia]++;
            AdjacentListBuilder[ia].Add(ib);
            AdjacentMatrix[ia, ib] = true;
            Degree[ib]++;
            AdjacentMatrix[ib, ia] = true;
            AdjacentListBuilder[ib].Add(ia);
        }
        internal void AddEdge(int a, int b)
        {
            Degree[a]++;
            AdjacentListBuilder[a].Add(b);
            AdjacentMatrix[a, b] = true;
            Degree[b]++;
            AdjacentMatrix[b, a] = true;
            AdjacentListBuilder[b].Add(a);
        }

        public override string ToString()
        {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < AdjacentList.Length; i++)
            {
                builder.AppendLine(ReverseMap[i]);
                foreach (var item in AdjacentListBuilder[i])
                    builder.AppendLine($"{ReverseMap[i]} {ReverseMap[item]}");
            }
            return builder.ToString();
        }

        static T getFirstInSet<T>(ISet<T> set)
        {
            var e = set.GetEnumerator();
            e.MoveNext();
            return e.Current;
        }

        internal void AddToMoveList(string item, Set Def, Set Use)
        {
            if (Def.Count != 1 || Use.Count != 1)
                throw new Exception("fv<k");
            // if (Map.ContainsKey(getFirstInSet(Def))) 
            // {
            int u = Map[getFirstInSet(Def)];
            int v = Map[getFirstInSet(Use)];
            MoveList[Map[item]].Add((u, v));
            // }
        }

        internal void AddToWorklistMoves(Set Def, Set Use)
        {
            if (Def.Count != 1 || Use.Count != 1)
                throw new Exception("fv<k");
            // if (Map.ContainsKey(getFirstInSet(Def)))
            // {
            int u = Map[getFirstInSet(Def)];
            int v = Map[getFirstInSet(Use)];
            WorklistMoves.Add((u, v));
            // }
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
            // directTranslation.ConstructFlowGraph();
            // directTranslation.CalculateLiveSpan();
            RegisterAllocator.fk(directTranslation);
            directTranslation.Print();
        }
    }
}