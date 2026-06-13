grid = undefined // motion planning grid
grid_high = undefined // motion planning grid for high objects
cell_size = 16
obstr_objects = tag_get_asset_ids("AIObstruction", asset_object) // array of objects that are considered obstructions for AI motion planning

//Function to generate motion-planning grid
function astpath_generate_mp_grid(_cell_size) {
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		mp_grid_add_instances(grid, obstr_objects[i], true)
	}
	return grid
}

// Generate mp grid with only high obstructions
function astpath_generate_mp_grid_high(_cell_size) {
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		for (var j = 0; j < instance_number(obstr_objects[i]); j ++) {
			var obstacle = instance_find(obstr_objects[i], j)
			if (obstacle.height == HL.high)
				mp_grid_add_instances(grid, obstacle, true)
		}
	}
	return grid
}

//Define motion-planning grids
grid = astpath_generate_mp_grid(cell_size)
grid_high = astpath_generate_mp_grid_high(cell_size)

// Define normals
normals = ds_grid_create(room_width/cell_size, room_height/cell_size)
//mp_grid_to_ds_grid(grid, normals)

//for (var i = 0; i < ds_grid_width(normals); i ++) {
//	for (var j = 0; j < ds_grid_width(normals); j ++) {
//		mp_grid_get_cell()
//	}
//}