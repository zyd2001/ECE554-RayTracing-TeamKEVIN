using System.Numerics;
using System;


namespace SimulatorCore
{
    class v_magn : RTInstruction
    {
        int r0, r1;

        internal v_magn(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;

        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            double x2 = Math.Pow(vRF[r1].X, 2);
            double y2 = Math.Pow(vRF[r1].Y, 2);
            double z2 = Math.Pow(vRF[r1].Z, 2);

            sRF[r0] = (float)Math.Sqrt(x2 + y2 + z2);

        }
    }


}