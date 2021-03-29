using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class cmp_v : RTInstruction
    {
        int r0, r1;

        internal cmp_v(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;

        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            // flag register represented by 33rd register in scalar reg file
            // only for simulator representation
            if (Vector4.Equals(vRF[r0], vRF[r1]))
            {
                sRF[32] = 0; // 0 if equal
            }
            else
            {
                sRF[32] = 3; // anything else if not equal
            }


        }


    }

    class cmp_i : RTInstruction
    {
        int r0, r1;

        internal cmp_i(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;

        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            // flag register represented by 33rd register in scalar reg file
            // only for simulator representation
            if (sRF[r0].i == sRF[r1].i)
            {
                sRF[32] = 0;
            }
            else if (sRF[r0].i < sRF[r1].i)
            {
                sRF[32] = 1;
            }
            else if (sRF[r0].i > sRF[r1].i)
            {
                sRF[32] = 2;
            }


        }


    }

    class cmp_f : RTInstruction
    {
        int r0, r1;

        internal cmp_f(int r0, int r1)
        {
            this.r0 = r0;
            this.r1 = r1;

        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            // flag register represented by 33rd register in scalar reg file
            // only for simulator representation
            if (sRF[r0].f == sRF[r1].f)
            {
                sRF[32] = 0;
            }
            else if (sRF[r0].f < sRF[r1].f)
            {
                sRF[32] = 1;
            }
            else if (sRF[r0].f > sRF[r1].f)
            {
                sRF[32] = 2;
            }


        }


    }


}