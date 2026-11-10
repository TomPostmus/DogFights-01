shape = "rectangle"
corner_size = 0

width = 100
height = 20

active = true
subfocus = true
hover = false
click = false
clicked = false

clicked_callback = undefined

border_alpha = 1
alpha = 1
secborder_alpha = 1
text_alpha = 1

border_colour = c_black
border_hover_colour = c_black
border_click_colour = c_black
border_inactive_colour = c_dkgray

secborder_colour = c_gray
secborder_hover_colour = c_ltgray
secborder_click_colour = c_aqua
secborder_inactive_colour = c_gray

colour = c_ltgray
colour_hover = c_white
colour_click = c_gray
colour_inactive = c_gray

text = ""
text_font = ft_normal
text_h_offset = 0
text_v_offset = 0
text_colour = c_black
text_hover_colour = c_black
text_click_colour = c_black
text_inactive_colour = c_black

icon = -1

/// @function draw()
/// @description Draw the button
/// @context obj_ui_button
draw = function() {
	
	var _border_colour, _backg_colour, _text_colour, _secborder_colour;

	var x1 = x, y1 = y, x2 = x + width, y2 = y + height;

	//States
	if (!active) {
		_backg_colour = colour_inactive
		_border_colour = border_inactive_colour
		_text_colour = text_inactive_colour
		_secborder_colour = secborder_inactive_colour
	} else if (click) {
		_backg_colour = colour_click
		_border_colour = border_click_colour
		_text_colour = text_click_colour
		_secborder_colour = secborder_click_colour
	} else if (hover) {
		_backg_colour = colour_hover
		_border_colour = border_hover_colour
		_text_colour = text_hover_colour
		_secborder_colour = secborder_hover_colour
	} else {
		_backg_colour = colour
		_border_colour = border_colour
		_text_colour = text_colour
		_secborder_colour = secborder_colour
	}

	//Draw
	if (shape =="rectangle") {
		draw_set_alpha(alpha)
		draw_set_colour(_backg_colour)
		draw_rectangle(x1, y1, x2, y2, false)
		draw_set_alpha(border_alpha)
		draw_set_colour(_border_colour)
		draw_rectangle(x1, y1, x2, y2, true)
		draw_set_alpha(secborder_alpha)
		draw_set_colour(_secborder_colour)
		draw_rectangle(x1+1, y1+1, x2-1, y2-1, true)
	} else if (shape = "one_corner") {
		draw_set_alpha(alpha)
		draw_set_colour(_backg_colour)
		draw_primitive_begin(pr_trianglelist)
		draw_vertex(x1, y1)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
	
		draw_vertex(x1, y1)
		draw_vertex(x1, y2 - corner_size)
		draw_vertex(x2, y2)
	
		draw_vertex(x1, y2 - corner_size)
		draw_vertex(x1 + corner_size, y2)
		draw_vertex(x2, y2)
		draw_primitive_end()
	
		draw_set_colour(_border_colour)
		draw_set_alpha(border_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1-1, y1)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
		draw_vertex(x1 + corner_size, y2)
		draw_vertex(x1, y2 - corner_size)
		draw_vertex(x1, y1)
		draw_primitive_end()
	
		draw_set_colour(_secborder_colour)
		draw_set_alpha(secborder_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1+1, y1+1)
		draw_vertex(x2-1, y1+1)
		draw_vertex(x2-1, y2-1)
		draw_vertex(x1 + corner_size, y2-1)
		draw_vertex(x1+1, y2 - corner_size)
		draw_vertex(x1+1, y1)
		draw_primitive_end()
	} else if (shape = "one_corner_topleft") {
		draw_set_alpha(alpha)
		draw_set_colour(_backg_colour)
		draw_primitive_begin(pr_trianglelist)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
		draw_vertex(x1, y2)
	
		draw_vertex(x2, y1)
		draw_vertex(x1 + corner_size, y1)
		draw_vertex(x1, y2)
	
		draw_vertex(x1 + corner_size, y1)
		draw_vertex(x1, y1 + corner_size)
		draw_vertex(x1, y2)
		draw_primitive_end()
	
		draw_set_colour(_border_colour)
		draw_set_alpha(border_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1 + corner_size, y1)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
		draw_vertex(x1, y2)
		draw_vertex(x1, y1 + corner_size)
		draw_vertex(x1 + corner_size, y1)
		draw_primitive_end()
	
		draw_set_colour(_secborder_colour)
		draw_set_alpha(secborder_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1+1 + corner_size, y1+1)
		draw_vertex(x2-1, y1+1)
		draw_vertex(x2-1, y2-1)
		draw_vertex(x1+1, y2-1)
		draw_vertex(x1+1, y1+1 + corner_size)
		draw_vertex(x1+1 + corner_size, y1+1)
		draw_primitive_end()
	} else if (shape = "triangle_up") {
		draw_set_alpha(alpha)
		draw_set_colour(_backg_colour)
		draw_triangle(x, y + height, x + width, y + height, x + width/2, y, false)
		draw_set_alpha(secborder_alpha)
		draw_set_colour(_secborder_colour)
		draw_triangle(x+1, y + height-1, x + width-1, y + height-1, x + width/2, y+1, true)
		draw_set_alpha(border_alpha)
		draw_set_colour(_border_colour)
		draw_triangle(x, y + height, x + width, y + height, x + width/2, y, true)
	} else if (shape = "triangle_down") {
		draw_set_alpha(alpha)
		draw_set_colour(_backg_colour)
		draw_triangle(x, y, x + width, y, x + width/2, y + height, false)
		draw_set_alpha(secborder_alpha)
		draw_set_colour(_secborder_colour)
		draw_triangle(x+1, y+1, x + width-1, y+1, x + width/2, y + height-1, true)
		draw_set_alpha(border_alpha)
		draw_set_colour(_border_colour)
		draw_triangle(x, y, x + width, y, x + width/2, y + height, true)
	}

	if (!active) {
		shader_set(sh_black_and_white)
	}

	draw_set_font(text_font)
	draw_set_alpha(text_alpha)
	draw_set_valign(fa_middle)
	if (icon == -1) {
		draw_set_colour(_text_colour)
		draw_set_halign(fa_center)
		draw_text(ceil(x1 + width/2 + text_h_offset), ceil(y1 + height/2 + text_v_offset), text)
		draw_set_halign(fa_left)
	} else if (text != "" && sprite_exists(icon)) {
		draw_set_colour(_text_colour)
		draw_text(ceil(x1 + height/2 + text_h_offset), ceil(y1 + height/2 + text_v_offset), text)
		draw_sprite(icon, 0, ceil(x2 - height/2), ceil(y1 + height/2 + text_v_offset))
	} else if (sprite_exists(icon)) {
		draw_sprite(icon, 0, ceil(x1 + width/2), ceil(y1 + height/2 + text_v_offset))
	}

	shader_reset()

	draw_set_alpha(1)
	draw_set_valign(fa_top)


}