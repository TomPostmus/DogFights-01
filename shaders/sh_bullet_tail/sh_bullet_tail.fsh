//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 baseColour;
uniform float alphaDecline;
uniform float horizontalCap;
const vec4 replaceColour = vec4(1.0, 0, 1.0, 1.0);

void main()
{	
	float positionX = v_vTexcoord.x * 128.0;
	if (positionX <= horizontalCap) {
		gl_FragColor = v_vColour * (baseColour - vec4(0.0, 0.0, 0.0, positionX * alphaDecline));
	} else {
		gl_FragColor = v_vColour * vec4(0.0, 0.0, 0.0, 0.0);
	}
}
