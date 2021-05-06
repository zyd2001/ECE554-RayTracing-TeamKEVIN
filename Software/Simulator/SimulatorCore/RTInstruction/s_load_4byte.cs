using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class s_load_4byte : RTInstruction
    {
        int r0, r1, imm;

        internal s_load_4byte(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[r1] >= 0x20000000)
                sRF[r0] = MemoryMarshal.Read<int>(mem.Read(sRF[r1].i + imm, true));
            else
                sRF[r0] = MemoryMarshal.Read<int>(mem.Read(sRF[r1].i + imm));


        }

        public override string ToString()
        {
            return "s_load_4byte r" + r0 + " r" + r1 + " " + imm;
        }
    }


}