/// @param dog_obj
/// @param weapon_obj
function dog_draw_weapon() {

	var dog = argument[0];
	var weapon = argument[1];

	with (dog) {
		var weapon_pos_x = weapon.pos_x + anim_arms_offset_x
		var weapon_pos_y = weapon.pos_y + anim_arms_offset_y
		if (weapon.sprite != undefined && sprite_exists(weapon.sprite) && weapon.is_visible) {
			var draw_order = weapon_data(weapon, "draw_order");
			for (var i = 0; i < ds_list_size(draw_order); i ++) {
				var component = draw_order[|i];
				if (component == "1") {
					draw_sprite_ext(weapon.sprite, weapon.index, x + lengthdir_x(weapon_pos_x, rotation) + lengthdir_x(weapon_pos_y, rotation - 90), y + lengthdir_y(weapon_pos_x, rotation) + lengthdir_y(weapon_pos_y, rotation - 90), 1, 1, weapon.rotation + rotation, c_white, 1)
				} else if (ds_list_find_index(weapon.active_components, component) != -1) {
					var component_sprite = weapon_data(weapon, component, ATTR_SPR);
					if (component_sprite != undefined && sprite_exists(component_sprite)) {
						draw_sprite_ext(weapon_data(weapon, component, ATTR_SPR), weapon_data(weapon, component, ATTR_IND), x + lengthdir_x(weapon_pos_x, rotation) + lengthdir_x(weapon_pos_y, rotation - 90) + lengthdir_x(weapon_data(weapon, component, ATTR_X), weapon.rotation + rotation) + lengthdir_x(weapon_data(weapon, component, ATTR_Y), weapon.rotation + rotation - 90), y + lengthdir_y(weapon_pos_x, rotation) + lengthdir_y(weapon_pos_y, rotation - 90) + lengthdir_y(weapon_data(weapon, component, ATTR_X), weapon.rotation + rotation) + lengthdir_y(weapon_data(weapon, component, ATTR_Y), weapon.rotation + rotation - 90), 1, 1, weapon.rotation + rotation, c_white, 1)
					}
				}
			}
			ds_list_destroy(draw_order)
		}
	}


}
