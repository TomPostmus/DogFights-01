event_inherited()

// Update animation state
if (instance_exists(player) && instance_exists(player.body)) {
	var body = player.body
	
	//Animate tail
	var tail_speed_x = body.get_trunk_speed_x_offset(tail_offset, 0)
	var tail_speed_y = body.get_trunk_speed_y_offset(tail_offset, 0)
	var decomposed_speed = length_in_direction(tail_speed_x, tail_speed_y, body.get_trunk_rotation() - 90)
	anim_tail -= decomposed_speed*1
	var falldown_force = (anim_tail - 6)*0.05;
	if (falldown_force >= 0) falldown_force = clamp(falldown_force - 0.07, 0, 100)
	else falldown_force = clamp(falldown_force + 0.07, -100, 0)
	anim_tail += falldown_force
	anim_tail = clamp(anim_tail, 0, sprite_get_number(spr_tail)-1)
}