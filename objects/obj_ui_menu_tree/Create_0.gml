menu = undefined // current menu we're at, navigation happens by going to child or back (to parent)

/// @function step_in(child_menu_index)
/// @description Create child from current menu and step into that menu
/// @param {obj_index} child_menu_index The object index of the child menu to create
function step_in(_child_menu_index) {
	if (!menu)
		show_error("Can not step into new menu: there is no current menu.", true)
	
	menu.children[?_child_menu_index] ??= create_ui(0, 0, _child_menu_index) // initialize menu if not defined
	menu = menu.children[?_child_menu_index] // step to child
}

/// @function go_back()
/// @description Go back to parent menu
function go_back() {
	if (!menu)
		show_error("Can not go back to parent menu: there is no current menu.", true)
		
	if (menu.parent)
		menu = menu.parent
}