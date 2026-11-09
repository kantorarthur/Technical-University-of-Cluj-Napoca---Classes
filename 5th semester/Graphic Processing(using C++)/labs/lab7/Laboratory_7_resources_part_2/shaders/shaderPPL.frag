//fragment shader for per-pixel lighting (Phong) with material properties
//and separate light component intensities
#version 410 core

in vec3 fNormal;
in vec4 fPosEye;

out vec4 fColor;

//light source described by its three components (replace lightColor and the hard-coded strengths)
uniform vec3 lightDir;
uniform vec3 lightAmbient;
uniform vec3 lightDiffuse;
uniform vec3 lightSpecular;

//material properties
uniform vec3 matAmbient;
uniform vec3 matDiffuse;
uniform vec3 matSpecular;
uniform float shininess;

vec3 ambient;
vec3 diffuse;
vec3 specular;

void main()
{
	//normalize the light's direction
	vec3 lightDirN = normalize(lightDir);

	//renormalize the interpolated normal (interpolation changes its length)
	vec3 normalEye = normalize(fNormal);

	//compute the view (Eye) direction (in eye coordinates, the camera is at the origin)
	vec3 viewDir = normalize(-fPosEye.xyz);

	//compute the light's reflection
	vec3 reflectDir = normalize(reflect(-lightDirN, normalEye));

	//compute ambient light
	ambient = lightAmbient * matAmbient;

	//compute diffuse light
	float diffCoeff = max(dot(normalEye, lightDirN), 0.0f);
	diffuse = lightDiffuse * matDiffuse * diffCoeff;

	//compute specular light
	float specCoeff = pow(max(dot(viewDir, reflectDir), 0.0f), shininess);
	specular = lightSpecular * matSpecular * specCoeff;

	//compute final fragment color
	vec3 color = min(ambient + diffuse + specular, 1.0f);

	fColor = vec4(color, 1.0f);
}
