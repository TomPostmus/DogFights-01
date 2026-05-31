//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float texel_width;
uniform float texel_height;

void main()
{
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + vec2(texel_width, 0.0)).a); // add alpha values of north, east, south, west pixels to alpha val of current pixel
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - vec2(texel_width, 0.0)).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, texel_height)).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - vec2(0.0, texel_height)).a);
	
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offset_x).a); // add alpha values of north, east, south, west pixels to alpha val of current pixel
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offset_x).a);
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offset_y).a);
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offset_y).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	gl_FragColor.a = alpha;
}
