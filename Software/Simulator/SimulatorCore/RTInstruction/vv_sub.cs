using System.Numerics;


namespace SimulatorCore
{
    class vv_sub : RTInstruction
    {
        int r0, r1, r2;

        internal vv_sub(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            vRF[r0] = Vector4.Subtract(vRF[r1], vRF[r2]);

        }

        public override string ToString()
        {
            return "vv_sub r" + r0 + " r" + r1 + " r" + r2;
        }
    }


}