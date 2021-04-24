using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{

    class be : RTInstruction
    {
        int imm;

        internal be(int imm)
        {
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[32] == 0)
            {
                sRF[31] = sRF[31] + imm;
            }


        }

        public override string ToString()
        {
            return "bne " + imm;
        }
    }
    class bne : RTInstruction
    {
        int imm;

        internal bne(int imm)
        {
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[32] != 0)
            {
                sRF[31] = sRF[31] + imm;
            }


        }

        public override string ToString()
        {
            return "bne " + imm;
        }
    }

    class bg : RTInstruction
    {
        int imm;

        internal bg(int imm)
        {
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[32] == 2)
            {
                sRF[31] = sRF[31] + imm;
            }


        }

        public override string ToString()
        {
            return "bg " + imm;
        }
    }

    class bl : RTInstruction
    {
        int imm;

        internal bl(int imm)
        {
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[32] == 1)
            {
                sRF[31] = sRF[31] + imm;
            }


        }

        public override string ToString()
        {
            return "bl " + imm;
        }
    }

    class bge : RTInstruction
    {
        int imm;

        internal bge(int imm)
        {
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[32] == 2 || sRF[32] == 0)
            {
                sRF[31] = sRF[31] + imm;
            }


        }

        public override string ToString()
        {
            return "bge_rt " + imm;
        }
    }

    class ble : RTInstruction
    {
        int imm;

        internal ble(int imm)
        {
            this.imm = imm;
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[32] == 1 || sRF[32] == 0)
            {
                sRF[31] = sRF[31] + imm;
            }


        }

        public override string ToString()
        {
            return "ble_rt " + imm;
        }
    }


}