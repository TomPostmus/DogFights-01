/// @param linesmooth
function ui_line_draw() {

	var line = argument[0]
	var colour = line.colour;
	var line_end_width = line.end_length;
	var x1 = line.left, y1 = line.top, x2 = line.left + line.end_x, y2 = line.top + line.end_y;

	draw_set_colour(colour)
	draw_set_alpha(line.alpha)

	//Draw line
	var dir = point_direction(x1, y1, x2, y2);
	draw_line(x1 + lengthdir_x(line_end_width, dir), y1 + lengthdir_y(line_end_width, dir),
			  x2 + lengthdir_x(line_end_width, dir+180), y2 + lengthdir_y(line_end_width, dir+180))

	//Draw ends
	if (sprite_exists(line.end_sprite)) {
		draw_sprite_ext(line.end_sprite, 0, x1 + 1 + lengthdir_x(line_end_width, dir), y1 + 1 + lengthdir_y(line_end_width, dir), 1, 1, dir+180, colour, 1)
		draw_sprite_ext(line.end_sprite, 0, x2 + lengthdir_x(line_end_width, dir+180), y2 + lengthdir_y(line_end_width, dir+180), 1, 1, dir, colour, 1)
	}

	draw_set_colour(c_white)
	draw_set_alpha(1)


}
