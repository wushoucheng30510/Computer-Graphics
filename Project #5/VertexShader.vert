#version 330 compatibility

//lighting
out vec2 vST; // texture coords
out vec3 vN; // normal vector
out vec3 vL; // vector from point to light
out vec3 vE; // vector from point to eye

vec3 LightPosition = vec3( 5., 5., 0. );

void main( )
{
	//lighting
	vST = gl_MultiTexCoord0.st;
	vec4 ECposition = gl_ModelViewMatrix * gl_Vertex;
	vN = normalize( gl_NormalMatrix * gl_Normal ); // normal vector
	vL = LightPosition - ECposition.xyz; // vector from the point to the light position
	vE = vec3( 0., 0., 0. ) - ECposition.xyz; // vector from the point to the eye position 

	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}