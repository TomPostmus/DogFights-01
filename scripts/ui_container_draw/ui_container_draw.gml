/// @param container
function ui_container_draw() {

	var container = argument[0];

	with (container) {
		if (shape = "two_corners") {
			//Body background
			draw_set_color(backg_colour)
			draw_set_alpha(backg_alpha)

			draw_primitive_begin(pr_trianglelist)
			draw_vertex(left, top+1)
			draw_vertex(left, top + height - corner_size)
			draw_vertex(left + width - corner_size, top+1)

			draw_vertex(left + width - corner_size, top+1)
			draw_vertex(left, top + height - corner_size)
			draw_vertex(left + corner_size, top + height)

			draw_vertex(left + corner_size, top + height)
			draw_vertex(left + width, top + corner_size+1)
			draw_vertex(left + width - corner_size, top+1)

			draw_vertex(left + width, top + height)
			draw_vertex(left + corner_size, top + height)
			draw_vertex(left + width, top + corner_size+1)

			draw_primitive_end()
	
			//Body border
			if (border) {
				draw_set_color(border_colour)
				draw_set_alpha(1)

				draw_primitive_begin(pr_linestrip)
				draw_vertex(left+1, top+1)
				draw_vertex(left+1, top + height - corner_size)
				draw_vertex(left+1 + corner_size, top + height)
				draw_vertex(left + width, top + height)
				draw_vertex(left + width, top + corner_size+1)
				draw_vertex(left + width - corner_size, top+1)
				draw_vertex(left, top+1)
				draw_primitive_end()
			}
		} else if (shape == "one_corner") {
			//Body background
			draw_set_color(backg_colour)
			draw_set_alpha(backg_alpha)

			draw_primitive_begin(pr_trianglelist)
			draw_vertex(left, top+1)
			draw_vertex(left + width, top+1)
			draw_vertex(left + width, top + height)
		
			draw_vertex(left, top+1)
			draw_vertex(left, top + height - corner_size)
			draw_vertex(left + width, top + height)
		
			draw_vertex(left, top + height - corner_size)
			draw_vertex(left + corner_size, top + height)
			draw_vertex(left + width, top + height)

			draw_primitive_end()
	
			//Body border
			if (border) {
				draw_set_color(border_colour)
				draw_set_alpha(1)

				draw_primitive_begin(pr_linestrip)
				draw_vertex(left+1, top+1)
				draw_vertex(left+1, top + height - corner_size)
				draw_vertex(left+1 + corner_size, top + height)
				draw_vertex(left + width, top + height)
				draw_vertex(left + width, top+1)
				draw_vertex(left, top+1)
				draw_primitive_end()
			}
		} else if (shape = "rectangle") {
			//Body background
			draw_set_color(backg_colour)
			draw_set_alpha(backg_alpha)
			draw_rectangle(left, top, left + width, top + height, false)
		
			if (border) {
				draw_set_color(border_colour)
				draw_set_alpha(1)
				draw_rectangle(left, top, left + width, top + height, true)
			}
		}
	}


}
