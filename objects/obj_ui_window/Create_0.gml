active = false
click_outside = false

elements = ds_list_create() // sub elements of this window
element_positions = ds_map_create()

// Colours
backg_colour = WINDOW_GREEN_COLOUR
backg_alpha = WINDOW_ALPHA

// Title and header
title = "title"
has_title = true // whether has title
header = true // whether has header (y bar with exit button)
header_backg_colour = GREY
header_height = 20
header_font = ft_normal
header_text_colour = c_white

// Dragging functionality
dragable = true
dragging = false
drag_anchor_x = 0
drag_anchor_y = 0

// Focus
subfocus_element = -1

// Shape
width = 400
height = 300
lt_corn_snip = false // for each corner wether they are snipped of (diagonally)
rt_corn_snip = true
lb_corn_snip = true
rb_corn_snip = false
corner_size = 30 // size of the snipped part
vertices_border = undefined // list of tuples that are the vertices of the window border, defined in linestrip order
vertices_backg = undefined // list of tuples that are the vertices of the window background, defined in triangle list order

// Update vertices shape of window
function update_vertices() {
	vertices_border = ds_list_create()
	vertices_backg = ds_list_create()
	
	// Build border linestrip list
	if (lt_corn_snip) { // if left top corner snipped, add two points to create snip
		ds_list_add(vertices_border, [0, corner_size])
		ds_list_add(vertices_border, [corner_size, 0])
	} else ds_list_add(vertices_border, [0, 0]) // else add single point
	if (rt_corn_snip) { // go in clockwise order
		ds_list_add(vertices_border, [width - corner_size, 0])
		ds_list_add(vertices_border, [width, corner_size])
	} else ds_list_add(vertices_border, [width, 0])
	if (rb_corn_snip) {
		ds_list_add(vertices_border, [width, height - corner_size])
		ds_list_add(vertices_border, [width - corner_size, height])
	} else ds_list_add(vertices_border, [width, height])
	if (lb_corn_snip) {
		ds_list_add(vertices_border, [corner_size, height])
		ds_list_add(vertices_border, [0, height - corner_size])
	} else ds_list_add(vertices_border, [0, height])
	if (lt_corn_snip) ds_list_add(vertices_border, [0, corner_size-1]) // include start point to close off
	else ds_list_add(vertices_border, [0, -1])
	
	// Build background triangle list (the tricky one)
	// Drawing happens in three blocks main (center) and left and right block. Sizes depend on if relevant corners are snipped
	var _main_width = width - corner_size * (rt_corn_snip || rb_corn_snip) - corner_size * (lt_corn_snip || lb_corn_snip) // width of central main block
	var _main_x = corner_size * (lt_corn_snip || lb_corn_snip)
	ds_list_add(vertices_backg, [_main_x, 0]) // do main block
	ds_list_add(vertices_backg, [_main_x + _main_width, 0])
	ds_list_add(vertices_backg, [_main_x + _main_width, height])
	
	ds_list_add(vertices_backg, [_main_x, 0])
	ds_list_add(vertices_backg, [_main_x + _main_width, height])
	ds_list_add(vertices_backg, [_main_x, height])
	
	if (lt_corn_snip || lb_corn_snip) { // left block
		var _left_height = height - corner_size * (lt_corn_snip + lb_corn_snip) // height and y of left block
		var _left_y = corner_size * lt_corn_snip
	
		ds_list_add(vertices_backg, [0, _left_y]) // do left block
		ds_list_add(vertices_backg, [corner_size, _left_y])
		ds_list_add(vertices_backg, [corner_size, _left_y + _left_height])
	
		ds_list_add(vertices_backg, [0, _left_y])
		ds_list_add(vertices_backg, [corner_size, _left_y + _left_height])
		ds_list_add(vertices_backg, [0, _left_y + _left_height])
	}
	
	if (rt_corn_snip || rb_corn_snip) { // right block
		var _right_height = height - corner_size * (rt_corn_snip + rb_corn_snip) // height and y of right block
		var _right_y = corner_size * rt_corn_snip
	
		ds_list_add(vertices_backg, [width - corner_size, _right_y]) // do right block
		ds_list_add(vertices_backg, [width, _right_y])
		ds_list_add(vertices_backg, [width, _right_y + _right_height])
	
		ds_list_add(vertices_backg, [width - corner_size, _right_y])
		ds_list_add(vertices_backg, [width, _right_y + _right_height])
		ds_list_add(vertices_backg, [width - corner_size, _right_y + _right_height])
	}
	
	if (rt_corn_snip) { // build each corner
		ds_list_add(vertices_backg, [width - corner_size, 0])
		ds_list_add(vertices_backg, [width, corner_size])
		ds_list_add(vertices_backg, [width - corner_size, corner_size])
	}
	if (rb_corn_snip) {
		ds_list_add(vertices_backg, [width - corner_size, height - corner_size])
		ds_list_add(vertices_backg, [width, height - corner_size])
		ds_list_add(vertices_backg, [width - corner_size, height])
	}
	if (lb_corn_snip) {
		ds_list_add(vertices_backg, [0, height - corner_size])
		ds_list_add(vertices_backg, [corner_size, height - corner_size])
		ds_list_add(vertices_backg, [corner_size, height])
	}
	if (lt_corn_snip) {
		ds_list_add(vertices_backg, [corner_size, 0])
		ds_list_add(vertices_backg, [corner_size, corner_size])
		ds_list_add(vertices_backg, [0, corner_size])
	}
}

draw = function() {
	if (vertices_border == undefined || vertices_backg == undefined)
		show_error("Make sure to call update_vertices() on the UI window", true)
	
	if (header) {
		//Body background
		draw_set_color(backg_colour)
		draw_set_alpha(backg_alpha)

		draw_primitive_begin(pr_trianglelist)
		draw_vertex(x, y)
		draw_vertex(x, y + height - corner_size-1)
		draw_vertex(x + width, y)

		draw_vertex(x + width, y)
		draw_vertex(x, y + height - corner_size-1)
		draw_vertex(x + corner_size, y + height-1)
	
		draw_vertex(x + width, y)
		draw_vertex(x + corner_size, y + height-1)
		draw_vertex(x + width, y + height-1)

		draw_primitive_end()

		draw_set_alpha(1)
	
		//Body border
		draw_set_color(backg_colour)
		draw_set_alpha(1)

		draw_primitive_begin(pr_linestrip)
		draw_vertex(x+1, y + header_height)
		draw_vertex(x+1, y + height - corner_size)
		draw_vertex(x+1 + corner_size, y + height)
		draw_vertex(x + width, y + height)
		draw_vertex(x + width, y + header_height)
		draw_vertex(x, y + header_height)
		draw_primitive_end()

		draw_set_alpha(1)
	
		//Window header
		draw_set_color(header_backg_colour)
		draw_primitive_begin(pr_trianglelist)
		draw_vertex(x, y)
		draw_vertex(x + width, y)
		draw_vertex(x + width, y + header_height)
	
		draw_vertex(x + width, y + header_height)
		draw_vertex(x, y + header_height)
		draw_vertex(x, y)
		draw_primitive_end()
	
		draw_set_color(c_black)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x, y)
		draw_vertex(x + width, y)
		draw_vertex(x + width, y + header_height)
		draw_vertex(x + 1, y + header_height)
		draw_vertex(x + 1, y)
		draw_primitive_end()
	
		draw_set_color(c_gray)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(x+1, y+1)
		draw_vertex(x + width-1, y+1)
		draw_vertex(x + width-1, y + header_height-1)
		draw_vertex(x+2, y + header_height-1)
		draw_vertex(x+2, y+1)
		draw_primitive_end()
	
		//header title
		draw_set_font(header_font)
		draw_set_colour(header_text_colour)
		draw_set_halign(fa_x)
		draw_text(x + 8, y + header_height/2, title)
	} else {
		//Body background
		draw_set_color(backg_colour)
		draw_set_alpha(backg_alpha)
		draw_primitive_begin(pr_trianglelist)
		
		for (var i = 0; i < ds_list_size(vertices_backg); i ++) {
			var _vertex = vertices_backg[|i]
			draw_vertex(x + _vertex[0], y + _vertex[1])
		}

		draw_primitive_end()
		draw_set_alpha(1)
	
		//Body border
		draw_set_color(backg_colour)
		draw_set_alpha(1)
		draw_primitive_begin(pr_linestrip)
		
		for (var i = 0; i < ds_list_size(vertices_border); i ++) {
			var _vertex = vertices_border[|i]
			draw_vertex(x + _vertex[0], y + _vertex[1])
		}
		
		draw_primitive_end()
	
		if (has_title) {
			//Header separation line
			draw_set_color(backg_colour)
			draw_set_alpha(1)
	
			draw_line(x + 10, y + corner_size, x + width - 10, y + corner_size)

			//Header title
			draw_set_alpha(1)
			draw_set_font(ft_menu_title)
			draw_set_halign(fa_x)
			draw_set_colour(header_text_colour)
	
			//draw_text_outlined(x + corner_size/2, y + corner_size/2, title, header_text_colour, c_black)
			draw_text_bolded(x + corner_size/2, y + corner_size/2, title)
		}
	}

	//Draw elements
	for (var i = 0; i < ds_list_size(elements); i++) {
		var element = elements[| i];
		var coord = ds_map_exists(element_positions, element) ? element_positions[? element] : array_create(2, 0);
		element.x = x + coord[0]
		element.y = y + coord[1]
	
		if (element != subfocus_element) {
			ui_window_draw_element(element)
		}
	}

	if (subfocus_element != -1) {
		ui_window_draw_element(subfocus_element)
	}

	draw_set_color(c_white)


}
