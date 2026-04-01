// obj_animcomp: Data for animation component. Could be a weapon, arm,
// attachment or any other animation object.

// Player reference
player = noone

// Name
name = undefined

// Relative position
pos_x = 0
pos_y = 0
pos_rot = 0

// Sprite variables
sprite = undefined
index = 0
is_visible = false

// Draw self
function draw(_body) {
	if (is_visible) {
		draw_sprite_ext(sprite, index, get_x(_body), get_y(_body), 1, 1, get_rotation(_body), c_white, 1)
	}
}

// Absolute position getters
function get_x(_body) {return _body.get_x() + lengthdir_x(pos_x, _body.get_rotation()) + lengthdir_x(pos_y, _body.get_rotation() - 90) + _body.arms_offset_x}
function get_y(_body) {return _body.get_y() + lengthdir_y(pos_x, _body.get_rotation()) + lengthdir_y(pos_y, _body.get_rotation() - 90) + _body.arms_offset_y}
function get_rotation(_body) {return _body.get_rotation() + pos_rot}