using System;
using System.Numerics;


namespace SimulatorCore
{
    class s_store_4byte : RTInstruction
    {
        int r0, r1, imm;

        internal s_store_4byte(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            var bytes = BitConverter.GetBytes(sRF[r0].i);
            mem.write(sRF[r1].i + imm, bytes);



        }
    }


}