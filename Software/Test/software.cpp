#include "software.hpp"
#include <fstream>

const int width = 1920;
const int height = 1080;
const float epsilon = 0.001;
// Assume Horizontal Fov is 90 degree, so tan(90/2) = 1
const float fov = 1;
const vector camera_location (0, 0, 1, 0 );
const vector camera_lookat_pos (0, 0, -1, 0 );
const vector camera_up (0, 1, 0, 1 );
const vector sky_horizon_color (0.76, 0.765, 0.827, 1 );
const vector sky_top_color (0.53, 0.808, 0.92, 1 );

const vector light_start_address[] = {vector(100,100,100,10000), vector(1,1,1,1)};


void print(vector v)
{
    printf("%f %f %f\n", v.x, v.y, v.z);
}
// const int material_start_address = 1073742336;

// Lights data starts at 0x40000100
// Lighting data mapping, assuming all lights are point light:
// Each light takes two vectors, at most 8 lights
// 0x40000100 Light1, 0x40000120 Light2
// 0x40000100: Light1 Vector1 - position + range
// 0x40000110: Light1 Vector2 - Light color
// 0x40000120: Light2 ...

// for example
// 0x40000100 = [ 100, 100, 100, 10000 ];
// 0x40000110 = [ 1, 1, 1, 1 ];

// Material data starts at 0x40000200
// Each material takes one vector and two scalar.
// 0x40000200: Material1 Vector1 - subsurface albedo (aka base color)
// 0x40000210: Material1 Scalar1 Roughness
// 0x40000214: Material1 Scalar1 Metallic
// 0x40000218: Material2 ...
// [0, 0, 1, 1]
// 0
// 1


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

vector miss_shader(vector origin, vector dir, vector hit, vector normal)
{
    float mix = max(0, dir[1]);
    return sky_top_color * mix + sky_horizon_color * (1 - mix);
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

vector hit_shader(vector origin, vector dir, vector hit, vector normal, int material_number)
{
    vector hit_color(0, 0, 0, 0);
    vector ambient_light(0.8, 0.8, 0.8, 1);
    const vector *light_position;
    light_position = light_start_address;
    vector light_origin = light_position[0];
    vector one(1, 1, 1, 1);

    // vector *material;
    // material = material_start_address + (material_number - 1) * 24;
    vector subsurface_albedo(0,1,1,1);
    float roughness = 1;
    float metallic = 0;

    // while (light_origin[3] > 0 && light_position < light_start_address + 2)
    // {
    //     vector light_color = light_position[1];
    //     // print(light_color);
    //     light_position = light_position + 2;

    //     float light_range = light_origin[3];
    //     light_origin[3] = 0;

    //     vector light_ray = light_origin - hit;
    //     float light_distance = sqrt(reduce(light_ray * light_ray));
    //     vector light_center = light_origin;
    //     light_origin = light_position[0];

    //     light_ray = normalize(light_ray);
    //     float NdL = dot(normal, light_ray);
    //     // print(light_ray);
    //     // print(light_center);

    //     // if the light shine on the surface
    //     if (NdL < 0)
    //         continue;

    //     vector shadow_hit, shadow_normal;
    //     // make sure we can see the light
    //     std::tie(shadow_hit, shadow_normal) = trace(hit + normal * 0.1, light_ray);

    //     // print(shadow_hit);
    //     // print(shadow_normal);
    //     float hit_error = distance(shadow_hit, origin) + distance(shadow_hit, light_center);

    //     // If there is no hit, then we dont care
    //     if (asInt(shadow_hit[3]) != 0 && (hit_error - light_distance > epsilon || hit_error - light_distance < -epsilon))
    //         continue;
    //     float point_light_falloff = (light_range * light_range / (light_distance * light_distance + light_range * light_range));
    //     light_color = light_color * point_light_falloff;

    //     vector halfway = normalize(light_ray - dir);
    //     float NdV = dot(normal, -dir);
    //     float NdH = dot(normal, halfway);
    //     float VdH = dot(-dir, halfway);

    //     vector default_dielectrics_F0(0.04, 0.04, 0.04, 1);
    //     vector F = subsurface_albedo * metallic + default_dielectrics_F0 * (1 - metallic);
    //     subsurface_albedo = subsurface_albedo * (1 - metallic);

    //     hit_color = hit_color + (one - F) * subsurface_albedo * light_color;
    //     float D = NormalDist(NdH, roughness);       // 1/pi omitted
    //     float G = HammonSmith(NdV, NdL, roughness); // 4  * NdV * NdL omitted
    //     vector f_ct = F * D * G;
    //     hit_color = hit_color + f_ct * light_color;
    // }

    float NdV = dot(normal, -dir);
    // print(normal);

    return hit_color + ambient_light * subsurface_albedo * NdV;
    // return hit_color;
}

vector run(int id, bool stackBase)
{
    int screen_y = id / width;
    int screen_x = id % width;

    float aspect_ratio_inverse = float(height) / float(width);

    float camera_y = (1 - ((float(screen_y) + 0.5) / float(height)) * 2) * aspect_ratio_inverse;
    float camera_x = 2 * ((float(screen_x) + 0.5) / float(width)) - 1;

    camera_y = camera_y * fov;
    camera_x = camera_x * fov;

    vector forward = normalize(camera_location - camera_lookat_pos);
    vector right = cross(camera_up, forward);
    vector up = cross(forward, right);
    if (stackBase)
    {
        print(forward);
        print(right);
        print(up);
    }

    vector camera_dir = -forward + right * camera_x + up * camera_y;
    camera_dir[3] = 0;
    camera_dir = normalize(camera_dir);
    // vector orig (camera_x, camera_y, -1, 0 );

    if (stackBase)
    {
        printf("orig: %f %f %f\n", camera_location.x, camera_location.y, camera_location.z);
        printf("dir: %f %f %f\n", camera_dir.x, camera_dir.y, camera_dir.z);
    }

    vector hit, normal;
    std::tie(hit, normal) = trace(camera_location, camera_dir);

    // float imageAspectRatio = width / (float)height;
    // float x = (2 * (screen_x + 0.5) / (float)width - 1) * imageAspectRatio;
    // float y = (1 - 2 * (screen_y + 0.5) / (float)height);
    // vector dir(x, y, -1, 0);
    // dir = normalize(dir);
    // vector hit, normal;
    // std::tie(hit, normal) = trace(vector(0,0,6,0), dir);

    if (asInt(hit[3]) == 0)
        return miss_shader(camera_location, camera_dir, hit, normal);
    else
        return hit_shader(camera_location, camera_dir, hit, normal, asInt(hit[3]));
    // if (asInt(hit[3]) == 0)
    //     return miss_shader(camera_location, vector(x, y, -1, 0), hit, normal);
    // else
    //     return hit_shader(camera_location, vector(x, y, -1, 0), hit, normal, asInt(hit[3]));
    // if (asInt(hit[3]) == 0)
    //     return vector(1,1,1,0);
    // else
    //     return vector(0,1,1,0);
}

int main()
{
    std::ifstream ifs("model.obj.out"); // model 8, triangle 12, cylinder 320
    std::ofstream ofs("./out.ppm", std::ios::out);
    ofs << "P3\n" << width << " " << height << "\n255\n";
    float t1, t2, t3;
    for (int i = 0; i < 8; i++)
    {   
        Triangle tri;
        ifs >> t1 >> t2 >> t3;
        tri.p1 = Vec3f(t1, t2, t3);
        ifs >> t1 >> t2 >> t3;
        tri.p2 = Vec3f(t1, t2, t3);
        ifs >> t1 >> t2 >> t3;
        tri.p3 = Vec3f(t1, t2, t3);
        // ifs >> tri.id;
        tri.id = 1;
        triangles.push_back(tri);
    }
    for (int i = 0; i < width * height; i++)
    {
        auto color = run(i, i == width * height / 2);
        ofs << color.x * 255 << " " << color.y * 255 << " " << color.z * 255 << "\n";
    }
    ofs.close();
}