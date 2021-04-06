using System.Numerics;

namespace SimulatorCore
{
    class IntersectionCore
    {
        Memory Memory { get; }

        internal IntersectionCore(Memory mem)
        {
            Memory = mem;
        }

        internal void process(Vector4 origin, Vector4 direction)
        {
            for (int i = 0; i < Memory.Mem.Length; i++)
            {

            }
        }
    }
}