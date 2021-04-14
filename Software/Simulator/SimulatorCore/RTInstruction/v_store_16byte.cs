using System.Numerics;
using System.Runtime.InteropServices;
using System;

namespace SimulatorCore
{
    class v_store_16byte : RTInstruction
    {
        int r0, r1, imm;

        internal v_store_16byte(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            mem.Write(sRF[r1].i + imm, BitConverter.GetBytes(vRF[r0].X));
            mem.Write(sRF[r1].i + imm + 4, BitConverter.GetBytes(vRF[r0].Y));
            mem.Write(sRF[r1].i + imm + 8, BitConverter.GetBytes(vRF[r0].Z));
            mem.Write(sRF[r1].i + imm + 12, BitConverter.GetBytes(vRF[r0].W));


        }

        public override string ToString()
        {
            return "v_store_16byte r" + r0 + " r" + r1 + " " + imm;
        }
    }


}