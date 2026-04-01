//Spawn dogs for remote players
for (var i = 0; i < ds_list_size(remote_players); i ++) {
	with (remote_players[|i]) {
		if (hp > 0 && !instance_exists(dog)) {
			dog = create_groundhigh(0, 0, obj_dog)
		}
	}
}

//Spawn dogs for local players
var spawn_x = random(room_width), spawn_y = random(room_height);
for (var i = 0; i < ds_list_size(local_players); i ++) {
	with (local_players[|i]) {
		if (hp > 0 && !instance_exists(dog)) {
			dog = create_groundhigh(spawn_x, spawn_y, obj_dog)
		}
	}
}