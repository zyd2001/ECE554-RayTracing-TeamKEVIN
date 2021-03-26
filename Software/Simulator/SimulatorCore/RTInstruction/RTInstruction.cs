using System.Numerics;

namespace SimulatorCore
{
    abstract class RTInstruction : IInstruction
    {
        internal abstract void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore IC);
    }
}