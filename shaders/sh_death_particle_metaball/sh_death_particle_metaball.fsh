//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);

    float intensity = col.r;

    // threshold (controls merging)
    float threshold = 0.5;

    // smooth blending
    float alpha = smoothstep(threshold - 0.1, threshold + 0.1, intensity);

    gl_FragColor = vec4(vec3(1.0), alpha);
}
