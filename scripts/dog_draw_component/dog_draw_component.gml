/// @param dog_obj
/// @param component_obj
function dog_draw_component() {

	var dog = argument[0];
	var component = argument[1];

	with (dog) {
		var component_pos_x = component.pos_x + anim_arms_offset_x
		var component_pos_y = component.pos_y + anim_arms_offset_y
		if (component.sprite != undefined && sprite_exists(component.sprite) && component.is_visible) {
			draw_sprite_ext(component.sprite, component.index, x + lengthdir_x(component_pos_x, rotation) + lengthdir_x(component_pos_y, rotation - 90), y + lengthdir_y(component_pos_x, rotation) + lengthdir_y(component_pos_y, rotation - 90), 1, 1, component.rotation + rotation, c_white, 1)
		}
	}


}
