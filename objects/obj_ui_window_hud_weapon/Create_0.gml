/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

dragable = false // stationary window
header = false // no title and exit button
has_title = false

font = ft_normal
text_colour = c_white

// Set shape
width = 200
height = 40
corner_size = 10
lb_corn_snip = false
update_vertices()

new_width = width // new width variable to know when to resize window
cont_margin = 10 // inner margin of contents

// Override draw method
super_draw = draw // save draw method from parent
draw = function(_player) {
	super_draw()
	
	draw_set_font(font)
	draw_set_colour(text_colour)
	
	// Draw weapon bullets
	var _weapon = _player.weapon
	var _weap_w = 100
	if (instance_exists(_weapon)) {
		_weap_w = _weapon.draw_hud(id) // draw weapon element in window and return the width of the drawn contents
	}
	
	// Draw HP
	var _bar_w = 100
	var _xp = x + cont_margin
	var _yp = y + cont_margin * 3
	if (instance_exists(_player.hp)) {
		var _hp_cont = _player.hp // hp controller of player
		_bar_w = max(_bar_w, _weap_w) // hp bar has minimal length of 100 but stretches further of weapon hud is longer
		
		_xp += 4 // half of icon spr width
		draw_sprite(spr_hud_icon_hp, 0, _xp, _yp)
		_xp += 4 + cont_margin
		
		var _bar_h = 4 // height of outer border lines
		draw_set_colour(#555555) // background color
		draw_line(_xp, _yp - _bar_h/2-1, _xp, _yp + _bar_h/2-1) // draw background border lines of hp
		draw_line(_xp + _bar_w, _yp - _bar_h/2-1, _xp + _bar_w, _yp + _bar_h/2-1)
		draw_line(_xp, _yp, _xp + _bar_w, _yp) // horizontal line
		draw_line(_xp, _yp-1, _xp + _bar_w, _yp-1)
		
		draw_set_colour(c_red)
		if (_hp_cont.hp > 0) {
			draw_line(_xp, _yp - _bar_h/2-1, _xp, _yp + _bar_h/2-1) // left red border line
			
			var _hp_w = (_hp_cont.hp / _hp_cont.hp_max) * _bar_w // width of hp spanned over bar width
			draw_line(_xp + _hp_w, _yp - _bar_h/2-1, _xp + _hp_w, _yp + _bar_h/2-1) // right red border line
			var _hp_h_inner = 2 // inner height of hp bar
			draw_rectangle(_xp, _yp - _hp_h_inner/2, _xp + _hp_w, _yp + _hp_h_inner/2-1, false) // draw inner bar
		}
	}
	
	// Resize window width to fit contents snug
	new_width = (_xp - x) + _bar_w + cont_margin // set new width
	if (new_width != width) {
		width = new_width
		update_vertices()
	}
}