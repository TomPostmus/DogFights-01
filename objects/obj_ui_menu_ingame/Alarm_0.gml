/// @description Handle escape up event
room_goto(rm_menu)
instance_destroy(obj_engine) // destroy engine

with (obj_lobby)
	instance_destroy() // destroy lobby if it exists
	
new_root(obj_ui_menu_main)