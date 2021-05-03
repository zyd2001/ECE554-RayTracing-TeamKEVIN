using System;
using System.Numerics;

namespace SimulatorCore
{
    class IntersectionCore
    {
        Memory Memory { get; }
        const float Epsilon = 1e-8F;

        internal IntersectionCore(Memory mem)
        {
            Memory = mem;
        }

        Vector3 VectorHelper(ref int address)
        {
            float f0 = BitConverter.ToSingle(Memory.Read(address));
            address += 4;
            float f1 = BitConverter.ToSingle(Memory.Read(address));
            address += 4;
            float f2 = BitConverter.ToSingle(Memory.Read(address));
            address += 4;
            return new Vector3(f0, f1, f2);
        }

        bool ray(Vector3 orig, Vector3 dir, Vector3 v0, Vector3 v1, Vector3 v2, ref float t, ref Vector3 normal, ref Vector3 hit)
        {
            Vector3 v0v1 = v1 - v0;
            Vector3 v0v2 = v2 - v0;
            Vector3 pvec = Vector3.Cross(dir, v0v2);
            float det = Vector3.Dot(v0v1, pvec);

            if (Math.Abs(det) < Epsilon)
                return false;

            float invDet = 1 / det;

            Vector3 tvec = orig - v0;
            float u, v;
            u = Vector3.Dot(tvec, pvec) * invDet;
            if (u < 0 || u > 1)
                return false;

            Vector3 qvec = Vector3.Cross(tvec, v0v1);
            v = Vector3.Dot(dir, qvec) * invDet;
            if (v < 0 || u + v > 1)
                return false;

            t = Vector3.Dot(v0v2, qvec) * invDet;

            return true;
        }

        internal (Vector4 point, Vector4 normal) Process(Vector4 origin, Vector4 direction)
        {
            Vector3 orig = new Vector3(origin.X, origin.Y, origin.Z);
            Vector3 dir = new Vector3(direction.X, direction.Y, direction.Z);
            Vector4 resultPoint = new Vector4(0, 0, 0, 0), resultNormal = new Vector4();
            float minDistance = float.MaxValue;
            // int id = 0;
            for (int i = 0; i < Memory.Mem.Length;)
            {
                Vector3 v0 = VectorHelper(ref i);
                Vector3 v1 = VectorHelper(ref i);
                Vector3 v2 = VectorHelper(ref i);
                int id = BitConverter.ToInt32(Memory.Read(i));
                Vector3 normal = new Vector3(), hit = new Vector3();
                i += 4;
                float t = float.MaxValue;
                if (ray(orig, dir, v0, v1, v2, ref t, ref normal, ref hit))
                    if (t < minDistance)
                    {
                        minDistance = t;
                        resultPoint = new Vector4(orig + t * dir, BitConverter.Int32BitsToSingle(id));
                        resultNormal = new Vector4(normal, 0);
                    }
            }
            return (resultPoint, resultNormal);
        }
    }
}