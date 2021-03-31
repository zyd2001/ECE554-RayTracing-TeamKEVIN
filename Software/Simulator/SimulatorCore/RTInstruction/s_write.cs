using System;
using System.Numerics;


namespace SimulatorCore
{
    class s_write_high : RTInstruction
    {
        int r0;
        String imm;

        internal s_write_high(int r0, String imm)
        {
            this.r0 = r0;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {


            int integer = Convert.ToInt32(imm, 2);
            integer = integer << 16;
            sRF[r0] = sRF[r0].i | integer;

        }
    }

    class s_write_low : RTInstruction
    {
        int r0;
        String imm;

        internal s_write_low(int r0, String imm)
        {
            this.r0 = r0;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {


            int integer = Convert.ToInt32(imm, 2);

            sRF[r0] = sRF[r0].i | integer;

        }
    }


}