using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class itof : RTInstruction
    {
        int r0, r1;

        internal itof(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;

        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = (float)sRF[r1].i;


        }

        public override string ToString()
        {
            return "itof r" + r0 + " r" + r1;
        }
    }


}