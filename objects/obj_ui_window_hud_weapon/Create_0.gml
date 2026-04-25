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

// Override draw method
super_draw = draw // save draw method from parent
draw = function(_player) {
	super_draw()
	
	draw_set_font(font)
	draw_set_colour(text_colour)
	
	// Draw weapon bullets
	var _weapon = _player.weapon
	if (instance_exists(_weapon)) {
		var _weap_w = _weapon.draw_hud(id) // draw weapon element in window and return the width of the drawn contents
	
		// Set new width
		new_width = _weap_w + 10
	}
	
	// Resize window width to fit contents snug
	if (new_width != width) {
		width = new_width
		update_vertices()
	}
}