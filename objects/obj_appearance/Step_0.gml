// Update animation state
if (instance_exists(player) && instance_exists(player.body)) {
	var body = player.body
	
	//Breathing
	if (player.input.move_input != 0) breath_exhaustion += 0.003
	else breath_exhaustion -= 0.001
	breath_exhaustion = clamp(breath_exhaustion, 0, 10)
	
	breath_pausetime = 70 - breath_exhaustion*4
	breath_inhaletime = 110 - breath_exhaustion*4
	breath_exhaletime = 90 - breath_exhaustion*4
	
	breath_tick ++
	if (breath_state == "pause") {
		breath_exertion = 0
		if (breath_tick >= breath_pausetime) {
			breath_tick = 0
			breath_state = "inhale"
		}
	} else if (breath_state == "inhale") {
		breath_exertion += (0.7 - breath_exertion)*(0.018 + breath_exhaustion*0.0005)
		if (breath_tick >= breath_inhaletime) {
			breath_tick = 0
			breath_state = "exhale"
		}
	} else if (breath_state == "exhale") {
		breath_exertion += (0 - breath_exertion)*(0.026 + breath_exhaustion*0.0005)
		if (breath_tick >= breath_exhaletime) {
			breath_tick = 0
			breath_state = "pause"
		}
	}
	
	//Eyes
	blink_tick --
	if (blink) {
		anim_eyes += 1
		anim_eyes = clamp(anim_eyes, 0, sprite_get_number(spr_eyes_blink)-1)
		if (blink_tick <= 0) {
			blink_tick = irandom_range(blink_pause-30, blink_pause+30)
			blink = false
			anim_eyes = 0
		}
	} else {
		anim_eyes = 0
		var surprise_blink = false;
		if (point_distance(0, 0, body.speed_change_x, body.speed_change_y) > 1.4) surprise_blink = true
		if (blink_tick <= 0 || surprise_blink) {
			blink_tick = blink_time
			blink = true
			anim_eyes = 0
		}
	}

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
	
	//Animate head
	var head_speed_x = body.get_head_speed_x()
	var head_speed_y = body.get_head_speed_y()
	var decomposed_speed = length_in_direction(head_speed_x, head_speed_y, body.get_head_rotation())
	anim_head = decomposed_speed*0.75
	anim_head = clamp(anim_head, 0, 1)
	head_kickback = breath_exertion + clamp(decomposed_speed*0.25, 0, 1.5)
	
	// Arms physics model
	// Determine when to flex
	arms_flex_timer --
	if (arms_flex_timer <= 0)
		arms_flex = false
	
	// Flex when change in move input
	if (arms_move_input_previous != player.input.move_input) {
		arms_flex = true						// flex when out of range
		arms_flex_timer = 10
	}
	arms_move_input_previous = player.input.move_input
	
	// Flex when fire event
	if (fire_event) {
		arms_flex = true
		arms_flex_timer = 10
	}
	
	// Flex when out of range
	var relative_x = body.get_relative_x(body.get_x() + body.arms_offset_x, body.get_y() + body.arms_offset_y)
	var relative_y = body.get_relative_y(body.get_x() + body.arms_offset_x, body.get_y() + body.arms_offset_y)
	if (relative_x < -3 || relative_x > 5 ||
		relative_y < -10 || relative_y > 10) {
		arms_flex = true						
		arms_flex_timer = 10
	}
	
	// Calculate speed change at chest location
	var chest_speed_change_x = body.get_speed_change_x()
	var chest_speed_change_y = body.get_speed_change_y()
	chest_speed_change_x += (body.get_speed_change_rot() * lengthdir_x(2 * pi * arms_offset / 360, body.get_rotation() + 90)) * 0.6 // angular contribution, with factor 0.8 to lessen effect
	chest_speed_change_y += (body.get_speed_change_rot() * lengthdir_y(2 * pi * arms_offset / 360, body.get_rotation() + 90)) * 0.6
	arms_speed_x += -chest_speed_change_x * 2 // subtract speed change from speed, for mass laziness effect
	arms_speed_y += -chest_speed_change_y * 2
	
	// Return to normal position
	var normal_pos_x = lengthdir_x(breath_exertion, body.get_rotation() - 45)
	var normal_pos_y = lengthdir_y(breath_exertion, body.get_rotation() - 45)
	
	arms_speed_x += (normal_pos_x - body.arms_offset_x) * (arms_flex ? 0.5 : 0.05)	// move to position, velocity controlled
	arms_speed_y += (normal_pos_y - body.arms_offset_y) * (arms_flex ? 0.5 : 0.05)
	arms_speed_x *= arms_flex ? 0.4 : 0.5							// decay velocity to avoid overshoot
	arms_speed_y *= arms_flex ? 0.4 : 0.5
	//arms_speed_x += arms_return_pid_x.get(body.arms_offset_x, 0) // use pid to return to 0, 0
	//arms_speed_y += arms_return_pid_y.get(body.arms_offset_y, 0)

	// Update offset with speed
	body.arms_offset_x += arms_speed_x
	body.arms_offset_y += arms_speed_y
		
	/*if (player.input.turn_input != 0) {
		look_angle += (15*player.input.turn_input - look_angle)*look_speed
		look_speed = 0.1
		body.set_head_rotation(body.get_rotation() + look_angle)
	} else {
		look_angle += (0 - look_angle)*look_speed
		look_speed = 0.2
		body.set_head_rotation(body.get_rotation() + look_angle)
	}*/
	
	//Arms sway
	/*if (body.previous_x != undefined && body.previous_y != undefined && body.previous_rot != undefined) {
		var arms_speed_x = (body.get_x() + lengthdir_x(13, body.rotation)) - (body.previous_x + lengthdir_x(13, body.previous_rot));
		var arms_speed_y = (body.get_y() + lengthdir_y(13, body.rotation)) - (body.previous_y + lengthdir_y(13, body.previous_rot));
		var decomposed_speed_x = length_in_direction(arms_speed_x, arms_speed_y, body.rotation)
		var decomposed_speed_y = length_in_direction(arms_speed_x, arms_speed_y, body.rotation - 90)
		arms_offset_x += -decomposed_speed_x*4
		arms_offset_y += -decomposed_speed_y*3
		arms_offset_x += -breath_exertion*6
		arms_offset_x += decomposed_speed_x > 0 ? (0 - arms_offset_x)*0.79 : (0 - arms_offset_x)*0.9
		arms_offset_y += (0 - arms_offset_y)*0.99
		arms_offset_x = clamp(arms_offset_x, -10, 2)
		arms_offset_y = clamp(arms_offset_y, -5, 5)
	}*/
	
	// Turn off event flags
	fire_event = false	
}