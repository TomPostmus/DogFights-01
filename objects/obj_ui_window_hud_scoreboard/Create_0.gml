/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

backg_colour = c_gray
backg_alpha = 1
border_colour = c_black

dragable = false // stationary window
header = false // no title and exit button
has_title = false

font = ft_normal
text_colour = c_white

// Set shape
width = 250
height = 40
corner_size = 10
lb_corn_snip = false
rt_corn_snip = false
update_vertices()

new_height = height // new width variable to know when to resize window
cont_margin = 10 // inner margin of contents

// Override draw method
super_draw = draw // save draw method from parent
draw = function(_game) {
	super_draw()
	
	draw_set_font(font)
	draw_set_colour(text_colour)
	
	new_height = _game.draw_hud(id) // draw contents of game state and get height of contents
	
	// Resize window width to fit contents snug
	if (new_height != height) {
		height = new_height
		update_vertices()
	}
	
}