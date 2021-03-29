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

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            mem.write(sRF[r1].i + imm,  BitConverter.GetBytes(vRF[r0].X));
            mem.write(sRF[r1].i + imm + 1,  BitConverter.GetBytes(vRF[r0].Y));
            mem.write(sRF[r1].i + imm + 2,  BitConverter.GetBytes(vRF[r0].Z));
            mem.write(sRF[r1].i + imm + 3,  BitConverter.GetBytes(vRF[r0].W));
            
            
        }
    }


}