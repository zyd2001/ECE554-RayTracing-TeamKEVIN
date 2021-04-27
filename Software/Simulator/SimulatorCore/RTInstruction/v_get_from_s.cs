using System.Numerics;

namespace SimulatorCore
{
    class v_get_from_s : RTInstruction
    {
        int r0, r1, index;

        internal v_get_from_s(int r0, int r1, int index)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.index = index;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {


            if (index == 0)
            {
                vRF[r0] = new Vector4(sRF[r1].f, vRF[r0].Y, vRF[r0].Z, vRF[r0].W);
            }
            else if (index == 1)
            {
                vRF[r0] = new Vector4(vRF[r0].X, sRF[r1].f, vRF[r0].Z, vRF[r0].W);
            }
            else if (index == 2)
            {
                vRF[r0] = new Vector4(vRF[r0].X, vRF[r0].Y, sRF[r1].f, vRF[r0].W);
            }
            else if (index == 3)
            {
                vRF[r0] = new Vector4(vRF[r0].X, vRF[r0].Y, vRF[r0].Z, sRF[r1].f);
            }


        }

        public override string ToString()
        {
            return "v_get_from_s r" + r0 + " r" + r1 + " " + index;
        }
    }


}