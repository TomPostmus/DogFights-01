// obj_body: Embodiment of character. Contains spatial attributes of the body.
// Can be in the normal physical state, or a non-physical representation of
// the character.

// Character reference, body does not necessarily have character
character = noone

// Appearance reference
appearance = noone

// Physical boolean (indicates whether physical body or not)
physical = false

// Rotation
if (!variable_instance_exists(id, "rotation")) // check if rotation is not given as creation struct
	rotation = 0

// Draw callback
draw_callback = undefined

// Physical body instances
trunk = noone											//trunk physics object
head = noone											//head physics object
hitmask_head = noone									//hitmask of head
hitmask_trunk = noone									//hitmask of trunk
hitmask_arm_left = noone								//hitmask of left arm
hitmask_arm_right = noone								//hitmask of right arm
trunk_head_weld = -1
trunk_head_revolute = -1

// Additional variables for non-physical representation
trunk_rotation = 0
head_rotation = 0

// Arms offset in animation (for animating recoil and sway)
arms_offset_x = 0
arms_offset_y = 0

// Speed change
previous_speed_x = 0
previous_speed_y = 0
previous_speed_rot = 0
speed_change_x = 0
speed_change_y = 0
speed_change_rot = 0

// Destroy physical body
function destroy_physical_body() {
	instance_destroy(trunk)
	instance_destroy(head)
	physics_joint_delete(trunk_head_weld)
	physics_joint_delete(trunk_head_revolute)
	
	instance_destroy(hitmask_head)
	instance_destroy(hitmask_trunk)
	instance_destroy(hitmask_arm_left)
	instance_destroy(hitmask_arm_right)
}

// Create (or refresh) physics body
function create_physical_body() {
	destroy_physical_body()
	
	// TODO create in rotation

	trunk = create_groundhigh(x, y, appearance.trunk_phybody_obj)
	trunk.phy_rotation = -rotation
	head = create_groundhigh(x + lengthdir_x(appearance.head_offset, rotation), y + lengthdir_y(appearance.head_offset, rotation),  appearance.head_phybody_obj)
	head.phy_rotation = -rotation
	
	trunk_head_weld = physics_joint_weld_create(trunk, head, head.x, head.y, 0, 40, 3, false)
	trunk_head_revolute = physics_joint_revolute_create(trunk, head, head.x, head.y, -appearance.head_rotation_limit, appearance.head_rotation_limit, true, 0, 0, false, false)
	
	hitmask_trunk = create_groundhigh(x, y, appearance.trunk_hitmask_obj)
	hitmask_trunk.body = id
	hitmask_head = create_groundhigh(x + lengthdir_x(appearance.head_offset, rotation), y + lengthdir_y(appearance.head_offset, rotation), appearance.head_hitmask_obj)
	hitmask_head.body = id
	hitmask_arm_left = create_groundhigh(x, y, obj_hitmask_arm_left)
	hitmask_arm_left.body = id
	hitmask_arm_right = create_groundhigh(x, y, obj_hitmask_arm_right)
	hitmask_arm_right.body = id
}

// Hit by _bullet on _body_part ("head", "trunk", "arm_left", etc...)
function hit(_bullet, _body_part) {
	obj_game.register_damage(character, _bullet.team_id, _bullet.player, _bullet.damage)
	
	if (physical) {
		if (_body_part == "head") { // for head hit apply impulse to head
			with (head) 
				physics_apply_impulse(_bullet.x, _bullet.y, 
					_bullet.speed_x*_bullet.weight, _bullet.speed_y*_bullet.weight)
			var _normal_dir = point_direction(head.x, head.y, _bullet.x, _bullet.y) // normal direction of hit
			appearance.bullet_hit(_bullet, _normal_dir)
		} else {					// for hit to trunk or arms, apply impulse to trunk
			with (trunk) 
				physics_apply_impulse(_bullet.x, _bullet.y, 
					_bullet.speed_x*_bullet.weight, _bullet.speed_y*_bullet.weight)
			var _normal_dir = point_direction(trunk.x, trunk.y, _bullet.x, _bullet.y)
			appearance.bullet_hit(_bullet, _normal_dir)
		}
	}
}

function set_physical(_physical) {
	physical = _physical
	
	if (_physical) {
		create_physical_body()
	} else {
		destroy_physical_body()
	}
}

function set_speed(_speed_x, _speed_y) {
	if (physical) {
		trunk.phy_speed_x = _speed_x
		trunk.phy_speed_y = _speed_y
	} else {
		hspeed = _speed_x
		vspeed = _speed_y
	}
}

function add_speed(_speed_x, _speed_y) {
	if (physical) {
		trunk.phy_speed_x += _speed_x
		trunk.phy_speed_y += _speed_y
	} else {
		hspeed += _speed_x
		vspeed += _speed_y
	}
}

// Set rotation of head (clamp with trunk angle limit)
function set_head_rotation(_rotation) {	
	if (physical) {
		head.phy_rotation = -clamp(_rotation, -appearance.head_rotation_limit, appearance.head_rotation_limit)
	} else {
		head_rotation = clamp(_rotation, -appearance.head_rotation_limit, appearance.head_rotation_limit)
	}
}

// Getters
function get_x() {return physical ? trunk.x : x}
function get_y() {return physical ? trunk.y : y}
function get_speed_x() {return physical ? trunk.phy_speed_x : hspeed}
function get_speed_y() {return physical ? trunk.phy_speed_y : vspeed}
function get_speed_rot() {return physical ? -trunk.phy_angular_velocity / game_get_speed(gamespeed_fps) : 0} // TODO implement non-physical
function get_speed() {return point_distance(0, 0, get_speed_x(), get_speed_y())}
function get_speed_dir() {return point_direction(0, 0, get_speed_x(), get_speed_y())}
function get_rotation() {return -trunk.phy_rotation}
function get_trunk_rotation() {return physical ? -trunk.phy_rotation : trunk_rotation}
function get_trunk_speed_rot() {return -trunk.phy_angular_velocity / game_get_speed(gamespeed_fps)}
function get_head_x() {return physical ? head.x : x + lengthdir_x(appearance.head_offset, get_rotation())}
function get_head_y() {return physical ? head.y : y + lengthdir_y(appearance.head_offset, get_rotation())}
function get_head_speed_x() {return physical ? head.phy_speed_x : hspeed}
function get_head_speed_y() {return physical ? head.phy_speed_y : vspeed}
function get_head_rotation() {return physical ? -head.phy_rotation : head_rotation}
function get_speed_change_x() {return speed_change_x}
function get_speed_change_y() {return speed_change_y}
function get_speed_change_rot() {return speed_change_rot}

// Get speed of point on trunk at offset (offset relative to body, with body rotation)
function get_trunk_speed_x_offset(_x_off, _y_off) {
	var ang_vel = -trunk.phy_angular_velocity / game_get_speed(gamespeed_fps)
	return trunk.phy_speed_x + ang_vel * lengthdir_x(2 * pi * point_distance(0, 0, _x_off, _y_off) / 360, point_direction(0, 0, _x_off, _y_off) + 90)
}

function get_trunk_speed_y_offset(_x_off, _y_off) {
	var ang_vel = -trunk.phy_angular_velocity / game_get_speed(gamespeed_fps)
	return trunk.phy_speed_y + ang_vel * lengthdir_y(2 * pi * point_distance(0, 0, _x_off, _y_off) / 360, point_direction(0, 0, _x_off, _y_off) + 90)
}

// Get speed of point on head at offset (offset relative to body, with body rotation)
function get_head_speed_x_offset(_x_off, _y_off) {
	var ang_vel = -head.phy_angular_velocity / game_get_speed(gamespeed_fps)
	return head.phy_speed_x + ang_vel * lengthdir_x(2 * pi * point_distance(0, 0, _x_off, _y_off) / 360, point_direction(0, 0, _x_off, _y_off) + 90)
}

function get_head_speed_y_offset(_x_off, _y_off) {
	var ang_vel = -head.phy_angular_velocity / game_get_speed(gamespeed_fps)
	return head.phy_speed_y + ang_vel * lengthdir_y(2 * pi * point_distance(0, 0, _x_off, _y_off) / 360, point_direction(0, 0, _x_off, _y_off) + 90)
}

// Get relative x coordinate from absolute coordinates
function get_relative_x(_x, _y) {
	return dcos(angle_difference(point_direction(get_x(), get_y(), _x, _y), get_rotation())) * point_distance(get_x(), get_y(), _x, _y)
}

// Get relative y coordinate from absolute coordinates
function get_relative_y(_x, _y) {
	return -dsin(angle_difference(point_direction(get_x(), get_y(), _x, _y), get_rotation())) * point_distance(get_x(), get_y(), _x, _y)
}