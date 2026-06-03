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

// Determine interact focus object
interact_focus = undefined // reset focus
var _max_dist = interact_range
for (var i = 0; i < array_length(interactables); i ++) {
	var _obj = interactables[i] // object index of interable
	var _xp = body.trunk.x // current position
	var _yp = body.trunk.y
	
	with (_obj) { // loop through instances
		if (interactable) {
			var _dist = point_distance(_xp, _yp, x, y)
			if (_dist < _max_dist) { // if within range, and closest of other interactables
				other.interact_focus = id // set as focus
			}
		}
	}
}

if (interact_focus != undefined && interact) { // if we have object in our interact focus
	interact_focus.interact() // do interaction function of object of focus
}

// Die
if (hp <= 0) {
	if (instance_exists(player))
		obj_game.register_kik(player, damage_last_affector) // register kik at game object (cute word for kill)

	appearance.death_effect(body) // death effect
	instance_destroy() // destroy self
}