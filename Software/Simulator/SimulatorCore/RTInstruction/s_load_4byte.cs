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

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = MemoryMarshal.Read<int>(mem.Read(sRF[r1].i + imm));


        }
    }


}