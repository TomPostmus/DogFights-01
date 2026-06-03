//
// This shader draws ONLY the outline of a given texture
// So the pixels on the outside of the texture are drawn in outline_colour
// The normal (filled) pixels of the texture are ignored (and empty pixels are drawn)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float texel_width;
uniform float texel_height;
uniform vec3 outline_colour;

void main()
{
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	if (alpha == 0.0) { // for empty pixel in original texture
	
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + vec2(texel_width, 0.0)).a); // add alpha values of north, east, south, west pixels to alpha val of current pixel
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - vec2(texel_width, 0.0)).a);
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, texel_height)).a);
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - vec2(0.0, texel_height)).a);
	
		//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offset_x).a); // add alpha values of north, east, south, west pixels to alpha val of current pixel
		//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offset_x).a);
		//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offset_y).a);
		//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offset_y).a);
	
		gl_FragColor = vec4(outline_colour.r, outline_colour.g, outline_colour.b, alpha); // draw outline
		
	} else {
	
		gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0); // draw nothing (empty pixel)
		//v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	
	}
	//gl_FragColor.a = alpha;
}
