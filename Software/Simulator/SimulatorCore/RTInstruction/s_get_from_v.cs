using System.Numerics;

namespace SimulatorCore
{
    class s_get_from_v : RTInstruction
    {
        int r0, r1, index;

        internal s_get_from_v(int r0, int r1, int index)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.index = index;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {


            if (index == 0)
            {
                sRF[r0] = vRF[r1].X;
            }
            else if (index == 1)
            {
                sRF[r0] = vRF[r1].Y;
            }
            else if (index == 2)
            {
                sRF[r0] = vRF[r1].Z;
            }
            else if (index == 3)
            {
                sRF[r0] = vRF[r1].W;
            }


        }
        public override string ToString()
        {
            return "s_get_from_v r" + r0 + " r" + r1 + " " + index;
        }
    }


}