/// @param key_code
/// @param action*
function get_key() {

	var key = global.key_binds[? argument[0]];
	var action = undefined;
	if (argument_count > 1) action = argument[1];

	if (key != undefined) {
		if (action == undefined && ds_map_exists(global.key_actions, key)) action = global.key_actions[? key]
		if (action == undefined) action = KEYACTION_PRESS

		switch (action) {
			case KEYACTION_PRESS: return keyboard_check_pressed(key)
			case KEYACTION_HOLD: return keyboard_check(key)
			case KEYACTION_RELEASE: return keyboard_check_released(key)
		}
	}

	return false


}
