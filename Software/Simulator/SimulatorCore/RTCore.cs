using System.Numerics;

namespace SimulatorCore
{
    public class RTCore
    {
        IntersectionCore IC;
        public Memory memory;
        public RegisterFile<Scalar> scalarRegisterFile;
        public RegisterFile<Vector4> vectorRegisterFile;

        public RTCore(Memory mem, Memory triangleMem)
        {
            scalarRegisterFile = new RegisterFile<Scalar>(32);
            vectorRegisterFile = new RegisterFile<Vector4>(16);
            memory = mem;
            IC = new IntersectionCore(triangleMem);
        }

        public void step()
        {

        }

        public void runUntil(int address)
        {

        }

        public void run()
        {

        }
    }
}