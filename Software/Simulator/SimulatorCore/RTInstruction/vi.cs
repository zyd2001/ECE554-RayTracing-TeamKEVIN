using System.Numerics;

// NOT USED ANYMORE!
namespace SimulatorCore
{
    class vi_add : RTInstruction
    {
        int r0, r1, r2;

        internal vi_add(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 vec = new Vector4(sRF[r2].i, sRF[r2].i, sRF[r2].i, sRF[r2].i);
            vRF[r0] = Vector4.Add(vRF[r1], vec);

        }

        public override string ToString()
        {
            return "vi_add r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class vi_sub : RTInstruction
    {
        int r0, r1, r2;

        internal vi_sub(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 vec = new Vector4(sRF[r2].i, sRF[r2].i, sRF[r2].i, sRF[r2].i);
            vRF[r0] = Vector4.Subtract(vRF[r1], vec);

        }

        public override string ToString()
        {
            return "vi_sub r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class vi_mul : RTInstruction
    {
        int r0, r1, r2;

        internal vi_mul(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 vec = new Vector4(sRF[r2].i, sRF[r2].i, sRF[r2].i, sRF[r2].i);
            vRF[r0] = Vector4.Multiply(vRF[r1], vec);

        }

        public override string ToString()
        {
            return "vi_mul r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class vi_div : RTInstruction
    {
        int r0, r1, r2;

        internal vi_div(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            Vector4 vec = new Vector4(sRF[r2].i, sRF[r2].i, sRF[r2].i, sRF[r2].i);
            vRF[r0] = Vector4.Divide(vRF[r1], vec);

        }

        public override string ToString()
        {
            return "vi_div r" + r0 + " r" + r1 + " r" + r2;
        }
    }


}