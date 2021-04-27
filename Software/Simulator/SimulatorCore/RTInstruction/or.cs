using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class or : RTInstruction
    {
        int r0, r1, r2;

        internal or(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i | sRF[r2].i;


        }

        public override string ToString()
        {
            return "or r" + r0 + " r" + r1 + " r" + r2;
        }
    }


}