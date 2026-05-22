/// @description Init bear appearance

// Inherit the parent event
event_inherited();

// Death particles sample color
death_part_sample_color = function(_x, _y) {
	return c_black
}

// Appearance constants
spr_body = spr_bear_trunk					//constants on sprites
spr_head = spr_bear_head
spr_eye_left = spr_bear_eye_left
spr_eye_right = spr_bear_eye_right
spr_tail = spr_bear_tail
spr_arm = spr_bear_arm
spr_hand = spr_bear_hand

trunk_phybody_obj = obj_physics_pip_trunk	//constants on phybody objects
head_phybody_obj = obj_physics_pip_head
trunk_hitmask_obj = obj_hitmask_pip_trunk	//constants on hitmask objects
head_hitmask_obj = obj_hitmask_pip_head

tail_offset = -13