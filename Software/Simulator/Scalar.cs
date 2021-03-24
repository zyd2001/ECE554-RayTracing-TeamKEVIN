using System.Runtime.InteropServices;

namespace Simulator
{
    [StructLayout(LayoutKind.Explicit)]
    struct Scalar
    {
        [FieldOffset(0)]public int i;
        [FieldOffset(0)]public float f;
    }
}