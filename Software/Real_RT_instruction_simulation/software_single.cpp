#include "software.hpp"

const int width = 1280;
const int height = 720;
const float epsilon = 0.001;
// Assume Horizontal Fov is 90 degree, so tan(90/2) = 1
const float fov = 1;
const vector camera_location (0, 0, 6.5, 0 );
const vector camera_lookat_pos (0, 0, 0, 0 );
const vector camera_up (0, 1, 0, 1 );
const vector sky_horizon_color (0.76, 0.765, 0.827, 1 );
const vector sky_top_color (0.53, 0.808, 0.92, 1 );
const vector ambient_light(0.3, 0.3, 0.3, 1);
const vector light_start_address[] = {vector(5,0,5,6), vector(1,1,1,1)};


vector miss_shader(vector origin, vector dir, vector hit, vector normal)
{
    float mix = max(0, dir[1]);
    return sky_top_color * mix + sky_horizon_color * (1 - mix);
}

vector hit_shader(vector origin, vector dir, vector hit, vector normal, int material_number, bool fvthek)
{
    vector hit_color(0, 0, 0, 0);
    
    vector subsurface_albedo(0,1,1,1);
    float roughness = 1;
    float metallic = 0;

    vector light_origin = light_start_address[0];
    vector light_color = light_start_address[1];

    float light_range = light_origin[3];
    light_origin[3] = 0;

    vector light_ray = light_origin - hit;
    float light_distance = sqrt(reduce(light_ray * light_ray));

    light_ray = normalize(light_ray);
    float NdL = dot(normal, light_ray);
    
    // if the light shine on the surface, not the back of the surface
    NdL = clamp(NdL, 0, 1);
    if (NdL > 0) {
        // Check if there is any object occluding the light 
        vector shadow_hit, shadow_normal;
        std::tie(shadow_hit, shadow_normal) = trace(hit + normal * 0.0001, light_ray, 1);

        int shadow_hit_or_not = asInt(shadow_hit[3]); 
        shadow_hit[3] = 0;
        // if (fvthek) {
        //     std::cout << shadow_hit_or_not << std::endl;
        // }
        
        // If there is a object in the light path, check if it is behind the light. 
        if (shadow_hit_or_not != 0) {
            float hit_error = distance(shadow_hit, hit) + distance(shadow_hit, light_origin) - light_distance;

            if (hit_error > epsilon || hit_error  < -epsilon)
                shadow_hit_or_not = 0;
        }
        
        if (shadow_hit_or_not == 0) {
            float point_light_falloff = (light_range * light_range / (light_distance * light_distance + light_range * light_range));
            light_color = light_color * point_light_falloff * NdL;

            vector halfway = normalize(light_ray - dir);
            float NdV = dot(normal, -dir);
            float NdH = dot(normal, halfway);
            float VdH = dot(-dir, halfway);

            vector default_dielectrics_F0(0.04, 0.04, 0.04, 1);
            vector F = subsurface_albedo * metallic + default_dielectrics_F0 * (1 - metallic);
            vector this_subsurface_albedo = subsurface_albedo * (1 - metallic);
            
            hit_color = hit_color + (-F + 1) * this_subsurface_albedo * light_color;
            // if (fvthek) {
            //     std::cout<< "Diffuse" <<std::endl;
            //     print(hit_color);
            // }
            float D = NormalDist(NdH, roughness);       // 1/pi omitted
            float G = HammonSmith(NdV, NdL, roughness); // 4  * NdV * NdL omitted
            vector f_ct = F * D * G;
            
            hit_color = hit_color + f_ct * light_color;
            
            // if (fvthek) {
            //     std::cout<< "specualr" <<std::endl;
            //     print(hit_color);
            // }
        }
    }
    

    float NdV = dot(normal, -dir);
    NdV = clamp(NdV, 0.5, 1);

    // Adding ambient light
    hit_color = hit_color +  ambient_light * subsurface_albedo * NdV;

    // if (fvthek) {
    //     std::cout<< "final" <<std::endl;
    //     print(ambient_light * subsurface_albedo * NdV);
    //     print(hit_color);
    //     std::cout<< NdV <<std::endl;
    //     // std::cout<< G <<std::endl;
    // }
    hit_color = clamp(hit_color, 0, 1);
    return hit_color;

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
    // if (stackBase)
    // {
    //     print(forward);
    //     print(right);
    //     print(up);
    // }

    vector camera_dir = -forward + right * camera_x + up * camera_y;
    camera_dir[3] = 0;
    camera_dir = normalize(camera_dir);

    // if (stackBase)
    // {
    //     print(camera_location);
    //     print(camera_dir);
    // }

    vector hit, normal;
    std::tie(hit, normal) = trace(camera_location, camera_dir, 0);
    
    if (asInt(hit[3]) == 0)
        return miss_shader(camera_location, camera_dir, hit, normal);
    else
        return hit_shader(camera_location, camera_dir, hit, normal, asInt(hit[3]), stackBase);
}

int main()
{
    std::ifstream ifs("box.obj.converted"); // model 8, triangle 12, cylinder 320
    std::ofstream ofs("./out.ppm", std::ios::out);
    ofs << "P3\n" << width << " " << height << "\n255\n";
    float t1, t2, t3;
    for (int i = 0; i < 34; i++)
    {   
        Triangle tri;
        ifs >> t1 >> t2 >> t3;
        tri.p1 = Vec3f(t1, t2, t3);
        ifs >> t1 >> t2 >> t3;
        tri.p2 = Vec3f(t1, t2, t3);
        ifs >> t1 >> t2 >> t3;
        tri.p3 = Vec3f(t1, t2, t3);
        // ifs >> tri.id;
        tri.id = i+1;
        triangles.push_back(tri);
    }
    
    for (int i = 0; i < width * height; i++)
    {
        auto color = run(i, i == 153960);
        ofs << color.x * 255 << " " << color.y * 255 << " " << color.z * 255 << "\n";
    }
    ofs.close();
}