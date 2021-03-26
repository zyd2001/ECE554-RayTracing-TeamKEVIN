using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;

namespace SimulatorCore
{
    public interface IInstruction { }

    class Parser
    {
        struct Definition
        {
            internal string name;
            internal int[] bitWidths;
            internal bool[] section;
            internal int realSize;

            internal Definition(string name, int size)
            {
                this.name = name;
                bitWidths = new int[size];
                section = new bool[size];
                realSize = 0;
            }
        }

        Dictionary<uint, Definition> dict;
        int opcodeLength;
        internal Parser(StreamReader file, int opcodeLength)
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
                    if (insTokens[i] != "x")
                    {
                        newDef.section[i-1] = true;
                        newDef.realSize++;
                    }
                    else
                        newDef.section[i-1] = false;
                }
                dict[Convert.ToUInt32(encodingTokens[0], 2)] = newDef;
            }
        }

        internal IInstruction parse(ReadOnlySpan<byte> code)
        {
            uint value = BitConverter.ToUInt32(code);
            uint opcode = value >> (32 - opcodeLength);
            uint mask = 0xffffffff >> opcodeLength;
            int bitsLeft = 32 - opcodeLength;
            var def = dict[opcode];
            Type t = Type.GetType("SimulatorCore." + def.name);
            object[] arguments = new object[def.realSize];
            int counter = 0;
            for (int i = 0; i < def.section.Length; i++)
            {
                uint shiftedMask = mask >> def.bitWidths[i];
                uint newMask = mask & ~shiftedMask;
                bitsLeft -= def.bitWidths[i];
                if (def.section[i])
                {
                    arguments[counter] = (int) (value & newMask) >> bitsLeft;
                    counter++;
                }
                mask = shiftedMask;
            }
            return (IInstruction) t.GetConstructors(BindingFlags.NonPublic | BindingFlags.Instance)[0]
                .Invoke(arguments);
        }
    }
}