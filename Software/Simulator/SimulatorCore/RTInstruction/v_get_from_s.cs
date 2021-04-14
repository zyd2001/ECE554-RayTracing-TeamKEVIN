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
                vRF[r1] = new Vector4(sRF[r0].f, vRF[r1].Y, vRF[r1].Z, vRF[r1].W);
            }
            else if (index == 1)
            {
                vRF[r1] = new Vector4(vRF[r1].X, sRF[r0].f, vRF[r1].Z, vRF[r1].W);
            }
            else if (index == 2)
            {
                vRF[r1] = new Vector4(vRF[r1].X, vRF[r1].Y, sRF[r0].f, vRF[r1].W);
            }
            else if (index == 3)
            {
                vRF[r1] = new Vector4(vRF[r1].X, vRF[r1].Y, vRF[r1].Z, sRF[r0].f);
            }


        }

        public override string ToString()
        {
            return "v_get_from_s r" + r0 + " r" + r1 + " " + index;
        }
    }


}