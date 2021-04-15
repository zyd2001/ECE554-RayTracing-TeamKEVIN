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

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            uint shift = (uint)imm << 16;
            sRF[r0] = (int)((uint)sRF[r0].i & 0x0000ffff | shift);
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

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = (int)(sRF[r0].i & 0xffff0000 | (uint)imm);
        }

        public override string ToString()
        {
            return "s_write_low r" + r0 + " " + imm;
        }
    }


}