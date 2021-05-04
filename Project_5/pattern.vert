#version 330 compatibility

uniform float	uTime;		// "Time", from Animate( )
uniform float	uA, uB, uC;
uniform float  uS0, uT0, uSize;
out vec2  	vST;		// texture coords
out  vec3  vN;		// normal vector
out  vec3  vL;		// vector from point to light
out  vec3  vE;		// vector from point to eye

const float M_PI = 	3.14159265;
const float AMP = 	0.2;		// amplitude
const float W = 	2.;		// frequency

vec3 LightPosition = vec3(  0., 5., 5. );

void
main( )
{ 
	vST = gl_MultiTexCoord0.st;
	vec3 vert = gl_Vertex.xyz;
	vec4 ECposition = gl_ModelViewMatrix * vec4( vert, 1. );
	vN = normalize( gl_NormalMatrix * gl_Normal );	// normal vector
	vL = LightPosition - ECposition.xyz;			// vector from the point
													// to the light position
	vE = vec3( 0., 0., 0. ) - ECposition.xyz;		// vector from the point
													// to the eye position 
	

	vert.x = vert.x * uA;
	vert.y = vert.y * uB;
	vert.z = vert.z * uC;

	if(vert.x < 0.5){
				vert.x = vert.x / uA;
				vert.y = vert.y / uB;
				vert.z = vert.z / uC;
			}

	if(0.5 < vert.z){
				vert.x = vert.x * uA * uA;
				vert.y = vert.y * uB * uB;
				vert.z = vert.z * uC * uC;
			}

	
	
	gl_Position = gl_ModelViewProjectionMatrix * vec4( vert, 1. );
}
