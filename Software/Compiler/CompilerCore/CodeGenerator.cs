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
        internal List<string> FunctionArgument { get; set; } = null;
        internal Type returnType { get; set; } = Type.NULL;
        internal bool CallerSave { get; set; } = false;
        internal bool CallerRestore { get; set; } = false;

        internal void Copy(Assembly asm)
        {
            this.OPCode = asm.OPCode;
            this.Operands = asm.Operands;
            this.UsedLabel = asm.UsedLabel;
            this.Label = asm.Label;
            this.SUse = asm.SUse;
            this.VUse = asm.VUse;
            this.SDef = asm.SDef;
            this.VDef = asm.VDef;
        }

        internal Assembly(string opcode, List<string> operands)
        {
            OPCode = opcode;
            Operands = operands;
            calculateUseDef();
        }

        internal void calculateUseDef()
        {
            var vuse = ImmutableHashSet.CreateBuilder<string>();
            var suse = ImmutableHashSet.CreateBuilder<string>();
            var vdef = ImmutableHashSet.CreateBuilder<string>();
            var sdef = ImmutableHashSet.CreateBuilder<string>();
            if (OPCode == "jmp_link")
            {
                foreach (var item in FunctionArgument)
                    if (item[1] == 'V')
                        vuse.Add(item);
                    else
                        suse.Add(item);
            }
            if (OPCode == "ret")
            {
                for (int i = 0, index = 27; i < 10; i++, index--)
                    suse.Add($"RS{index}");
                for (int i = 0, index = 15; i < 6; i++, index--)
                    vuse.Add($"RV{index}");
                if (returnType == Type.NULL)
                    throw new Exception("fv<k");
                if (returnType == Type.VECTOR)
                    vuse.Add("RV1");
                else
                    suse.Add("RS1");
            }
            if (Operands.Count > 0)
            {
                if (withVariable(OPCode))
                {
                    // if (OPCode == "s_push")
                    //     suse.Add(Operands[0]);
                    // else if (OPCode == "v_push")
                    //     vuse.Add(Operands[0]);
                    // else if (OPCode == "s_pop")
                    //     sdef.Add(Operands[0]);
                    // else if (OPCode == "v_pop")
                    //     vdef.Add(Operands[0]);
                    // else 
                    if (OPCode == "v_get_from_s") // first need to be changed to v_get_from_s_d
                    {
                        vdef.Add(Operands[0]);
                        vuse.Add(Operands[0]);
                        suse.Add(Operands[1]);
                    }
                    else if (OPCode == "s_write_high") // always comes after s_write_low
                    {
                        sdef.Add(Operands[0]);
                        suse.Add(Operands[0]);
                    }
                    else if (OPCode[0] == 'c' || OPCode == "s_store_4byte" || OPCode == "v_store_4byte")
                    {
                        for (int i = 0; i < 2; i++)
                        {
                            string op = Operands[i];
                            if (!checkRegister(op))
                                if (op[1] == 'V')
                                    vuse.Add(op);
                                else
                                    suse.Add(op);
                        }
                    }
                    else
                    {
                        if (!checkRegister(Operands[0]))
                            if (Operands[0][1] == 'V')
                                vdef.Add(Operands[0]);
                            else
                                sdef.Add(Operands[0]);
                        for (int i = 1; i < Operands.Count; i++)
                        {
                            // TODO: register
                            string op = Operands[i];
                            if (op[0] == '.' || op[0] == 'R') // do not add constant
                            {
                                if (!checkRegister(op))
                                    if (op[1] == 'V')
                                        vuse.Add(op);
                                    else
                                        suse.Add(op);
                            }
                        }
                    }
                }
            }
            SUse = suse.ToImmutable();
            VUse = vuse.ToImmutable();
            SDef = sdef.ToImmutable();
            VDef = vdef.ToImmutable();
        }

        internal void changeDef(string newDef)
        {
            Operands[0] = newDef;
            calculateUseDef();
        }

        internal void changeUse(string oldUse, string newUse)
        {
            Operands[Operands.IndexOf(oldUse)] = newUse;
            calculateUseDef();
            return;
        }

        private static bool checkRegister(string operand)
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
                    return false;
                default:
                    return true;
            }
        }

        internal Assembly(string opcode, Type type)
        {
            OPCode = opcode;
            Operands = new List<string>();
            returnType = type;
            calculateUseDef();
        }

        internal Assembly(string opcode, string label, List<string> args)
        {
            OPCode = opcode;
            Operands = new List<string> { label };
            FunctionArgument = args;
            calculateUseDef();
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
        internal List<string> FunctionNames { get; } = new List<string>();
        internal List<FunctionDefinitionStatement> Functions { get; } = new List<FunctionDefinitionStatement>();
        internal Dictionary<string, (List<(int, int)> s, List<(int, int)> v)> FunctionSaveRegisterPair { get; }
            = new Dictionary<string, (List<Move> s, List<Move> v)>();
        internal void AddLabel(string label, bool nextLine = true)
        {
            int index = nextLine ? List.Count : List.Count - 1;
            ReverseLabels.TryAdd(index, label);
            Labels.Add(label, index);
        }
        internal void AddFunctionLabel(string functionName, FunctionDefinitionStatement function)
        {
            ReverseLabels.Add(List.Count, functionName);
            Labels.Add(functionName, List.Count);
            FunctionNames.Add(functionName);
            Functions.Add(function);
        }

        internal void AddFunctionCall(string label, List<string> args)
        {
            BranchList.Add((new Assembly("jmp_link", label, args), List.Count));
            AddAssembly(""); // placeholder
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
        internal void AddReturn(string v, Type returnType)
        {
            List.Add(new Assembly(v, returnType));
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
            foreach (var item in FunctionNames) // assign function labels and split the program
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
            var names = function.parameterList.Names();
            int vectors = 1, scalars = 1;
            for (int i = 0; i < types.Count; i++)
                if (types[i] == Type.VECTOR)
                {
                    AddAssembly("v_mov", names[i], $"RV{vectors}");
                    vectors++;
                }
                else
                {
                    AddAssembly("s_mov", names[i], $"RS{scalars}");
                    scalars++;
                }
            // scalars = types.Count - vectors;
            // var d = (new List<(int, int)>(), new List<(int, int)>());
            // FunctionSaveRegisterPair.Add(function.functionName, d);
            // if (function.functionName != "main") // main do not need save anything
            // {
            //     for (int i = 0, index = 27; i < 10; i++, index--)
            //     {
            //         int c = Statement.VariableCounter;
            //         AddAssembly("s_mov", $".S{c}", $"RS{index}");
            //         d.Item1.Add((c, index));
            //     }
            //     for (int i = 0, index = 15; i < 6; i++, index--)
            //     {
            //         int c = Statement.VariableCounter;
            //         AddAssembly("v_mov", $".V{c}", $"RV{index}");
            //         d.Item2.Add((c, index));
            //     }
            // }
        }

        internal void AddEpilogue(FunctionDefinitionStatement function)
        {
            // for (int i = 0, index = 27; i < 10; i++, index--)
            // {
            //     int c = Statement.VariableCounter;
            //     AddAssembly("s_mov", $"RS{index}", $".S{c}");
            //     // d.Item1.Add((c, index));
            // }
            // for (int i = 0, index = 15; i < 6; i++, index--)
            // {
            //     int c = Statement.VariableCounter;
            //     AddAssembly("v_mov", $"RV{index}", $".V{c}");
            //     // d.Item2.Add((c, index));
            // }
            // foreach (var item in FunctionSaveRegisterPair[function.functionName].s)
            //     AddAssembly("s_mov", $"RS{item.Item2}", $".S{item.Item1}");
            // foreach (var item in FunctionSaveRegisterPair[function.functionName].v)
            //     AddAssembly("v_mov", $"RV{item.Item2}", $".V{item.Item1}");
            AddAssembly("s_mov", "RS29", "RS28");
            AddAssembly("s_pop", "RS28");
        }

        internal void AddCallerSave()
        {
            AddAssembly("");
            List[^1].CallerSave = true;
        }

        internal void AddCallerRestore()
        {
            AddAssembly("");
            List[^1].CallerRestore = true;
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
            List<FunctionTranslation> list = new List<FunctionTranslation>();
            Dictionary<string, (SortedSet<int> s, SortedSet<int> v)> rlist =
                new Dictionary<string, (SortedSet<int> s, SortedSet<int> v)>();
            for (int i = 0; i < directTranslation.ListOfList.Count; i++)
            {
                var item = directTranslation.ListOfList[i];
                var f = new FunctionTranslation(item, directTranslation.LabelReferences,
                     directTranslation.Functions[i]);
                list.Add(f);
                rlist.Add(item[0].Label, RegisterAllocator.fk(f));
            }
            foreach (var item in list)
                item.ResolveCallerSave(rlist);
            foreach (var item in list)
                item.Output(Console.Out);
            // directTranslation.Print();
        }
    }
}