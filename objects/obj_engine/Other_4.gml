if (state == "startup" || state == "running") {
	
	spawns_controller = create_controllers(obj_spawns_controller)
	hud = create_hud(0, 0, obj_hud)
	
	state = "running"
	global.engine_running = true // set global
	
	// Notify observers
	for (var i = 0; i < ds_list_size(observers_startup); i ++)
		observers_startup[|i].notify_on_engine_startup()

}