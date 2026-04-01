/// @param mapcard
function ui_mapcard_draw() {

	var mapcard = argument[0];
	var border_colour, header_outline = false;

	//States
	if (!mapcard.active) {
		border_colour = mapcard.border_inactive_colour
	} else if (mapcard.click) {
		border_colour = mapcard.border_click_colour
	} else if (mapcard.hover_body) {
		border_colour = mapcard.border_hover_colour
	} else if (mapcard.hover_header) {
		border_colour = mapcard.border_colour
		header_outline = true
	} else {
		border_colour = mapcard.border_colour
	}

	//Map sprite
	if (mapcard.map_sprite != -1) {
		draw_sprite_part(mapcard.map_sprite, 0, 0, 0, mapcard.width, mapcard.height, mapcard.left, mapcard.top)
	}

	//Mapcard header
	draw_set_color(mapcard.header_backg_colour)
	draw_set_alpha(mapcard.header_backg_alpha)

	draw_rectangle(mapcard.left, mapcard.top, mapcard.left + mapcard.width-1, mapcard.top + mapcard.header_height, false)

	draw_set_alpha(1)

	if (header_outline) {
		draw_set_colour(mapcard.border_hover_colour)
		draw_rectangle(mapcard.left+1, mapcard.top, mapcard.left + mapcard.width - mapcard.exit_button.width-1, mapcard.top + mapcard.header_height, true)
	}
	
	//Body border
	draw_set_color(border_colour)
	draw_set_alpha(mapcard.border_alpha)

	draw_primitive_begin(pr_linestrip)
	draw_vertex(mapcard.left+1, mapcard.top)
	draw_vertex(mapcard.left+1, mapcard.top + mapcard.height - mapcard.corner_size)
	draw_vertex(mapcard.left+1 + mapcard.corner_size, mapcard.top + mapcard.height-(mapcard.hover_body ? 1 : 0))
	draw_vertex(mapcard.left + mapcard.width, mapcard.top + mapcard.height-(mapcard.hover_body ? 1 : 0))
	draw_vertex(mapcard.left + mapcard.width, mapcard.top)
	draw_vertex(mapcard.left, mapcard.top)
	draw_primitive_end()

	draw_set_alpha(1)

	/*draw_primitive_begin(pr_trianglelist)
	draw_vertex(mapcard.left, mapcard.top)
	draw_vertex(mapcard.left + mapcard.width, mapcard.top)
	draw_vertex(mapcard.left + mapcard.width, mapcard.top + mapcard.header_height)
	
	draw_vertex(mapcard.left + mapcard.width, mapcard.top + mapcard.header_height)
	draw_vertex(mapcard.left, mapcard.top + mapcard.header_height)
	draw_vertex(mapcard.left, mapcard.top)
	draw_primitive_end()
	
	draw_set_color(c_black)
	draw_primitive_begin(pr_linestrip)
	draw_vertex(mapcard.left, mapcard.top)
	draw_vertex(mapcard.left + mapcard.width, mapcard.top)
	draw_vertex(mapcard.left + mapcard.width, mapcard.top + mapcard.header_height)
	draw_vertex(mapcard.left + 1, mapcard.top + mapcard.header_height)
	draw_vertex(mapcard.left + 1, mapcard.top)
	draw_primitive_end()
	
	draw_set_color(c_gray)
	draw_primitive_begin(pr_linestrip)
	draw_vertex(mapcard.left+1, mapcard.top+1)
	draw_vertex(mapcard.left + mapcard.width-1, mapcard.top+1)
	draw_vertex(mapcard.left + mapcard.width-1, mapcard.top + mapcard.header_height-1)
	draw_vertex(mapcard.left+2, mapcard.top + mapcard.header_height-1)
	draw_vertex(mapcard.left+2, mapcard.top+1)
	draw_primitive_end()*/
	
	//Mapcard header title
	draw_set_font(mapcard.header_font)
	draw_set_colour(mapcard.header_text_colour)
	draw_set_halign(fa_left)
	draw_text(mapcard.left + 8, mapcard.top + mapcard.header_height/2,mapcard.map_index + mapcard.map_name)

	//Exit button
	mapcard.exit_button.left = mapcard.left-1 + mapcard.width-mapcard.exit_button.width
	mapcard.exit_button.top = mapcard.top-1

	ui_button_draw(mapcard.exit_button)


}
