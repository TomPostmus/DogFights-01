//Health regeneration
if (hp < hp_previous) hp_regen_tick = hp_regen_downtime
hp_previous = hp

hp_regen_tick --
if (hp_regen_tick <= 0) {
	hp += hp_regen_amount
	hp_regen_tick = hp_regen_time
}

hp = clamp(hp, 0, hp_max)