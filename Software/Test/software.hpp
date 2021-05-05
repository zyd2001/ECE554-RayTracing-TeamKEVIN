#include <tuple>
#include <cmath>
#include <vector>
#include "geometry.h"
#include <fstream>


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

std::tuple<vector, vector> trace(vector orig, vector dir, int rayType)
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
            if (t < min && t >= 0)
            {
                min = t;
                normal = vector(n.normalize());
                hit = vector(h);
                id = triangles[i].id;
                // if (rayType == 1) 
                //     std::cout<< "Hit" << std::endl;
            }
        }
        
    }
    hit.w = asFloat(id);
    return {hit, normal};
}

void print(vector v)
{
    printf("%f %f %f %f\n", v.x, v.y, v.z, v.w);
}

float NormalDist(float NdH, float roughness)
{
    float rough_sqr = roughness * roughness;
    float den_2 = NdH * NdH * (rough_sqr - 1) + 1;
    float denominator = den_2 * den_2;
    return rough_sqr / denominator;
}

float HammonSmith(float NdV, float NdL, float roughness)
{
    if (NdL < 0)
        NdL = -NdL;
    if (NdV < 0)
        NdV = -NdV;

    float denominator = 2 * NdV * NdL * (1 - roughness) + roughness * (NdL + NdV);
    return 0.5 / denominator;
}

float distance(vector v1, vector v2)
{
    return sqrt(reduce((v1 - v2) * (v1 - v2)));
}

float max(float a, float b)
{
    if (a > b)
        return a;
    else
        return b;
    return a;
}

vector normalize(vector v)
{
    float norm = sqrt(reduce(v * v));
    return v / norm;
}

float dot(vector v1, vector v2)
{
    return reduce(v1 * v2);
}

// Only the first three index matters
vector cross(vector v1, vector v2)
{
    float v10 = v1[0], v11 = v1[1], v12 = v1[2];
    float v20 = v2[0], v21 = v2[1], v22 = v2[2];

    float x = v11 * v22 - v12 * v21;
    float y = v12 * v20 - v10 * v22;
    float z = v10 * v21 - v11 * v20;
    return vector(x, y, z, 0);
}
float clamp(float x, float min, float max) {
    if (x < min) 
        x = min;
    else if (x > max) 
        x = max;
    return x;
}

vector clamp(vector x, float min, float max) {
    if (x.x < min) 
        x.x = min;
    else if (x.x > max) 
        x.x = max;

    if (x.y < min) 
        x.y = min;
    else if (x.y > max) 
        x.y = max;

    if (x.z < min) 
        x.z = min;
    else if (x.z > max) 
        x.z = max;

    if (x.w < min) 
        x.w = min;
    else if (x.w > max) 
        x.w = max;
    
    return x;
}