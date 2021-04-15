using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class real_jmp : RTInstruction
    {
        int imm;

        internal real_jmp(int imm)
        {
            this.imm = imm;

        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[31] = sRF[31] + imm;


        }

        public override string ToString()
        {
            return "jmp " + imm;
        }
    }

    class jmp_link : RTInstruction
    {
        int imm;

        internal jmp_link(int imm)
        {
            this.imm = imm;

        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[30] = sRF[31];
            sRF[31] = sRF[31] + imm;


        }

        public override string ToString()
        {
            return "jmp_link " + imm;
        }
    }


}