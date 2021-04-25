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
                        {
                            string op = operands[i];
                            switch (op)
                            {
                                case "RS0":
                                case "RV0":
                                case "RS28":
                                case "RS29":
                                case "RS30":
                                case "RS31":
                                    break;
                                default:
                                    if (op[1] == 'V')
                                        vuse.Add(op);
                                    else
                                        suse.Add(op);
                                    break;
                            }
                        }
                    }
                    else
                    {
                        switch (operands[0])
                        {
                            case "RS0":
                            case "RV0":
                            case "RS28":
                            case "RS29":
                            case "RS30":
                            case "RS31":
                                break;
                            default:
                                if (operands[0][1] == 'V')
                                    vdef.Add(operands[0]);
                                else
                                    sdef.Add(operands[0]);
                                break;
                        }
                        for (int i = 1; i < operands.Count; i++)
                        {
                            // TODO: register
                            string op = operands[i];
                            if (op[0] == '.' || op[0] == 'R') // do not add constant
                            {
                                switch (op)
                                {
                                    case "RS0":
                                    case "RV0":
                                    case "RS28":
                                    case "RS29":
                                    case "RS30":
                                    case "RS31":
                                        break;
                                    default:
                                        if (op[1] == 'V')
                                            vuse.Add(op);
                                        else
                                            suse.Add(op);
                                        break;
                                }

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
        internal List<List<Assembly>> ListOfList { get; } = new List<List<Assembly>>();
        internal List<(Assembly ins, int index)> BranchList { get; } = new List<(Assembly ins, int index)>();
        internal Dictionary<string, Assembly> LabelReferences { get; } = new Dictionary<string, Assembly>();
        internal Dictionary<string, int> Labels { get; } = new Dictionary<string, int>();
        internal Dictionary<int, string> ReverseLabels { get; } = new Dictionary<int, string>();
        internal Dictionary<string, Assembly> FunctionStackWaiting { get; } = new Dictionary<string, Assembly>();
        internal List<string> Functions { get; } = new List<string>();
        internal Dictionary<string, (List<(int, int)> s, List<(int, int)> v)> FunctionSaveRegisterPair { get; }
            = new Dictionary<string, (List<Move> s, List<Move> v)>();
        internal void AddLabel(string label, bool nextLine = true)
        {
            int index = nextLine ? List.Count : List.Count - 1;
            ReverseLabels.TryAdd(index, label);
            Labels.Add(label, index);
        }
        internal void AddFunctionLabel(string functionName)
        {
            ReverseLabels.Add(List.Count, functionName);
            Labels.Add(functionName, List.Count);
            Functions.Add(functionName);
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
            int last = -1;
            foreach (var item in Functions) // assign function labels and split the program
            {
                int index = Labels[item];
                List[index].Label = item;
                if (last != -1)
                    ListOfList.Add(new List<Assembly>(List.GetRange(last, index - last)));
                last = index;
            }
            ListOfList.Add(new List<Assembly>(List.GetRange(last, List.Count - last)));
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
            AddAssembly("s_push", "RS28");
            AddAssembly("s_mov", "RS28", "RS29");
            AddAssembly("ii_addi", "RS29", "RS29", "wtf");
            FunctionStackWaiting.Add(function.functionName, List[^1]); // wait for calculating stack size
            var types = function.parameterList.Types();
            int vectors = 0, scalars;
            foreach (var t in types)
                if (t == Type.VECTOR)
                    vectors++;
            scalars = types.Count - vectors;
            var d = (new List<(int, int)>(), new List<(int, int)>());
            FunctionSaveRegisterPair.Add(function.functionName, d);
            for (int i = 0, index = 27; i < 27 - scalars; i++, index--)
            {
                int c = Statement.VariableCounter;
                AddAssembly("s_mov", $".S{c}", $"RS{index}");
                d.Item1.Add((c, index));
            }
            for (int i = 0, index = 15; i < 15 - vectors; i++, index--)
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
            AddAssembly("s_mov", "RS29", "RS28");
            AddAssembly("s_pop", "RS28");
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
            foreach (var item in directTranslation.ListOfList)
            {
                var f = new FunctionTranslation(item, directTranslation.LabelReferences);
                RegisterAllocator.fk(f);
            }
            directTranslation.Print();
        }
    }
}