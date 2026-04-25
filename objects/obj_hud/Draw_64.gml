// Draw to HUD surface
if (!surface_exists(hud_surf))
	hud_surf = surface_create(hud_width, hud_height) // recreate if doesn't exist

surface_set_target(hud_surf)
draw_clear_alpha(c_white, 0)
for (var i = 0; i < ds_list_size(obj_lobby.players_active); i ++) { // draw weapon hud windows 
	var _player = obj_lobby.players_active[|i]
	weapon_huds[|i].draw(_player)
}
surface_reset_target()

// Draw HUD surface
draw_surface_ext(hud_surf, 0, 0, hud_scale, hud_scale, 0, c_white, 1) // draw scaled to stretch it to GUI size