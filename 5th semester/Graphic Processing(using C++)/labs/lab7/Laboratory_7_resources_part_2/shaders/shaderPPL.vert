//vertex shader for per-pixel lighting (Phong)
#version 410 core

layout(location=0) in vec3 vPosition;
layout(location=1) in vec3 vNormal;

//matrices
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform mat3 normalMatrix;

//sent to the fragment shader (interpolated per pixel)
out vec3 fNormal;
out vec4 fPosEye;

void main()
{
	//vertex position in eye coordinates
	fPosEye = view * model * vec4(vPosition, 1.0f);

	//normal in eye coordinates
	fNormal = normalize(normalMatrix * vNormal);

	//transform vertex
	gl_Position = projection * view * model * vec4(vPosition, 1.0f);
}
