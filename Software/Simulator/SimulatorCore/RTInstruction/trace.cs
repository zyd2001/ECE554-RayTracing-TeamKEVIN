using System.Numerics;

namespace SimulatorCore
{
    class trace : RTInstruction
    {
        internal trace()
        {
        }

        internal override void Process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            var result = ic.Process(vRF[14], vRF[15]);
            vRF[14] = result.point;
            vRF[15] = result.normal;
        }

        public override string ToString()
        {
            return "trace";
        }
    }


}