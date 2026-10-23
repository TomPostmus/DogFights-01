windows = ds_list_create() // TODO: remove and just draw windows by looping over existing windows (with (obj_window))
active_window = undefined

// Kick off Menu Tree
create_controllers(obj_ui_menu_tree)
room_goto(rm_menu) // go to menu room

/// @description Center a given window in the GUI layer
/// @param {obj_window} window The window to be centerd
function center_window(_window) {

	_window.x = display_get_gui_width() / 2 - _window.width / 2
	_window.y = display_get_gui_height() / 2 - _window.height / 2

}

//Define macro's
// TODO: where is this used? Delete or move to better place
#macro FIELD_ALPHA 0.3
#macro WINDOW_ALPHA 0.6

#macro GREY $FF545454
#macro GREY_HOVER $FF686868
#macro GREY_CLICK $FF444444
#macro GREY_SECBORDER c_gray

#macro WINDOW_RED_COLOUR c_red
#macro WINDOW_RED_PRIMCOLOUR c_red
#macro WINDOW_RED_PRIMCOLOUR_HOVER $FF3F3FFF
#macro WINDOW_RED_PRIMCOLOUR_CLICK $FF0000D3
#macro WINDOW_RED_PRIMSECBORDER $FF7C7CFF
#macro WINDOW_RED_PRIMSECBORDER_HOVER $FFC9C9FF
#macro WINDOW_RED_PRIMSECBORDER_CLICK $FFC9C9FF
#macro WINDOW_RED_SECCOLOUR $FFD64848
#macro WINDOW_RED_SECCOLOUR_HOVER $FFF45858
#macro WINDOW_RED_SECCOLOUR_CLICK $FFB73E3E

#macro WINDOW_GREEN_COLOUR $FF10A348