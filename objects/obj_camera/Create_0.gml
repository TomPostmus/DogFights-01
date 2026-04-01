// obj_camera: Defines vision location. Handles camera movement and logic.

// Camera parameters
move_speed = 0.25
zoom_speed = 0.25

// Camera state
zoom = 1
// x, y (default)

function set_target(_x, _y, _zoom) {
	x += (_x - x) * move_speed
	y += (_y - y) * move_speed
	zoom += (_zoom - zoom) * zoom_speed
}

// Getters
function get_width() {return global.viewport_w/zoom} // getters for width and height in ground pixels
function get_height() {return global.viewport_h/zoom}

// Helper functions
function get_players_in_view() {
	//TODO implement
}