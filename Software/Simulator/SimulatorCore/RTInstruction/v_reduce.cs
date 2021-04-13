using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class v_reduce : RTInstruction
    {
        int r0, r1;

        internal v_reduce(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = vRF[r1].W + vRF[r1].X + vRF[r1].Y + vRF[r1].Z;


        }

        public override string ToString()
        {
            return "v_reduce r" + r0 + " r" + r1;
        }
    }


}