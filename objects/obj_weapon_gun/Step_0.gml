event_inherited()

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