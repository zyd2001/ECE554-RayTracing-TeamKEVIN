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
            decoder = new Decoder(File.OpenText("SimulatorCore/RTInstruction/RT.isa"), 6);
        }

        public bool Step()
        {
            int PC = ScalarRegisterFile[31];
            RTInstruction ins;
            if (!cache.TryGetValue(PC, out ins))
            {
                ins = (RTInstruction)decoder.Decode(InstructionMemory.Read(PC));
                cache[PC] = ins;
                if (ins is fin)
                    return true;
            }
            ins.process(VectorRegisterFile, ScalarRegisterFile, DataMemory, IC);
            ScalarRegisterFile[31] += 4;
            return false;
        }
    }
}