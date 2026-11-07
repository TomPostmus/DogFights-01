respawn_time = game_get_speed(gamespeed_fps) * 3  // three seconds respawn time
respawn_timer = ds_map_create() // maps a player (instance) to a respawn timer

// Spawn player (or respawn) at a random spawn marker
function random_spawn_player(player) {
	var _spawn = instance_find(obj_marker_spawn_player, irandom(instance_number(obj_marker_spawn_player)-1)); // find marker
	//var _spawn = instance_find(obj_marker_spawn_player, 0);
	var spawn_x, spawn_y, spawn_rot;
	if (instance_exists(_spawn)) {
		spawn_x = _spawn.x
		spawn_y = _spawn.y
		spawn_rot = _spawn.image_angle
	} else { // if there is no spawn marker, spawn in random location in rom
		spawn_x = random(room_width)
		spawn_y = random(room_height)
		spawn_rot = 0
	}
	spawn_character(spawn_x, spawn_y, spawn_rot)
}

/// @function spawn_character(x, y, rot)
/// @description Spawn character according to x, y, rotation pose
/// @param {real} x The x coordinate at which to spawn character
/// @param {real} y The y coordinate at which to spawn character
/// @param {real} rotation The rotation in which to spawn character
/// @param {obj_appearance} appearance The appearance of the character
/// @returns The spawned character instance
/// @context obj_spawns_controller
spawn_character = function(_x, _y, _rot, _appearance) {
	var _character = create_groundhigh(_x, _y, obj_character)
	_character.rotation = _rot
	_character.appearance = create_controllers(_appearance)
	_character.appearance.character = _character
	_character.initialize()
	
	return _character
}