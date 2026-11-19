if (state == "startup") {
	
	state = "running"
	global.engine_running = true // set global
	
	// Notify observers of startup
	with (obj_player)
		if (variable_instance_exists(id, "notify_on_engine_startup"))
			notify_on_engine_startup()
	for (var i = 0; i < ds_list_size(observers); i ++)
		if (variable_instance_exists(observers[|i], "notify_on_engine_startup"))
			observers[|i].notify_on_engine_startup()

}

if (state == "running") {

	spawns_controller = create_controllers(obj_spawns_controller)
	hud = create_hud(0, 0, obj_hud)
	
	// Notify observers of room start
	with (obj_player)
		if (variable_instance_exists(id, "notify_on_engine_room_start"))
			notify_on_engine_room_start()
	for (var i = 0; i < ds_list_size(observers); i ++)
		if (variable_instance_exists(observers[|i], "notify_on_engine_room_start"))
			observers[|i].notify_on_engine_room_start()

}