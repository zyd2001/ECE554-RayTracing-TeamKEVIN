using System.Numerics;


namespace SimulatorCore
{
    class vf_add : RTInstruction
    {
        int r0, r1, r2;

        internal vf_add(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 addv = new Vector4(sRF[r2].f, sRF[r2].f, sRF[r2].f, sRF[r2].f);
            vRF[r0] = Vector4.Add(vRF[r1], addv);

        }
    }

    class vf_sub : RTInstruction
    {
        int r0, r1, r2;

        internal vf_sub(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 addv = new Vector4(sRF[r2].f, sRF[r2].f, sRF[r2].f, sRF[r2].f);
            vRF[r0] = Vector4.Subtract(vRF[r1], addv);

        }
    }

    class vf_mul : RTInstruction
    {
        int r0, r1, r2;

        internal vf_mul(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 addv = new Vector4(sRF[r2].f, sRF[r2].f, sRF[r2].f, sRF[r2].f);
            vRF[r0] = Vector4.Multiply(vRF[r1], addv);

        }
    }

    class vf_div : RTInstruction
    {
        int r0, r1, r2;

        internal vf_div(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 addv = new Vector4(sRF[r2].f, sRF[r2].f, sRF[r2].f, sRF[r2].f);
            vRF[r0] = Vector4.Divide(vRF[r1], addv);

        }
    }


}