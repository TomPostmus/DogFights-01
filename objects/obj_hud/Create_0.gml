/// @description This object handles logic and drawing of the Heads Up Display (HUD)

// Draw the HUD
function draw() {
	
}

function draw_weapon_hud() {
	for (var i = 0; i < ds_list_size(global.active_viewports); i ++) {
		var _vp = global.active_viewports[|i] // get active viewport
		var _cam = global.viewport_to_camera[?_vp] // get associated camera
	}
}

// Draw top scoreboard
function draw_tdm_scoreboard() {
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
}