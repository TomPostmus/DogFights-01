/// @description This object handles logic and drawing of the Heads Up Display (HUD)

hud_scale = 2 // integer factor by how much to scale HUD
hud_width = display_get_gui_width() / hud_scale // hud surface is GUI size divided by scale
hud_height = display_get_gui_height() / hud_scale
hud_surf = surface_create(hud_width, hud_height)

// Create weapon hud window objects
weapon_huds = ds_list_create() // list of weapon hud elements for each active player
for (var i = 0; i < ds_list_size(obj_lobby.players_active); i ++) {
	var _vp = global.active_viewports[|i]
	var _vp_pos = [view_get_xport(_vp) / hud_scale, view_get_yport(_vp) / hud_scale] // position of vport in GUI crds
	var _vp_dim = [view_get_wport(_vp) / hud_scale, view_get_hport(_vp) / hud_scale] // dimensions of vport in GUI crds
	
	var _w_hud = create_hud(0, 0, obj_ui_window_hud_weapon) // create weapon hud element
	_w_hud.x = _vp_pos[0] + 10 // set position of window
	_w_hud.y = _vp_pos[1] + _vp_dim[1] - _w_hud.height - 10
	ds_list_add(weapon_huds, _w_hud) // add to list
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