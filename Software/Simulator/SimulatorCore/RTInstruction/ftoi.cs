using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class ftoi : RTInstruction
    {
        int r0, r1;

        internal ftoi(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;

        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = (int)sRF[r1].f;


        }

        public override string ToString()
        {
            return "ftoi r" + r0 + " r" + r1;
        }
    }


}