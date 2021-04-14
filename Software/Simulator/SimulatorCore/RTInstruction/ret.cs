using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class ret : RTInstruction
    {


        internal ret()
        {


        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[31] = sRF[30];


        }

        public override string ToString()
        {
            return "ret";
        }
    }


}