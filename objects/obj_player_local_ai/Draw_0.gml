event_inherited();

if (global.debug && path != undefined && path_exists(path)) {
	draw_set_colour(c_purple)
	draw_path(path, 0, 0, true)
	draw_set_colour(c_lime)
	draw_circle(path_get_x(path, path_point), path_get_y(path, path_point), 3, true)
}

if (global.debug && instance_exists(dog) && instance_exists(target)) {
	draw_set_colour(c_red)
	draw_line(dog.x, dog.y, target.x, target.y)
}