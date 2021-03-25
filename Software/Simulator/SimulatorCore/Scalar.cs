using System.Runtime.InteropServices;

namespace SimulatorCore
{
    [StructLayout(LayoutKind.Explicit)]
    public struct Scalar
    {
        [FieldOffset(0)]
        public int i;
        [FieldOffset(0)]
        public float f;

        public Scalar(int i) : this()
        {
            this.i = i;
        }

        public Scalar(float f) : this()
        {
            this.f = f;
        }
    }
}