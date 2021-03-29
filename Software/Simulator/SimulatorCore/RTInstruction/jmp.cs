using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class jmp : RTInstruction
    {
        int imm;

        internal jmp(int imm)
        {
            this.imm = imm;

        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[31] = sRF[31] + imm;


        }
    }

    class jmp_link : RTInstruction
    {
        int imm;

        internal jmp_link(int imm)
        {
            this.imm = imm;

        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[30] = sRF[31];
            sRF[31] = sRF[31] + imm;


        }
    }


}