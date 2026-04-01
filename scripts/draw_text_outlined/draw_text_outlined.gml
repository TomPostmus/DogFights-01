/// @param x
/// @param y
/// @param text
/// @param text_colour
/// @param outline_colour
function draw_text_outlined() {

	var x1 = argument[0];
	var y1 = argument[1];
	var text = argument[2];
	var text_colour = argument[3];
	var outline_colour = argument[4];

	draw_set_colour(outline_colour)
	draw_text(x1-1, y1-0, text)
	draw_text(x1-1, y1-1, text)
	draw_text(x1-1, y1+1, text)
	draw_text(x1+0, y1-1, text)
	draw_text(x1+0, y1+1, text)
	draw_text(x1+1, y1-0, text)
	draw_text(x1+1, y1-1, text)
	draw_text(x1+1, y1+1, text)

	draw_set_colour(text_colour)
	draw_text(x1, y1, text)


}
