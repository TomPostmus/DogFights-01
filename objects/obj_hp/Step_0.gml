//Health regeneration
if (hp < hp_previous) hp_regen_tick = hp_regen_downtime
hp_previous = hp

hp_regen_tick --
if (hp_regen_tick <= 0) {
	hp += hp_regen_amount
	hp_regen_tick = hp_regen_time
	hp = clamp(hp, 0, hp_max) // keep in boundaries
	
	// Scale damage bill when regenning
	for (var i = 0; i < ds_list_size(damage_bill); i ++) {
		var _player = damage_bill[|i][0]
		var _damage = damage_bill[|i][1]
		
		_damage *= (hp_max - hp) / (hp_max - hp_previous) // scale by new hp remainder
		
		if (_damage < 10) { // too small damage, not relevant, stop tracking it
			ds_list_delete(damage_bill, i)
			i --
		}
	}
}

hp = clamp(hp, 0, hp_max) // keep in boundaries

// Die
if (hp <= 0) {
	if (player.alive) {
		player.die()
		obj_game.register_kik(player, last_affector) // register kik at game object (cute word for kill)
	}
}