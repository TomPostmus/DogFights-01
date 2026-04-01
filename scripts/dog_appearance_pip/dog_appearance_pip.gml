/// @param dog_obj
function dog_appearance_pip() {

	var dog = argument[0];

	with (dog) {
		//Breathing
		if (move_input != 0) anim_breath_exhaustion += 0.003
		else anim_breath_exhaustion -= 0.001
		anim_breath_exhaustion = clamp(anim_breath_exhaustion, 0, 10)
	
		anim_breath_pausetime = 70 - anim_breath_exhaustion*4
		anim_breath_inhaletime = 110 - anim_breath_exhaustion*4
		anim_breath_exhaletime = 90 - anim_breath_exhaustion*4
	
		anim_breath_tick ++
		if (anim_breath_state == "pause") {
			anim_breath_exertion = 0
			if (anim_breath_tick >= anim_breath_pausetime) {
				anim_breath_tick = 0
				anim_breath_state = "inhale"
			}
		} else if (anim_breath_state == "inhale") {
			anim_breath_exertion += (0.7 - anim_breath_exertion)*(0.018 + anim_breath_exhaustion*0.0005)
			if (anim_breath_tick >= anim_breath_inhaletime) {
				anim_breath_tick = 0
				anim_breath_state = "exhale"
			}
		} else if (anim_breath_state == "exhale") {
			anim_breath_exertion += (0 - anim_breath_exertion)*(0.026 + anim_breath_exhaustion*0.0005)
			if (anim_breath_tick >= anim_breath_exhaletime) {
				anim_breath_tick = 0
				anim_breath_state = "pause"
			}
		}
	
		//Eyes
		var eyes_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_eyes");
		var blink_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_eyes_blink");
		if (eyes_sprite != undefined && sprite_exists(eyes_sprite) && blink_sprite != undefined && sprite_exists(blink_sprite)) {
			anim_blink_tick --
			if (anim_blink) {
				anim_eyes += 1
				anim_eyes = clamp(anim_eyes, 0, sprite_get_number(blink_sprite)-1)
				if (anim_blink_tick <= 0) {
					anim_blink_tick = irandom_range(anim_blink_pause-30, anim_blink_pause+30)
					anim_blink = false
					anim_eyes = 0
				}
			} else {
				anim_eyes = 0
				var surprise_blink = false;
				if (previous_x != undefined && previous_y != undefined && point_distance(speed_x, speed_y,
					previous_speed_x, previous_speed_y) > 1.4) surprise_blink = true
				if (anim_blink_tick <= 0 || surprise_blink) {
					anim_blink_tick = anim_blink_time
					anim_blink = true
					anim_eyes = 0
				}
			}
		}
	
		//Animate body
		/*var body_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_body");
		if (body_sprite != undefined && sprite_exists(body_sprite)) {
			var decomposed_speed = length_in_direction(speed_x, speed_y, rotation)
			if (abs(decomposed_speed) > 0.2 && move_input != 0) anim_body += decomposed_speed * anim_walk_speed
			else anim_body = 0
			anim_body = strong_mod(anim_body, sprite_get_number(body_sprite))
		}*/

		//Animate tail
		var tail_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_tail");
		if (tail_sprite != undefined && sprite_exists(tail_sprite)) {
			if (previous_x != undefined && previous_y != undefined && previous_rot != undefined) {
				var tail_speed_x = (x + lengthdir_x(tail_offset, rotation)) - (previous_x + lengthdir_x(tail_offset, previous_rot));
				var tail_speed_y = (y + lengthdir_y(tail_offset, rotation)) - (previous_y + lengthdir_y(tail_offset, previous_rot));
				var decomposed_speed = length_in_direction(tail_speed_x, tail_speed_y, rotation - 90)
				anim_tail -= decomposed_speed*0.25
				var falldown_force = (anim_tail - 6)*0.05;
				if (falldown_force >= 0) falldown_force = clamp(falldown_force - 0.07, 0, 100)
				else falldown_force = clamp(falldown_force + 0.07, -100, 0)
				anim_tail += falldown_force
				anim_tail = clamp(anim_tail, 0, sprite_get_number(tail_sprite)-1)
			}
		}
	
		//Animate head
		var head_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_head");
		if (head_sprite != undefined && sprite_exists(head_sprite)) {
			if (previous_x != undefined && previous_y != undefined && previous_rot != undefined) {
				var head_speed_x = (x + lengthdir_x(head_offset, rotation)) - (previous_x + lengthdir_x(head_offset, previous_rot));
				var head_speed_y = (y + lengthdir_y(head_offset, rotation)) - (previous_y + lengthdir_y(head_offset, previous_rot));
				var decomposed_speed = length_in_direction(head_speed_x, head_speed_y, anim_angle_head)
				anim_head = decomposed_speed*0.75
				anim_head = clamp(anim_head, 0, 1)
				anim_head_kickback = anim_breath_exertion + clamp(decomposed_speed*0.25, 0, 1.5)
			}
			if (turn_input != 0) {
				anim_look_angle += (15*turn_input - anim_look_angle)*anim_look_speed
				anim_look_speed = 0.1
				anim_angle_head = rotation + anim_look_angle
			} else {
				anim_look_angle += (0 - anim_look_angle)*anim_look_speed
				anim_look_speed = 0.2
				anim_angle_head = rotation + anim_look_angle
			}
		}
	
		//Arms sway
		if (previous_x != undefined && previous_y != undefined && previous_rot != undefined) {
			var arms_speed_x = (x + lengthdir_x(13, rotation)) - (previous_x + lengthdir_x(13, previous_rot));
			var arms_speed_y = (y + lengthdir_y(13, rotation)) - (previous_y + lengthdir_y(13, previous_rot));
			var decomposed_speed_x = length_in_direction(arms_speed_x, arms_speed_y, rotation)
			var decomposed_speed_y = length_in_direction(arms_speed_x, arms_speed_y, rotation - 90)
			anim_arms_offset_x += -decomposed_speed_x*4
			anim_arms_offset_y += -decomposed_speed_y*3
			anim_arms_offset_x += -anim_breath_exertion*6
			anim_arms_offset_x += decomposed_speed_x > 0 ? (0 - anim_arms_offset_x)*0.79 : (0 - anim_arms_offset_x)*0.9
			anim_arms_offset_y += (0 - anim_arms_offset_y)*0.99
			anim_arms_offset_x = clamp(anim_arms_offset_x, -10, 2)
			anim_arms_offset_y = clamp(anim_arms_offset_y, -5, 5)
		}
	
	}


}
