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
        internal (Vector4 point, Vector4 normal) Process(Vector4 origin, Vector4 direction)
        {
            Vector3 orig = new Vector3(origin.X, origin.Y, origin.Z);
            Vector3 dir = new Vector3(direction.X, direction.Y, direction.Z);
            Vector4 resultPoint = new Vector4(0, 0, 0, 0), resultNormal = new Vector4();
            float minDistance = float.MaxValue;
            int id = 1;
            for (int i = 0; i < Memory.Mem.Length; id++)
            {
                Vector3 v0 = VectorHelper(ref i);
                Vector3 v1 = VectorHelper(ref i);
                Vector3 v2 = VectorHelper(ref i);
                i += 4;
                Vector3 v0v1 = v1 - v0;
                Vector3 v0v2 = v2 - v0;
                Vector3 pvec = Vector3.Cross(dir, v0v2);
                float det = Vector3.Dot(v0v1, pvec);

                if (det < Epsilon)
                    continue;

                float invDet = 1 / det;

                Vector3 tvec = orig - v0;
                float t, u, v;
                u = Vector3.Dot(tvec, pvec) * invDet;
                if (u < 0 || u > 1)
                    continue;

                Vector3 qvec = Vector3.Cross(tvec, v0v1);
                v = Vector3.Dot(dir, qvec) * invDet;
                if (v < 0 || u + v > 1)
                    continue;

                t = Vector3.Dot(v0v2, qvec) * invDet;

                if (t < minDistance)
                {
                    minDistance = t;
                    resultPoint = new Vector4(orig + t * dir, 0);
                    resultNormal = new Vector4(Vector3.Cross(v0v1, v0v2), BitConverter.Int32BitsToSingle(id));
                }
            }
            return (resultPoint, resultNormal);
        }
    }
}