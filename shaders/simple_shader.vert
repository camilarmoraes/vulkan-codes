#version 450

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 color;

// layout(location = 0) out vec3 fragColor;

layout(location = 0) out vec3 fragColor;

layout(push_constant) uniform Push{
    mat4 transform;
    vec3 color;
} push;

// Esta função main será executada para cada vertex shader
void main(){
    //gl_Position = vec4(push.transform * position + push.offset, 0.0, 1.0); // O 0.0 é o Z
    
    gl_Position = push.transform * vec4(position, 1.0);
    fragColor = color;
}