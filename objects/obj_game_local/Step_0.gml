event_inherited()

//Spawn dogs for local players
for (var i = 0; i < instance_number(obj_player_local); i ++) {
	var player = instance_find(obj_player_local, i);
	if (!player.alive) {
		if (!ds_map_exists(respawn_timer, player) || respawn_timer[? player] == -1) { // check if timer is not set
			respawn_timer[? player] = respawn_time // set timer for this player
		} else {
			respawn_timer[? player] -= 1 // decrease timer
			if respawn_timer[? player] == 0 { // check if elapsed
				spawn_player(player)  // do spawn
				respawn_timer[? player] = -1  // disable timer
			}
		}
	}
}