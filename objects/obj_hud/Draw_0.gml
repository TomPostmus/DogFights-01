// Draw in-world HUD elements (e.g. interactable outlines, friendly player health bars)
for (var i = 0; i < ds_list_size(obj_lobby.players_active); i ++) {
	var _player = obj_lobby.players_active[|i]
	var _character = _player.character
	
	// Draw outline of object in interaction focus
	if (instance_exists(_character) && _character.interact_focus != undefined) {
	with (_character.interact_focus) {
			
		var _tex = sprite_get_texture(sprite_index, image_index) // texture of current sprite
		var _tex_w = texture_get_texel_width(_tex) // get texel width and height
		var _tex_h = texture_get_texel_height(_tex)

		shader_set(sh_outline)

		shader_set_uniform_f(other.uniform_texel_width, _tex_w) // set shader variables
		shader_set_uniform_f(other.uniform_texel_height, _tex_h)
		shader_set_uniform_f(other.uniform_outline_colour, 1, 1, 1)

		draw_self()

		shader_reset()
			
	}}
}