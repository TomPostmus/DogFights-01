menu = undefined // current menu we're at, navigation happens by going to child or back (to parent)

// Initialize menu tree at main menu
menu = create_ui(0, 0, obj_ui_menu_main)
menu.wake_up() 

/// @function new_root(_root_menu)
/// @description Close menus and start from a new root
/// @context obj_ui_menu_tree
notify_on_new_root = function(_root_menu_index) {
	if (!object_is_class(_root_menu_index, obj_ui_menu))
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
notify_on_step_in = function(_child_menu_index) {
	if (!menu)
		show_error("Can not step into new menu: there is no current menu.", true)
	if (!object_is_class(_child_menu_index, obj_ui_menu))
		show_error("Cannot create menu instance of object that is not a child of obj_ui_menu.", true)
	
	var _child;
	if (!ds_map_exists(menu.children, _child_menu_index)) {
		_child = create_ui(0, 0, _child_menu_index)
		_child.parent = menu // remember parent
	} else {
		_child = menu.children[?_child_menu_index]
	}
	
	menu.sleep()
	menu = _child // step to child
	menu.wake_up()
	
}

/// @function go_back()
/// @description Go back to parent menu
/// @context obj_ui_menu_tree
notify_on_go_back = function() {
	if (!menu)
		show_error("Can not go back to parent menu: there is no current menu.", true)
		
	if (menu.parent) {
		menu.sleep()
		menu = menu.parent // step back to parent
		menu.wake_up()
	}
	
}
