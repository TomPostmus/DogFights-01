event_inherited()

right = false // whether a right arm

// Override draw function
function draw(_body) {
	if (is_visible) {
		var appearance = player.appearance
		
		// Draw hand and arm
		var hand_base = sprite_get_xoffset(appearance.spr_hand)			// offset from center of hand to base
		var hand_base_x = get_x(_body) + lengthdir_x(-hand_base , get_arm_rotation(_body))
		var hand_base_y = get_y(_body) + lengthdir_y(-hand_base ,  get_arm_rotation(_body))
		
		draw_sprite_ext(appearance.spr_arm, get_arm_index(_body), hand_base_x, hand_base_y, 1, right ? 1 : -1, get_arm_rotation(_body), c_white, 1)
		draw_sprite_ext(appearance.spr_hand, index, get_x(_body), get_y(_body), 1, right ? 1 : -1, get_arm_rotation(_body), c_white, 1)
	}
}

// Absolute shoulder position
function get_shoulder_x(_body) {
	var appearance = player.appearance
	
	// Relative shoulder position
	var relative_x = appearance.arms_offset
	var relative_y = (right ? appearance.shoulder_offset : -appearance.shoulder_offset)
		+ (right ? clamp(0.9*(pos_y - 3), 0, 2) : clamp(0.9*(pos_y + 3), -2, 0)) // slightly move shoulder out for outwards pos_y
		
	return _body.get_x() + lengthdir_x(relative_x, _body.get_rotation()) + lengthdir_x(relative_y, _body.get_rotation() - 90)
}

function get_shoulder_y(_body) {
	var appearance = player.appearance
	
	// Relative shoulder position
	var relative_x = appearance.arms_offset
	var relative_y = (right ? appearance.shoulder_offset : -appearance.shoulder_offset)
		+ (right ? clamp(0.9*(pos_y - 3), 0, 2) : clamp(0.9*(pos_y + 3), -2, 0)) // slightly move shoulder out for outwards pos_y
		
	return _body.get_y() + lengthdir_y(relative_x, _body.get_rotation()) + lengthdir_y(relative_y, _body.get_rotation() - 90)
}

// Absolute rotation of arm, from shoulder to end point
function get_arm_rotation(_body) {
	return point_direction(get_shoulder_x(_body), get_shoulder_y(_body),
		get_x(_body), get_y(_body))										// direction from shoulder to arm
}

// Get image index of arm to match distance from shoulder to end point
function get_arm_index(_body) {
	var appearance = player.appearance
		
	// Determine arm sprite index based on distance
	var dist = point_distance(get_shoulder_x(_body), get_shoulder_y(_body),
		get_x(_body), get_y(_body))									// distance from shoulder to arm
	var hand_base = sprite_get_xoffset(appearance.spr_hand)			// offset from center of hand to base
	return clamp(ceil(dist - hand_base),
		0, sprite_get_number(appearance.spr_arm) - 1)				// set arm index to distance (minus hand base dist) and clamp between 0 and maximum image index
}