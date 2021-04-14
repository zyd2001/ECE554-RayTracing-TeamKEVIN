using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class not : RTInstruction
    {
        int r0, r1;

        internal not(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;

        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = ~sRF[1].i;


        }

        public override string ToString()
        {
            return "not r" + r0 + " r" + r1;
        }
    }


}