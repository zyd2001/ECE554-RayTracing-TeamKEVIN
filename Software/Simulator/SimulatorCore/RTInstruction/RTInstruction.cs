namespace SimulatorCore
{
    abstract class RTInstruction
    {
        internal abstract void process(RegisterFile<Vector> vRF, RegisterFile<Scalar> sRF, Memory mem);
    }
}