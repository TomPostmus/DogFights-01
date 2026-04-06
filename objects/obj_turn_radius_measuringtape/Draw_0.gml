// Draw circles with increasing radius
// To test player's turn radius

var _margin = 130 // draw distance between circles
var _min_r = 45
var _max_r = 55

var i = 0
for (var r = _min_r; r < _max_r; r ++) {
	draw_set_colour(c_blue)
	draw_circle(x + _margin * i, y, r, true)
	draw_text(x + _margin * i, y, r)
	i++
}