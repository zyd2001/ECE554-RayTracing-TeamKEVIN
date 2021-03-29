using System.Numerics;

namespace SimulatorCore

{
    class ff_add : RTInstruction
    {
        int r0, r1, r2;

        internal ff_add(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].f + sRF[r2].f;
        }
    }



    class ff_sub : RTInstruction
    {
        int r0, r1, r2;

        internal ff_sub(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].f - sRF[r2].f;
        }
    }


    class ff_mul : RTInstruction
    {
        int r0, r1, r2;

        internal ff_mul(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].f * sRF[r2].f;
        }
    }



    class ff_div : RTInstruction
    {
        int r0, r1, r2;

        internal ff_div(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].f / sRF[r2].f;
        }
    }


}