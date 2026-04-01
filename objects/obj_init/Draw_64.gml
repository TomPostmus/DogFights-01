draw_surface(application_surface, 0, 0)
ui_draw()
draw_text(20, 20, fps)

/*with (obj_player) {
	if instance_exists(camera) {
		for (var i = 0; i < ds_list_size(global.active_viewports); i ++) {
			var viewport = global.active_viewports[|i];
			if (camera == global.viewport_to_camera[?viewport]) {
				if (instance_exists(dog)) {
					draw_set_color(c_red)
					draw_set_halign(fa_right)
					draw_text(view_get_xport(viewport) / display_get_width() * display_get_gui_width() + view_get_wport(viewport) / display_get_width() * display_get_gui_width() - 20, view_get_yport(viewport) / display_get_height() * display_get_gui_height() + 20, hp)
					if (instance_exists(dog.weapon)) {
						draw_set_color(c_blue)
						draw_text(view_get_xport(viewport) / display_get_width() * display_get_gui_width() + view_get_wport(viewport) / display_get_width() * display_get_gui_width() - 80, view_get_yport(viewport) / display_get_height() * display_get_gui_height() + 20, dog.weapon.ammo_mag)
					}
					draw_set_halign(fa_left)
				}
			}
		}
	}
}*/