/// @param window
function ui_window_draw() {

	var window = argument[0];

	if (window.header) {
		//Body background
		draw_set_color(window.backg_colour)
		draw_set_alpha(window.backg_alpha)

		draw_primitive_begin(pr_trianglelist)
		draw_vertex(window.left, window.top)
		draw_vertex(window.left, window.top + window.height - window.corner_size-1)
		draw_vertex(window.left + window.width, window.top)

		draw_vertex(window.left + window.width, window.top)
		draw_vertex(window.left, window.top + window.height - window.corner_size-1)
		draw_vertex(window.left + window.corner_size, window.top + window.height-1)
	
		draw_vertex(window.left + window.width, window.top)
		draw_vertex(window.left + window.corner_size, window.top + window.height-1)
		draw_vertex(window.left + window.width, window.top + window.height-1)

		draw_primitive_end()

		draw_set_alpha(1)
	
		//Body border
		draw_set_color(window.backg_colour)
		draw_set_alpha(1)

		draw_primitive_begin(pr_linestrip)
		draw_vertex(window.left+1, window.top + window.header_height)
		draw_vertex(window.left+1, window.top + window.height - window.corner_size)
		draw_vertex(window.left+1 + window.corner_size, window.top + window.height)
		draw_vertex(window.left + window.width, window.top + window.height)
		draw_vertex(window.left + window.width, window.top + window.header_height)
		draw_vertex(window.left, window.top + window.header_height)
		draw_primitive_end()

		draw_set_alpha(1)
	
		//Window header
		draw_set_color(window.header_backg_colour)
		draw_primitive_begin(pr_trianglelist)
		draw_vertex(window.left, window.top)
		draw_vertex(window.left + window.width, window.top)
		draw_vertex(window.left + window.width, window.top + window.header_height)
	
		draw_vertex(window.left + window.width, window.top + window.header_height)
		draw_vertex(window.left, window.top + window.header_height)
		draw_vertex(window.left, window.top)
		draw_primitive_end()
	
		draw_set_color(c_black)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(window.left, window.top)
		draw_vertex(window.left + window.width, window.top)
		draw_vertex(window.left + window.width, window.top + window.header_height)
		draw_vertex(window.left + 1, window.top + window.header_height)
		draw_vertex(window.left + 1, window.top)
		draw_primitive_end()
	
		draw_set_color(c_gray)
		draw_primitive_begin(pr_linestrip)
		draw_vertex(window.left+1, window.top+1)
		draw_vertex(window.left + window.width-1, window.top+1)
		draw_vertex(window.left + window.width-1, window.top + window.header_height-1)
		draw_vertex(window.left+2, window.top + window.header_height-1)
		draw_vertex(window.left+2, window.top+1)
		draw_primitive_end()
	
		//window.header title
		draw_set_font(window.header_font)
		draw_set_colour(window.header_text_colour)
		draw_set_halign(fa_left)
		draw_text(window.left + 8, window.top + window.header_height/2, window.title)
	} else {
		//Body background
		draw_set_color(window.backg_colour)
		draw_set_alpha(window.backg_alpha)

		draw_primitive_begin(pr_trianglelist)
		draw_vertex(window.left, window.top)
		draw_vertex(window.left, window.top + window.height - window.corner_size-1)
		draw_vertex(window.left + window.width - window.corner_size, window.top)

		draw_vertex(window.left + window.width - window.corner_size, window.top)
		draw_vertex(window.left, window.top + window.height - window.corner_size-1)
		draw_vertex(window.left + window.corner_size, window.top + window.height-1)

		draw_vertex(window.left + window.corner_size, window.top + window.height-1)
		draw_vertex(window.left + window.width, window.top + window.corner_size-1)
		draw_vertex(window.left + window.width - window.corner_size, window.top)

		draw_vertex(window.left + window.width, window.top + window.height-1)
		draw_vertex(window.left + window.corner_size, window.top + window.height-1)
		draw_vertex(window.left + window.width, window.top + window.corner_size-1)

		draw_primitive_end()

		draw_set_alpha(1)
	
		//Body border
		draw_set_color(window.backg_colour)
		draw_set_alpha(1)

		draw_primitive_begin(pr_linestrip)
		draw_vertex(window.left+1, window.top)
		draw_vertex(window.left+1, window.top + window.height - window.corner_size)
		draw_vertex(window.left+1 + window.corner_size, window.top + window.height)
		draw_vertex(window.left + window.width, window.top + window.height)
		draw_vertex(window.left + window.width, window.top + window.corner_size)
		draw_vertex(window.left + window.width - window.corner_size, window.top)
		draw_vertex(window.left, window.top)
		draw_primitive_end()
	
		if (window.has_title) {
			//Header separation line
			draw_set_color(window.backg_colour)
			draw_set_alpha(1)
	
			draw_line(window.left + 10, window.top + window.corner_size, window.left + window.width - 10, window.top + window.corner_size)

			//Header title
			draw_set_alpha(1)
			draw_set_font(ft_menu_title)
			draw_set_halign(fa_left)
			draw_set_colour(window.header_text_colour)
	
			//draw_text_outlined(window.left + window.corner_size/2, window.top + window.corner_size/2, window.title, window.header_text_colour, c_black)
			draw_text_bolded(window.left + window.corner_size/2, window.top + window.corner_size/2, window.title)
		}
	}

	//Draw elements
	for (var i = 0; i < ds_list_size(window.elements); i++) {
		var element = window.elements[| i];
		var coord = ds_map_exists(window.element_positions, element) ? window.element_positions[? element] : array_create(2, 0);
		element.left = window.left + coord[0]
		element.top = window.top + coord[1]
	
		if (element != window.subfocus_element) {
			ui_window_draw_element(element)
		}
	}

	if (window.subfocus_element != -1) {
		ui_window_draw_element(window.subfocus_element)
	}

	draw_set_color(c_white)


}
