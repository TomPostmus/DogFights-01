ds_list_destroy(observers_startup)
ds_list_destroy(observers_stop)

// Destroy managed components
with (spawns_controller)
	instance_destroy()
with (viewport_controller)
	instance_destroy()
with (sound_controller)
	instance_destroy()
with (particles_controller)
	instance_destroy()
with (hud)
	instance_destroy()
	
global.engine_running = false