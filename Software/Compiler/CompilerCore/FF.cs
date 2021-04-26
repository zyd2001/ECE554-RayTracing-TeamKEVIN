using System.Collections.Generic;
using System.Collections.Immutable;
using Set = System.Collections.Immutable.ImmutableHashSet<string>;
using System.Linq;
using System.IO;
using System;

namespace CompilerCore
{
    class FunctionTranslation
    {
        internal LinkedList<Assembly> List { get; }
        internal List<Set> SIns { get; set; } = null;
        internal List<Set> VIns { get; set; } = null;
        internal List<Set> SOuts { get; set; } = null;
        internal List<Set> VOuts { get; set; } = null;
        internal Dictionary<string, Assembly> LabelReferences { get; }

        internal FunctionTranslation(List<Assembly> list, Dictionary<string, Assembly> r)
        {
            List = new LinkedList<Assembly>(list);
            LabelReferences = r;
        }

        internal void ConstructFlowGraph()
        {
            for (var node = List.First; node != null; node = node.Next)
            {
                Assembly ins = node.Value;
                // ins.Predecessor.Add(i - 1);
                if (ins.OPCode == "ret" || ins.OPCode == "Fin")
                {
                    // no successor
                }
                else if (ins.UsedLabel == null || ins.OPCode == "jmp_link") // function call will return
                {
                    if (node.Next is not null)
                        ins.Successor.Add(node.Next.Value);
                }
                else  // is branch
                {
                    if (ins.OPCode[0] == 'b')
                        if (node.Next is not null)
                            ins.Successor.Add(node.Next.Value); // branch may not proceed
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
                var node = List.Last;
                for (int i = List.Count - 1; node != null; i--, node = node.Previous)
                {
                    Assembly ins = node.Value;
                    if (ins.OPCode == "ret")
                        ins.SOut = ins.SUse;
                    SIns[i] = ins.SIn;
                    SOuts[i] = ins.SOut;
                    ins.SIn = ins.SUse.Union(ins.SOut.Except(ins.SDef));
                    if (ins.OPCode != "ret")
                    {
                        HashSet<string> tempSIn = new HashSet<string>();
                        foreach (var assembly in ins.Successor)
                            tempSIn.UnionWith(assembly.SIn);
                        ins.SOut = tempSIn.ToImmutableHashSet();
                    }
                }
                bool pass = true;
                node = List.First;
                for (int i = 0; node != null; i++, node = node.Next)
                {
                    if (!SIns[i].SetEquals(node.Value.SIn))
                    {
                        pass = false;
                        break;
                    }
                }
                if (!pass)
                    continue;
                node = List.First;
                for (int i = 0; node != null; i++, node = node.Next)
                {
                    if (!SOuts[i].SetEquals(node.Value.SOut))
                    {
                        pass = false;
                        break;
                    }
                }
                if (!pass)
                    continue;
                break;
            }
            while (true)
            {
                var node = List.Last;
                for (int i = List.Count - 1; node != null; i--, node = node.Previous)
                {
                    Assembly ins = node.Value;
                    if (ins.OPCode == "ret")
                        ins.VOut = ins.VUse;
                    VIns[i] = ins.VIn;
                    VOuts[i] = ins.VOut;
                    ins.VIn = ins.VUse.Union(ins.VOut.Except(ins.VDef));
                    if (ins.OPCode != "ret")
                    {
                        HashSet<string> tempVIn = new HashSet<string>();
                        foreach (var assembly in ins.Successor)
                            tempVIn.UnionWith(assembly.VIn);
                        ins.VOut = tempVIn.ToImmutableHashSet();
                    }
                }
                bool pass = true;
                node = List.First;
                for (int i = 0; node != null; i++, node = node.Next)
                {
                    if (!VIns[i].SetEquals(node.Value.VIn))
                    {
                        pass = false;
                        break;
                    }
                }
                if (!pass)
                    continue;
                node = List.First;
                for (int i = 0; node != null; i++, node = node.Next)
                {
                    if (!VOuts[i].SetEquals(node.Value.VOut))
                    {
                        pass = false;
                        break;
                    }
                }
                if (!pass)
                    continue;
                break;
            }
        }

        internal bool DeleteStupidLine()
        {
            bool something = false;
            for (var node = List.First; node != null; node = node.Next)
            {
                Assembly ins = node.Value;
                if (ins.OPCode != "")
                    if (withVariable(ins.OPCode))
                        if (!ins.SDef.Overlaps(ins.SOut) && !ins.VDef.Overlaps(ins.VOut))
                        {
                            if (OperandsCheck(ins.Operands))
                                continue;
                            if (ins.OPCode[0] == 'c' || ins.OPCode == "s_store_4byte" || ins.OPCode == "v_store_4byte")
                                continue;
                            something = true;
                            ins.Operands = new List<string>();
                            ins.OPCode = "";
                            ins.SUse = Set.Empty;
                            ins.SDef = Set.Empty;
                            ins.VUse = Set.Empty;
                            ins.VDef = Set.Empty;
                        }
            }
            return something;
        }

        internal static bool OperandsCheck(List<string> operands)
        {
            var list = new List<string>(operands.Intersect(new List<string> { "RS28", "RS29", "RS30" }));
            if (list.Count > 0)
                return true;
            return false;
        }

        internal static bool CheckRegister(string operand)
        {
            switch (operand)
            {
                case "RS0":
                case "RV0":
                case "RS28":
                case "RS29":
                case "RS30":
                case "RS31":
                    return true;
            }
            return false;
        }
        private static bool withVariable(string opcode)
        {
            switch (opcode[0])
            {
                case 'b':
                case 'j':
                case 'r':
                    return false;
                default:
                    return true;
            }
        }

        // v_get_from_s always appear consecutively on same temp var, so there will be no inference

        internal (InferenceGraph sgraph, InferenceGraph vgraph) CreateInferenceGraph(HashSet<string> spre, HashSet<string> vpre)
        {
            ConstructFlowGraph();
            do { CalculateLiveSpan(); }
            while (DeleteStupidLine());
            InferenceGraph sgraph = new InferenceGraph(SIns, SOuts, spre);
            InferenceGraph vgraph = new InferenceGraph(VIns, VOuts, vpre);
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

        internal void ResolvePhysicalRegister()
        {
            for (var node = List.First; node != null; node = node.Next)
            {
                Assembly ins = node.Value;
                if (ins.OPCode != "")
                    for (int i = 0; i < ins.Operands.Count; i++)
                    {
                        string op = ins.Operands[i];
                        if (op[0] == 'R')
                        {
                            if (op[0] == '.')
                                throw new Exception("unexpected");
                            int register = int.Parse(op[2..^0]);
                            ins.Operands[i] = "R" + register;
                        }
                    }

            }
        }

        internal void Output(TextWriter t)
        {
            foreach (var item in List)
            {
                if (item.Label is not null)
                    t.Write(item.Label);
                t.WriteLine("\t" + item);
            }
        }
    }
}