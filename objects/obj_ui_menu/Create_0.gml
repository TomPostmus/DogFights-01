parent = undefined // parent menu which it can go back to
children = ds_map_create() // map from object_index of a obj_menu to the instance created of that object
windows = ds_list_create()

/// @function draw()
/// @description Draw this menu
function draw() {
	for (var i = 0; i < ds_list_size(windows); i ++)
		windows[|i].draw()
}

/// @function wake_up()
/// @description Wake up this menu, i.e. activate its main window
function wake_up() {
	if (ds_list_size(windows) > 0)
		obj_ui.set_active_window(windows[|0])
}