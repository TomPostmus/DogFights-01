/// @param weapon_obj
function weapon_get_input_handler() {

	var weapon = argument[0];

	switch (weapon.object_index) {
		case obj_weapon_gun_usp: return create_controllers(obj_handler_weapon_gun_usp)
		case obj_weapon_gun_striker: return create_controllers(obj_handler_weapon_gun_striker)
		case obj_weapon_melee_fists: return create_controllers(obj_handler_weapon_fists)
		default: show_error("No input handler found for " + object_get_name(weapon.object_index), false); return noone
	}


}
