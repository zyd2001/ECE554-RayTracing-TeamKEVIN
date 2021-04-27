using System.IO;
using System.Collections.Generic;
using System;
using System.Threading;

namespace SimulatorCore
{
    public class CommandProcessor
    {
        public Memory Memory { get; }
        public RegisterFile<int> RegisterFile { get; }
        Dictionary<int, CPInstruction> cache;
        Decoder decoder;

        public CommandProcessor(Memory mem)
        {
            RegisterFile = new RegisterFile<int>(16);
            Memory = mem;
            // cache that stores decoded instructions
            cache = new Dictionary<int, CPInstruction>(mem.Mem.Length / 4);
            decoder = new Decoder(File.OpenText("CP.isa"), 4);
        }

        public bool Step(int[] transferData, out bool isLaunch)
        {
            int PC = RegisterFile[15];
            CPInstruction ins;
            isLaunch = false;
            if (!cache.TryGetValue(PC, out ins))
            {
                ins = (CPInstruction)decoder.Decode(Memory.Read(PC));
                cache[PC] = ins;
            }
            if (ins is launch)
            {
                isLaunch = true;
                var l = (launch)ins;
                int address = RegisterFile[l.r0];
                for (int i = 0; i < 64; i++)
                    transferData[i] = BitConverter.ToInt32(Memory.Read(address + 4 * i));
            }
            if (ins is finish)
                return true;
            RegisterFile[15] += 4;
            ins.Process(RegisterFile, Memory);
            return false;
        }

        public bool StepConcurrent(int[] transferData, EventWaitHandle blocking, EventWaitHandle output)
        {
            int PC = RegisterFile[15];
            CPInstruction ins;
            if (!cache.TryGetValue(PC, out ins))
            {
                ins = (CPInstruction)decoder.Decode(Memory.Read(PC));
                cache[PC] = ins;
            }
            if (ins is launch)
            {
                blocking.WaitOne();
                var l = (launch)ins;
                int address = RegisterFile[l.r0];
                for (int i = 0; i < 64; i++)
                    transferData[i] = BitConverter.ToInt32(Memory.Read(address + 4 * i));
                output.Set();
            }
            if (ins is finish)
            {
                blocking.WaitOne();
                return true;
            }
            RegisterFile[15] += 4;
            ins.Process(RegisterFile, Memory);
            return false;
        }

        public void StartTrace()
        {
            Memory.StartTrace();
            RegisterFile.StartTrace();
        }

        public void EndTrace()
        {
            Memory.EndTrace();
            RegisterFile.EndTrace();
        }
    }
}