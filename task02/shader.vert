#version 120

// see the GLSL 1.2 specification:
// https://www.khronos.org/registry/OpenGL/specs/gl/GLSLangSpec.1.20.pdf

#define PI 3.1415926538

varying vec3 normal;  // normal vector pass to the rasterizer
uniform float cam_z_pos;  // camera z position specified by main.cpp

void main()
{
    normal = vec3(gl_Normal); // set normal

    gl_Position = gl_Vertex; // following code do nothing (input == output)

    float x0 = gl_Vertex.x; // x-coord
    float y0 = gl_Vertex.y; // y-coord
    float z0 = gl_Vertex.z; // z-coord

    vec3 cam_pos = vec3(0.0,0.0,cam_z_pos);
    vec3 pos = vec3(x0,y0,z0);
    vec3 A = pos-cam_pos;
    vec3 CA = cam_pos-A;
    vec3 D = cam_pos-0.5*CA;

    pos = length(A)*D / length(D);

    gl_Position = vec4(pos,1); // homogenious coordinate
}
