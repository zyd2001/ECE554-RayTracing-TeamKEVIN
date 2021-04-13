using System;
using System.Numerics;


namespace SimulatorCore
{
    class s_write_high : RTInstruction
    {
        int r0;
        int imm;

        internal s_write_high(int r0, int imm)
        {
            this.r0 = r0;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            imm = imm << 16;
            sRF[r0] = sRF[r0].i | imm;

        }

        public override string ToString()
        {
            return "s_write_high r" + r0 + " " + imm;
        }
    }

    class s_write_low : RTInstruction
    {
        int r0;
        int imm;

        internal s_write_low(int r0, int imm)
        {
            this.r0 = r0;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r0].i | imm;

        }

        public override string ToString()
        {
            return "s_write_low r" + r0 + " " + imm;
        }
    }


}