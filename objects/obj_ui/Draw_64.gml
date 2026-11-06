draw_surface(application_surface, 0, 0)

// Draw current menu from menu tree
with (obj_ui_menu_tree) {
	
	if (menu)
		menu.draw()
	
}