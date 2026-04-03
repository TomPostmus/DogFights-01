// obj_player_appearance: Defines a player appearance, e.g. different dog races or a pig. 
// Contains appearance data, animation logic and draw logic for appearance.

// Player reference
player = noone

// Appearance constants
spr_body = spr_pip_trunk					//constants on sprites
spr_head = spr_pip_head
spr_eyes = spr_pip_eyes
spr_eyes_blink = spr_pip_eyes_blink
spr_tail = spr_pip_tail
spr_arm = spr_pip_arm
spr_hand = spr_pip_hand

trunk_phybody_obj = obj_physics_pip_trunk	//constants on phybody objects
head_phybody_obj = obj_physics_pip_head
trunk_hitmask_obj = obj_hitmask_pip_trunk	//constants on hitmask objects
head_hitmask_obj = obj_hitmask_pip_head
// TODO make list of hitmasks for head and trunk, to allow more complex hitmask behaviour, e.g. team-hit exclusion

head_offset = 8								//offset from trunk center to head over (relative) x-axis
arms_offset = 6								//offset from trunk center to arms base (or chest)
shoulder_offset = 3							//lateral (over y-axis) offset of each shoulder
tail_offset = -11							//offset from trunk center to tail over x-axis

head_rotation_limit = 80					//maximal angle of head with trunk

// Team collar
team_collar = false // whether not to wear team identification collar
team_color = c_white // the color that represents team

// Animation state
anim_body = 0
anim_head = 0
anim_eyes = 0
anim_tail = 5

shock = 0
angle_head = 0
head_kickback = 0
look_angle = 0
look_speed = 0.2
look_target_x = undefined
look_target_y = undefined

breath_exertion = 0
breath_exhaustion = 0
breath_state = "pause"
breath_pausetime = 50
breath_inhaletime = 100
breath_exhaletime = 90
breath_tick = 0

blink = false
blink_time = 8
blink_pause = 180
blink_tick = 0

fire_event = false				// boolean that flips true when gun fires, set from weapon object

// Arms movement and sway
arms_speed_x = 0
arms_speed_y = 0
arms_flex = false
arms_flex_timer = 0
arms_move_input_previous = 0

// Add force vector to arms animation
function arms_add_force(_force_x, _force_y) {
	arms_speed_x += _force_x
	arms_speed_y += _force_y
}

// Draw current animation state at _body
function draw(_body) {
	
	// Draw weapon
	player.weapon.draw(_body)
	
	// Draw body
	draw_sprite_ext(spr_body, anim_body, _body.get_x(), _body.get_y(), 1, 1, _body.get_trunk_rotation(), c_white, 1)
	
	// Draw team collar if enabled
	if (team_collar)
		draw_sprite_ext(spr_team_collar, 0, _body.get_x(), _body.get_y(), 1, 1, _body.get_trunk_rotation(), team_color, 1)
	
	// Draw head
	draw_sprite_ext(spr_head, anim_head, _body.get_x() + lengthdir_x(head_offset - head_kickback, _body.get_trunk_rotation()), _body.get_y() + lengthdir_y(head_offset - head_kickback, _body.get_trunk_rotation()), 1, 1, _body.get_head_rotation(), c_white, 1)
	
	// Draw eyes
	var eyes_spr = blink ? spr_eyes_blink : spr_eyes;
	draw_sprite_ext(eyes_spr, anim_eyes, _body.get_x() + lengthdir_x(head_offset - head_kickback, _body.get_trunk_rotation()), _body.get_y() + lengthdir_y(head_offset - head_kickback, _body.get_trunk_rotation()), 1, 1, _body.get_head_rotation(), c_white, 1)
	
	// Draw tail
	draw_sprite_ext(spr_tail, anim_tail, _body.get_x() + lengthdir_x(tail_offset, _body.get_trunk_rotation()), _body.get_y() + lengthdir_y(tail_offset, _body.get_trunk_rotation()), 1, 1, _body.get_trunk_rotation(), c_white, 1)

}

// Set anim_body based on leg angle
function set_leg_angle(_leg_angle) {
	var anim_length = sprite_get_number(spr_body)
	anim_body = anim_length / 2 + _leg_angle / 90 * anim_length
	anim_body += 0.01											//correction to avoid glitching into previous frame when still
	anim_body = clamp(anim_body, 0, anim_length - 0.01)			//clamp to not overflow into first/last frame
}

// Create particles at bullet hit
function bullet_hit(_bullet, _normal_dir) {
	var _orig_x = _bullet.x + lengthdir_x(7, _bullet.rotation)
	var _orig_y = _bullet.y + lengthdir_y(7, _bullet.rotation)
	var _rev_dir =  _bullet.rotation + 180 // reverse direction of bullet
	var _pt_dir = _rev_dir//_rev_dir + angle_difference(_rev_dir, _normal_dir) / 2 // average of bullet direction and normal impact direction
	part_type_direction(global.pt_hit, _pt_dir - 17, _pt_dir + 17, 0, 0)  // set direction of particle type
	part_particles_create(global.hit_particles, _orig_x, _orig_y, global.pt_hit, 5)  // do particle burst
}

// Create particles at dying
function death_effect(_body) {
	var _vars = {
		speed_x: _body.get_speed_x(),
		speed_y: _body.get_speed_y(),
		speed_rotation: _body.get_speed_rot(),
		rotation: _body.get_rotation(),
		rotation_vel: _body.get_speed_rot()
	}
	var dth_part = instance_create_layer(_body.get_x(), _body.get_y(), "TexturesLow", obj_death_particles, _vars) // create death particles effect
}