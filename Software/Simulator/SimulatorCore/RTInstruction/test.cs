/*using System.Numerics;

namespace SimulatorCore
{
    class ii_sub : RTInstruction
    {
        int r0, r1, r2;

        internal ii_sub(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore IC)
        {
            sRF[r0] = sRF[r1].i + sRF[r2].i;
        }
    }
}
*/