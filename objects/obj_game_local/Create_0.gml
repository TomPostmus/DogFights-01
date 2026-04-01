event_inherited()

respawn_time = game_get_speed(gamespeed_fps) * 3  // three seconds respawn time
respawn_timer = ds_map_create() // maps a player (instance) to a respawn timer


function spawn_player(player) {
	//var _spawn = instance_find(obj_marker_spawn_player, irandom(instance_number(obj_marker_spawn_player)-1));
	var _spawn = instance_find(obj_marker_spawn_player, 0);
	var spawn_x, spawn_y;
	if (instance_exists(_spawn)) {
		spawn_x = _spawn.x
		spawn_y = _spawn.y
	} else {
		spawn_x = random(room_width)
		spawn_y = random(room_height)
	}
	player.spawn(spawn_x, spawn_y)
}