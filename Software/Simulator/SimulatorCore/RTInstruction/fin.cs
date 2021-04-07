using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class fin : RTInstruction
    {
        internal fin()
        {

        }
        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
        }

        public override string ToString()
        {
            return "fin";
        }
    }


}