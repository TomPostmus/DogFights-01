event_inherited()

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
	player.spawn(spawn_x, spawn_y, spawn_rot)
}

// Register damage, check team ids and decide whether to deal damage
function register_damage(_p_affected, _p_affector, _damage) {
	_p_affected.hp.register_damage(_p_affector, _damage) // register at hp object
}


// Register that affected player has been kikked by affector player
function register_kik(_p_affected, _p_affector) {
	var _ti = _p_affector.team_id
	team_scores[_ti] += 1
}