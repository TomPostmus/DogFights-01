/// @description Draw self with highlight
if (highlight) { // if highlighted, draw with outline
	
	var _tex = sprite_get_texture(sprite_index, image_index) // texture of current sprite
	var _tex_w = texture_get_texel_width(_tex) // get texel width and height
	var _tex_h = texture_get_texel_height(_tex)

	shader_set(sh_outline)

	shader_set_uniform_f(uniform_texel_width, _tex_w) // set shader variables
	shader_set_uniform_f(uniform_texel_height, _tex_h)

	draw_self()

	shader_reset()
	
} else {

	draw_self() // draw normally
	
}