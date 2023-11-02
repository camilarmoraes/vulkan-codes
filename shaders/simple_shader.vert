#version 450

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 color;
layout(location = 2) in vec3 normal;
layout(location = 3) in vec2 uv;

// layout(location = 0) out vec3 fragColor;

layout(location = 0) out vec3 fragColor;

layout(push_constant) uniform Push{
    mat4 transform; //projecao * view * model
    //mat4 modelMatrix; // 2 matrizes 4x4 == 128 bytes
    mat4 normalMatrix;
} push;

const vec3 DIRECTION_TO_LIGHT = normalize(vec3(1.0,-3.0,-1.0));
const float AMBIENT = 0.02;

// Esta função main será executada para cada vertex shader
void main(){
    //gl_Position = vec4(push.transform * position + push.offset, 0.0, 1.0); // O 0.0 é o Z
    
    gl_Position = push.transform * vec4(position, 1.0);

    // só funciona de maneira correta se a escala for uniforme (sx == sy == sz)
    //vec3 normalWorldSpace = normalize(mat3(push.modelMatrix) * normal); //direcoes, não possições

    /*
    // calcular o inverso em uma sombra pode ser pesado e tem que ser evitado
    mat3 normalMatrix = transpose(inverse(mat3(push.modelMatrix)));
    vec3 normalWorldSpace = normalize(normalMatrix * normal); //transformacoes normais
    */
    vec3 normalWorldSpace = normalize(mat3(push.normalMatrix) * normal);
    float lightIntensity = AMBIENT + max(dot(normalWorldSpace, DIRECTION_TO_LIGHT),0);

    fragColor = lightIntensity * color;
}