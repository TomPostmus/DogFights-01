event_inherited()

// Update weapon state
if (instance_exists(player)) {
	trigger = player.input.input_attack
	
	// Camera
	if (instance_exists(player.camera) && instance_exists(player.body)) {
		player.camera.set_target(player.body.get_x(), player.body.get_y(), 3)
	
		//Base zoom
		/*var pure_visibility = global.viewport_w * global.viewport_h
		var base_zoom = sqrt(pure_visibility/TARGET_VISIBILITY)
	
		if (instance_exists(dog)) {
			camera_target_x = dog.x
			camera_target_y = dog.y
			camera_target_zoom = base_zoom
		}*/
	}
}

if (stats.fire_mode == GUN_FMODE_AUTO) {
	if (!fire_ready) {
		fire_readying_tick --
		if (fire_readying_tick <= 0) {
			fire_ready = true
			fire_readying_tick = stats.fire_rate
		}
	}
} else if (stats.fire_mode == GUN_FMODE_SEMI) {
	if (!fire_ready) {
		fire_readying_tick --
		if (fire_readying_tick <= 0) {
			fire_readying_tick = 0
			if (!trigger) {
				fire_ready = true
				fire_readying_tick = stats.fire_rate
			}
		}
	}
}

if (ammo_mag <= 0) fire_ready = false