#version 450

layout(location = 0) in vec2 position;
layout(location = 1) in vec3 color;

// layout(location = 0) out vec3 fragColor;

layout(push_constant) uniform Push{
    mat2 transform;
    vec2 offset;
    vec3 color;
} push;

// Esta função main será executada para cada vertex shader
void main(){
    gl_Position = vec4(push.transform * position + push.offset, 0.0, 1.0); // O 0.0 é o Z
    // fragColor = push.color;
}