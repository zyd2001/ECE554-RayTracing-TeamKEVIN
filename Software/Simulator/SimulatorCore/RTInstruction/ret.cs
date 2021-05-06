using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class ret_real : RTInstruction
    {
        int r0;

        internal ret_real(int r0)
        {
            this.r0 = r0;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[31] = sRF[r0];


        }

        public override string ToString()
        {
            return "ret";
        }
    }


}