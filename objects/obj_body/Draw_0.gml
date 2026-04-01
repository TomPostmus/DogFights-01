// Update trunk hit mask
with (hitmask_trunk) {
	x = other.get_x()
	y = other.get_y()
	image_angle = other.get_trunk_rotation()
}

// Update head hit mask
with (hitmask_head) {
	x = other.get_head_x()
	y = other.get_head_y()
	image_angle = other.get_head_rotation()
}

// Update arm hitmasks
with (hitmask_arm_left) {
	var arm_anim_component = player.weapon.anim_component_arm_left
	x = arm_anim_component.get_x(other)
	y = arm_anim_component.get_y(other)
	image_angle = arm_anim_component.get_arm_rotation(other)
	image_index = arm_anim_component.get_arm_index(other)
}

with (hitmask_arm_right) {
	var arm_anim_component = player.weapon.anim_component_arm_right
	x = arm_anim_component.get_x(other)
	y = arm_anim_component.get_y(other)
	image_angle = arm_anim_component.get_arm_rotation(other)
	image_index = arm_anim_component.get_arm_index(other)
}

// Draw self
if (instance_exists(player)) {
	player.appearance.draw(id)
}