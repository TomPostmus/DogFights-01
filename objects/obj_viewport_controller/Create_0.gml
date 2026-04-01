global.viewport_to_camera = ds_map_create()
global.active_viewports = ds_list_create() // list of viewports (ints) that are currently active

// Populate active viewports list
for (var i = 0; i < 8; i ++) {
	if (view_visible[i]) { // if viewport is set to visible
		ds_list_add(global.active_viewports, i); // add to active viewports list
	}
}