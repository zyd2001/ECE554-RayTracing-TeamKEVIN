using System.Numerics;

namespace SimulatorCore

{
    class ii_add : RTInstruction
    {
        int r0, r1, r2;

        internal ii_add(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i + sRF[r2].i;
        }

        public override string ToString()
        {
            return "ii_add r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class ii_addi : RTInstruction
    {
        int r0, r1, imm;

        internal ii_addi(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i + imm;
        }

        public override string ToString()
        {
            return "ii_addi r" + r0 + " r" + r1 + " " + imm;
        }
    }

    class ii_sub : RTInstruction
    {
        int r0, r1, r2;

        internal ii_sub(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i - sRF[r2].i;
        }

        public override string ToString()
        {
            return "ii_sub r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class ii_subi : RTInstruction
    {
        int r0, r1, imm;

        internal ii_subi(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i - imm;
        }

        public override string ToString()
        {
            return "ii_subi r" + r0 + " r" + r1 + " " + imm;
        }
    }
    class ii_mul : RTInstruction
    {
        int r0, r1, r2;

        internal ii_mul(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i * sRF[r2].i;
        }

        public override string ToString()
        {
            return "ii_mul r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class ii_muli : RTInstruction
    {
        int r0, r1, imm;

        internal ii_muli(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i * imm;
        }

        public override string ToString()
        {
            return "ii_muli r" + r0 + " r" + r1 + " " + imm;
        }
    }

    class ii_div : RTInstruction
    {
        int r0, r1, r2;

        internal ii_div(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i / sRF[r2].i;
        }

        public override string ToString()
        {
            return "ii_div r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class ii_divi : RTInstruction
    {
        int r0, r1, imm;

        internal ii_divi(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[r0] = sRF[r1].i / imm;
        }

        public override string ToString()
        {
            return "ii_divi r" + r0 + " r" + r1 + " " + imm;
        }
    }
}