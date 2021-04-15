using System.Numerics;
using System.IO;
using System.Collections.Generic;

namespace SimulatorCore
{
    public class RayTracing
    {
        public Memory InstructionMemory { get; }
        public Memory DataMemory { get; }
        public RegisterFile<Scalar> ScalarRegisterFile { get; }
        public RegisterFile<Vector4> VectorRegisterFile { get; }
        IntersectionCore IC;
        Dictionary<int, RTInstruction> cache;
        Decoder decoder;

        public RayTracing(Memory insMem, Memory triangleMem, Memory dataMem)
        {
            ScalarRegisterFile = new RegisterFile<Scalar>(32);
            VectorRegisterFile = new RegisterFile<Vector4>(16);
            InstructionMemory = insMem;
            DataMemory = dataMem;
            IC = new IntersectionCore(triangleMem);
            cache = new Dictionary<int, RTInstruction>(insMem.Mem.Length / 4);
            decoder = new Decoder(File.OpenText("RT.isa"), 6);
        }

        public bool Step()
        {
            int PC = ScalarRegisterFile[31];
            RTInstruction ins;
            if (!cache.TryGetValue(PC, out ins))
            {
                ins = (RTInstruction)decoder.Decode(InstructionMemory.Read(PC));
                cache[PC] = ins;
            }
            if (ins is fin)
                return true;
            ScalarRegisterFile[31] += 4;
            ins.Process(VectorRegisterFile, ScalarRegisterFile, DataMemory, IC);
            return false;
        }

        public void StartTrace()
        {
            DataMemory.StartTrace();
            ScalarRegisterFile.StartTrace();
            VectorRegisterFile.StartTrace();
        }

        public void EndTrace()
        {
            DataMemory.EndTrace();
            ScalarRegisterFile.EndTrace();
            VectorRegisterFile.EndTrace();
        }
    }
}