menu = undefined // current menu we're at, navigation happens by going to child or back (to parent)

/// @function new_root(_root_menu)
/// @description Close menus and start from a new root
/// @context obj_ui_menu_tree
function new_root(_root_menu_index) {
	if (!object_is_ancestor(_root_menu_index, obj_ui_menu))
		show_error("Cannot create menu instance of object that is not a child of obj_ui_menu.", true)
		
	with (obj_ui_menu) // close current menus
		instance_destroy()

	menu = create_ui(0, 0, _root_menu_index)
	menu.wake_up()
}

/// @function step_in(child_menu_index)
/// @description Create child from current menu and step into that menu
/// @param {obj_index} child_menu_index The object index of the child menu to create
/// @context obj_ui_menu_tree
function step_in(_child_menu_index) {
	if (!menu)
		show_error("Can not step into new menu: there is no current menu.", true)
	if (!object_is_ancestor(_child_menu_index, obj_ui_menu))
		show_error("Cannot create menu instance of object that is not a child of obj_ui_menu.", true)
	
	menu.children[?_child_menu_index] ??= create_ui(0, 0, _child_menu_index) // initialize menu if not defined
	var _child = menu.children[?_child_menu_index]
	_child.parent = menu // remember parent
	
	menu = _child // step to child
	menu.wake_up()
}

/// @function go_back()
/// @description Go back to parent menu
/// @context obj_ui_menu_tree
function go_back() {
	if (!menu)
		show_error("Can not go back to parent menu: there is no current menu.", true)
		
	if (menu.parent) {
		menu = menu.parent // step back to parent
		menu.wake_up()
	}
}