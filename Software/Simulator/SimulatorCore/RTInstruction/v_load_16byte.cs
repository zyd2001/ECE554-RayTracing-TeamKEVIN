using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class v_load_16byte : RTInstruction
    {
        int r0, r1, imm;

        internal v_load_16byte(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 vec = new Vector4(MemoryMarshal.Read<float>(mem.Read(sRF[r1].i + imm)),
            MemoryMarshal.Read<float>(mem.Read(sRF[r1].i + imm + 4)),
            MemoryMarshal.Read<float>(mem.Read(sRF[r1].i + imm + 8)),
            MemoryMarshal.Read<float>(mem.Read(sRF[r1].i + imm + 12)));
            vRF[r0] = vec;



        }

        public override string ToString()
        {
            return "v_load_16byte r" + r0 + " r" + r1 + " " + imm;
        }
    }


}