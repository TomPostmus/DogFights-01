parent = undefined // parent menu which it can go back to
children = ds_map_create() // map from object_index of a obj_menu to the instance created of that object
windows = ds_list_create()

active = false // whether menu can be interacted with

/// @function draw()
/// @description Draw this menu
function draw() {
	for (var i = 0; i < ds_list_size(windows); i ++)
		windows[|i].draw()
}

/// @function wake_up()
/// @description Wake up this menu, i.e. activate its main window
function wake_up() {
	active = true
	if (ds_list_size(windows) > 0)
		obj_ui.set_active_window(windows[|0])
}

/// @description Make menu inactive
/// @context obj_ui_menu
sleep = function() {
	active = false
	// TODO: implement that windows become inactive
}

/// @description Notify menu tree to go back to parent
/// @context obj_ui_menu
go_back = function() {
	obj_ui_menu_tree.notify_on_go_back()
}

/// @description Notify menu tree to step into child menu
/// @context obj_ui_menu
step_in = function(_child_menu_index) {
	obj_ui_menu_tree.notify_on_step_in(_child_menu_index)
}

/// @description Notify menu tree to create a new root menu
/// @context obj_ui_menu
new_root = function(_root_menu_index) {
	obj_ui_menu_tree.notify_on_new_root(_root_menu_index)
}