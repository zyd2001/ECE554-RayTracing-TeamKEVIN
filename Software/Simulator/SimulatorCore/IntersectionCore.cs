using System;
using System.Collections.Generic;
using System.Numerics;
using System.IO;

namespace SimulatorCore
{

    class Triangle
    {
        internal Vector3 v0;
        internal Vector3 v1;
        internal Vector3 v2;
        internal int id;
    }
    class IntersectionCore
    {
        Memory Memory { get; }
        List<Triangle> triangles = new List<Triangle>();
        const float Epsilon = 1e-8F;

        internal IntersectionCore(Memory mem)
        {
            Memory = mem;
        }

        internal IntersectionCore(TextReader t)
        {
            for (int k = 0; k < 34; k++)
            {
                Triangle tri = new Triangle();
                if (k == 31 || k == 26)
                    tri.id = 2;
                else if (k == 29 || k == 24)
                    tri.id = 3;
                else
                    tri.id = 1;
                string str = t.ReadLine();
                var s = str.Split();
                tri.v0.X = float.Parse(s[0]);
                tri.v0.Y = float.Parse(s[1]);
                tri.v0.Z = float.Parse(s[2]);
                str = t.ReadLine();
                s = str.Split();
                tri.v1.X = float.Parse(s[0]);
                tri.v1.Y = float.Parse(s[1]);
                tri.v1.Z = float.Parse(s[2]);
                str = t.ReadLine();
                s = str.Split();
                tri.v2.X = float.Parse(s[0]);
                tri.v2.Y = float.Parse(s[1]);
                tri.v2.Z = float.Parse(s[2]);
                triangles.Add(tri);
            }
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
            // Console.WriteLine(origin);
            // Console.WriteLine(direction);
            for (int i = 0; i < triangles.Count; i++)
            {
                // Vector3 v0 = VectorHelper(ref i);
                // Vector3 v1 = VectorHelper(ref i);
                // Vector3 v2 = VectorHelper(ref i);
                // int id = BitConverter.ToInt32(Memory.Read(i));

                Vector3 v0 = triangles[i].v0;
                Vector3 v1 = triangles[i].v1;
                Vector3 v2 = triangles[i].v2;
                int id = triangles[i].id;
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
                    resultPoint = new Vector4(orig + t * dir, BitConverter.Int32BitsToSingle(id));
                    resultNormal = new Vector4(Vector3.Normalize(Vector3.Cross(v0v1, v0v2)), 0);
                }
            }
            return (resultPoint, resultNormal);
        }
    }
}