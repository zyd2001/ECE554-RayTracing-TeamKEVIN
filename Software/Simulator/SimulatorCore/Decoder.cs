using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;

namespace SimulatorCore
{
    public interface IInstruction { }

    class Decoder
    {
        enum OperandType
        {
            Placeholder,
            Register,
            Immediate,
            Unsigned
        }
        struct Definition
        {
            internal string name;
            internal int[] bitWidths;
            internal OperandType[] section;
            internal int realSize;

            internal Definition(string name, int size)
            {
                this.name = name;
                bitWidths = new int[size];
                section = new OperandType[size];
                realSize = 0;
            }
        }

        Dictionary<uint, Definition> dict;
        int opcodeLength;
        internal Decoder(StreamReader file, int opcodeLength)
        {
            this.opcodeLength = opcodeLength;
            dict = new Dictionary<uint, Definition>();
            while (!file.EndOfStream)
            {
                string ins = file.ReadLine();
                string encoding = file.ReadLine();
                if (String.IsNullOrWhiteSpace(ins)) // handle empty line at end
                    break;
                var insTokens = ins.Trim().Split(' ');
                var encodingTokens = encoding.Trim().Split(' ');
                if (encodingTokens[0] == "#") // ignore pseudo instruction
                    continue;
                Definition newDef = new Definition(insTokens[0], insTokens.Length - 1);
                for (int i = 1; i < insTokens.Length; i++)
                {
                    newDef.bitWidths[i - 1] = int.Parse(encodingTokens[i]);
                    switch (insTokens[i])
                    {
                        case "r":
                            newDef.section[i - 1] = OperandType.Register;
                            newDef.realSize++;
                            break;
                        case "i":
                        case "l":
                            newDef.section[i - 1] = OperandType.Immediate;
                            newDef.realSize++;
                            break;
                        case "ui":
                            newDef.section[i - 1] = OperandType.Unsigned;
                            newDef.realSize++;
                            break;
                        default:
                            newDef.section[i - 1] = OperandType.Placeholder;
                            break;
                    }
                }
                dict[Convert.ToUInt32(encodingTokens[0], 2)] = newDef;
            }
        }

        internal IInstruction Decode(ReadOnlySpan<byte> code)
        {
            uint value = BitConverter.ToUInt32(code);
            uint opcode = value >> (32 - opcodeLength);
            int bitsBefore = opcodeLength;
            var def = dict[opcode];
            Type t = Type.GetType("SimulatorCore." + def.name);
            object[] arguments = new object[def.realSize];
            int counter = 0;
            for (int i = 0; i < def.section.Length; i++)
            {
                switch (def.section[i])
                {
                    case OperandType.Register:
                        // convert to int, no operand will have larger value
                        arguments[counter] = (int)((value << bitsBefore) >> (32 - def.bitWidths[i]));
                        counter++;
                        break;
                    case OperandType.Immediate:
                        arguments[counter] = ((int)value << bitsBefore) >> (32 - def.bitWidths[i]);
                        counter++;
                        break;
                    case OperandType.Unsigned:
                        arguments[counter] = (int)((value << bitsBefore) >> (32 - def.bitWidths[i]));
                        counter++;
                        break;
                    default:
                        break;
                }
                bitsBefore += def.bitWidths[i];
            }
            return (IInstruction)t.GetConstructors(BindingFlags.NonPublic | BindingFlags.Instance)[0]
                .Invoke(arguments);
        }
    }
}