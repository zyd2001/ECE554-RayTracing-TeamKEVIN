using System.Numerics;
using System.Runtime.InteropServices;
using System;

namespace SimulatorCore
{
    class s_sqrt : RTInstruction
    {
        int r0, r1;

        internal s_sqrt(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = MathF.Sqrt(sRF[r1]);


        }

        public override string ToString()
        {
            return "s_sqrt r" + r0 + " r" + r1;
        }
    }


}