//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 base_colour = texture2D( gm_BaseTexture, v_vTexcoord );
	float avg = (base_colour.r + base_colour.g + base_colour.b)/3.0;
    gl_FragColor = v_vColour * vec4(avg, avg, avg, base_colour.a);
}
