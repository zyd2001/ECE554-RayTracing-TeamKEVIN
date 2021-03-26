using System;
using System.Collections.Generic;
using System.IO;

namespace SimulatorCore
{
    public interface IInstruction {}

    class Parser
    {
        struct Definition
        {
            int opcode;
            int[] bitSizes;
        }

        Dictionary<String, Definition> dict;
        
        internal Parser(StreamReader file)
        {
            
        }

        internal IInstruction parse(ReadOnlySpan<byte> code)
        {
            return null;
        }
    }
}