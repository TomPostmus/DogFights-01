// Demo buttons clicked events
for (var i = 0; i < ds_list_size(demo_buttons); i ++) {
	if (demo_buttons[|i].clicked) {
		demos[|i].start() // start ith demo
		obj_ui_menu_tree.new_root(obj_ui_menu_ingame) // initialize new root of menu tree, as in-game 'menu'
		break
	}
}