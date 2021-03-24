namespace Simulator
{
    interface IRTInstruction
    {
        void process(RegisterFile<Vector> vRF, RegisterFile<Scalar> sRF, Memory mem);
    }
}