using System;
using System.Runtime.InteropServices;

namespace SimulatorCore
{
    /// <summary>
    /// This value type can represent both float and integer
    /// for use in scalar register file
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Scalar
    {
        [FieldOffset(0)]
        public int i;
        [FieldOffset(0)]
        public float f;

        public static implicit operator Scalar(int i) => new Scalar(i);
        public static implicit operator Scalar(float f) => new Scalar(f);
        public static implicit operator int(Scalar s) => s.i;
        public static implicit operator float(Scalar s) => s.f;

        public Scalar(int i) : this()
        {
            this.i = i;
        }

        public Scalar(float f) : this()
        {
            this.f = f;
        }

        public string Hex()
        {
            var arr = BitConverter.GetBytes(i);
            Array.Reverse(arr);
            return Convert.ToHexString(arr);
        }
    }
}