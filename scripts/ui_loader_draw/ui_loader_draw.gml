/// @param loader
function ui_loader_draw() {

	var loader = argument[0];

	with (loader) {
		draw_sprite_ext(icon, index, left, top, 1, 1, spin_angle, colour, 1)
	}


}
