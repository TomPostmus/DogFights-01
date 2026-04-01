/// @param button
function ui_button_draw() {
	var button = argument[0];
	var border_colour, backg_colour, text_colour, secborder_colour;

	var x1 = button.left, y1 = button.top, x2 = button.left + button.width, y2 = button.top + button.height;

	//States
	if (!button.active) {
		backg_colour = button.colour_inactive
		border_colour = button.border_inactive_colour
		text_colour = button.text_inactive_colour
		secborder_colour = button.secborder_inactive_colour
	} else if (button.click) {
		backg_colour = button.colour_click
		border_colour = button.border_click_colour
		text_colour = button.text_click_colour
		secborder_colour = button.secborder_click_colour
	} else if (button.hover) {
		backg_colour = button.colour_hover
		border_colour = button.border_hover_colour
		text_colour = button.text_hover_colour
		secborder_colour = button.secborder_hover_colour
	} else {
		backg_colour = button.colour
		border_colour = button.border_colour
		text_colour = button.text_colour
		secborder_colour = button.secborder_colour
	}

	//Draw
	if (button.shape =="rectangle") {
		draw_set_alpha(button.alpha)
		draw_set_colour(backg_colour)
		draw_rectangle(x1, y1, x2, y2, false)
		draw_set_alpha(button.border_alpha)
		draw_set_colour(border_colour)
		draw_rectangle(x1, y1, x2, y2, true)
		draw_set_alpha(button.secborder_alpha)
		draw_set_colour(secborder_colour)
		draw_rectangle(x1+1, y1+1, x2-1, y2-1, true)
	} else if (button.shape = "one_corner") {
		draw_set_alpha(button.alpha)
		draw_set_colour(backg_colour)
		draw_primitive_begin(pr_trianglelist)
		draw_vertex(x1, y1)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
	
		draw_vertex(x1, y1)
		draw_vertex(x1, y2 - button.corner_size)
		draw_vertex(x2, y2)
	
		draw_vertex(x1, y2 - button.corner_size)
		draw_vertex(x1 + button.corner_size, y2)
		draw_vertex(x2, y2)
		draw_primitive_end()
	
		draw_set_colour(border_colour)
		draw_set_alpha(button.border_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1-1, y1)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
		draw_vertex(x1 + button.corner_size, y2)
		draw_vertex(x1, y2 - button.corner_size)
		draw_vertex(x1, y1)
		draw_primitive_end()
	
		draw_set_colour(secborder_colour)
		draw_set_alpha(button.secborder_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1+1, y1+1)
		draw_vertex(x2-1, y1+1)
		draw_vertex(x2-1, y2-1)
		draw_vertex(x1 + button.corner_size, y2-1)
		draw_vertex(x1+1, y2 - button.corner_size)
		draw_vertex(x1+1, y1)
		draw_primitive_end()
	} else if (button.shape = "one_corner_topleft") {
		draw_set_alpha(button.alpha)
		draw_set_colour(backg_colour)
		draw_primitive_begin(pr_trianglelist)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
		draw_vertex(x1, y2)
	
		draw_vertex(x2, y1)
		draw_vertex(x1 + button.corner_size, y1)
		draw_vertex(x1, y2)
	
		draw_vertex(x1 + button.corner_size, y1)
		draw_vertex(x1, y1 + button.corner_size)
		draw_vertex(x1, y2)
		draw_primitive_end()
	
		draw_set_colour(border_colour)
		draw_set_alpha(button.border_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1 + button.corner_size, y1)
		draw_vertex(x2, y1)
		draw_vertex(x2, y2)
		draw_vertex(x1, y2)
		draw_vertex(x1, y1 + button.corner_size)
		draw_vertex(x1 + button.corner_size, y1)
		draw_primitive_end()
	
		draw_set_colour(secborder_colour)
		draw_set_alpha(button.secborder_alpha)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x1+1 + button.corner_size, y1+1)
		draw_vertex(x2-1, y1+1)
		draw_vertex(x2-1, y2-1)
		draw_vertex(x1+1, y2-1)
		draw_vertex(x1+1, y1+1 + button.corner_size)
		draw_vertex(x1+1 + button.corner_size, y1+1)
		draw_primitive_end()
	} else if (button.shape = "triangle_up") {
		draw_set_alpha(button.alpha)
		draw_set_colour(backg_colour)
		draw_triangle(button.left, button.top + button.height, button.left + button.width, button.top + button.height, button.left + button.width/2, button.top, false)
		draw_set_alpha(button.secborder_alpha)
		draw_set_colour(secborder_colour)
		draw_triangle(button.left+1, button.top + button.height-1, button.left + button.width-1, button.top + button.height-1, button.left + button.width/2, button.top+1, true)
		draw_set_alpha(button.border_alpha)
		draw_set_colour(border_colour)
		draw_triangle(button.left, button.top + button.height, button.left + button.width, button.top + button.height, button.left + button.width/2, button.top, true)
	} else if (button.shape = "triangle_down") {
		draw_set_alpha(button.alpha)
		draw_set_colour(backg_colour)
		draw_triangle(button.left, button.top, button.left + button.width, button.top, button.left + button.width/2, button.top + button.height, false)
		draw_set_alpha(button.secborder_alpha)
		draw_set_colour(secborder_colour)
		draw_triangle(button.left+1, button.top+1, button.left + button.width-1, button.top+1, button.left + button.width/2, button.top + button.height-1, true)
		draw_set_alpha(button.border_alpha)
		draw_set_colour(border_colour)
		draw_triangle(button.left, button.top, button.left + button.width, button.top, button.left + button.width/2, button.top + button.height, true)
	}

	if (!button.active) {
		shader_set(sh_black_and_white)
	}

	draw_set_font(button.text_font)
	draw_set_alpha(button.text_alpha)
	if (button.icon == -1) {
		draw_set_colour(text_colour)
		draw_set_halign(fa_center)
		draw_text(ceil(x1 + button.width/2 + button.text_h_offset), ceil(y1 + button.height/2 + button.text_v_offset), button.text)
	} else if (button.text != "" && sprite_exists(button.icon)) {
		draw_set_colour(text_colour)
		draw_set_halign(fa_left)
		draw_text(ceil(x1 + button.height/2 + button.text_h_offset), ceil(y1 + button.height/2 + button.text_v_offset), button.text)
		draw_sprite(button.icon, 0, ceil(x2 - button.height/2), ceil(y1 + button.height/2 + button.text_v_offset))
	} else if (sprite_exists(button.icon)) {
		draw_sprite(button.icon, 0, ceil(x1 + button.width/2), ceil(y1 + button.height/2 + button.text_v_offset))
	}

	shader_reset()

	draw_set_alpha(1)
	draw_set_colour(c_white)


}
