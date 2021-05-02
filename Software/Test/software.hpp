#include <tuple>
#include <cmath>
#include <vector>
#include "geometry.h"

class vector
{
public:
    float x;
    float y;
    float z;
    float w;

    vector() : x(0), y(0), z(0), w(0) {}
    vector(const vector &v) : x(v.x), y(v.y), z(v.z), w(v.w) {}
    vector(float x, float y, float z, float w) : x(x), y(y), z(z), w(w) {}
    vector(const Vec3f &v): x(v.x), y(v.y), z(v.z), w(0) {}
    vector operator+(const vector &v) const
    {
        return vector(x + v.x, y + v.y, z + v.z, w + v.w);
    }
    vector operator+(const float &r) const
    {
        return vector(x + r, y + r, z + r, w + r);
    }
    vector operator-(const vector &v) const
    {
        return vector(x - v.x, y - v.y, z - v.z, w - v.w);
    }
    vector operator-(const float &r) const
    {
        return vector(x - r, y - r, z - r, w - r);
    }
    vector operator-() const
    {
        return vector(-x, -y, -z, -w);
    }
    vector operator*(const float &r) const
    {
        return vector(x * r, y * r, z * r, w * r);
    }
    vector operator*(const vector &v) const
    {
        return vector(x * v.x, y * v.y, z * v.z, w * v.w);
    }
    vector operator/(const float &r) const
    {
        return vector(x / r, y / r, z / r, w / r);
    }
    vector operator/(const vector &v) const
    {
        return vector(x / v.x, y / v.y, z / v.z, w / v.w);
    }
    float& operator[](int i)
    {
        switch (i)
        {
            case 0: return x;
            case 1: return y;
            case 2: return z;
            case 3: return w;
        }
        return x;
    }
};

float reduce(vector v)
{
    return v.x + v.y + v.z + v.w;
}

int asInt(float f)
{
    return *reinterpret_cast<int*>(&f);
}

float asFloat(int i)
{
    return *reinterpret_cast<float*>(&i);
}

bool rayTriangleIntersect(
    const Vec3f &orig, const Vec3f &dir,
    const Vec3f &v0, const Vec3f &v1, const Vec3f &v2,
    float &t, float &u, float &v, Vec3f &normal, Vec3f &hit);

struct Triangle
{
    Vec3f p1;
    Vec3f p2;
    Vec3f p3;
    int id;
};

std::vector<Triangle> triangles;

std::tuple<vector, vector> trace(vector orig, vector dir)
{
    float min = MAXFLOAT;
    vector hit(0,0,0,0), normal;
    Vec3f n, h;
    int id = 0;
    float t;
    for (int i = 0; i < triangles.size(); i++)
    {
        Vec3f v0 = triangles[i].p1;
        Vec3f v1 = triangles[i].p2;
        Vec3f v2 = triangles[i].p3;
        float u, v;
        Vec3f o(orig.x, orig.y, orig.z);
        Vec3f d(dir.x, dir.y, dir.z);
        if (rayTriangleIntersect(o, d, v0, v1, v2, t, u, v, n, h))
        {
            if (t < min)
            {
                min = t;
                normal = vector(n.normalize());
                hit = vector(h);
                id = triangles[i].id;
            }
        }
    }
    hit.w = asFloat(id);
    return {hit, normal};
}