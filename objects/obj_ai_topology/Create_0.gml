obstr_objects = tag_get_asset_ids("AIObstruction", asset_object) // array of objects that are considered obstructions for AI motion planning

cell_size = 8
n_cells_x = ceil(room_width/cell_size)
n_cells_y = ceil(room_height/cell_size)

// Generate motion-planning grid
grid_cell_size = 16 // cell size for A* Grid
grid_n_cells_x = ceil(room_width/grid_cell_size)
grid_n_cells_y = ceil(room_height/grid_cell_size)
grid = mp_grid_create(0, 0, grid_n_cells_x, grid_n_cells_y, grid_cell_size, grid_cell_size)
for (var i = 0; i < array_length(obstr_objects); i ++) {
	mp_grid_add_instances(grid, obstr_objects[i], true)
}

// Generate mp grid with only high obstructions
grid_high = mp_grid_create(0, 0, grid_n_cells_x, grid_n_cells_y, grid_cell_size, grid_cell_size)
for (var i = 0; i < array_length(obstr_objects); i ++) {
	for (var j = 0; j < instance_number(obstr_objects[i]); j ++) {
		var obstacle = instance_find(obstr_objects[i], j)
		if (obstacle.height == HL.high)
			mp_grid_add_instances(grid_high, obstacle, true)
	}
}

// Define topology
compasses = ds_grid_create(n_cells_x, n_cells_y)
for (var i = 0; i < ds_grid_width(compasses); i ++) {
	for (var j = 0; j < ds_grid_height(compasses); j ++) {
		var _north = mp_grid_get_cell(grid, i, j-1) == -1 // whether north is occupied
		var _east = mp_grid_get_cell(grid, i+1, j) == -1
		var _south = mp_grid_get_cell(grid, i, j+1) == -1
		var _west = mp_grid_get_cell(grid, i-1, j) == -1
		
		compasses[# i, j] = [_north, _east, _south, _west]
	}
}

// Define distance transform
dist_transform = ds_grid_create(n_cells_x, n_cells_y) // ds grid that stores distance to nearest wall cell
//mp_grid_to_ds_grid(grid, dist_transform)

// Initialize free cells list
free_cells = ds_list_create() // make list for looping and grid for checking if has already been added
free_cells_g = ds_grid_create(n_cells_x, n_cells_y)
for (var i = 0; i < ds_grid_width(dist_transform); i ++) {
	for (var j = 0; j < ds_grid_height(dist_transform); j ++) {
		if (mp_grid_get_cell(grid, i, j) == -1) { // if occupied
			dist_transform[# i, j] = 0 // 0 distance for wall cell
			
			// add free neighbours
			if (j - 1 >= 0 && mp_grid_get_cell(grid, i, j-1) != -1
				&& free_cells_g[# i, j-1] != true) { // if north is in range and not occupied and not already added to free cells
				ds_list_add(free_cells, [i, j-1]) // add to free cells list
				free_cells_g[# i, j-1] = true
			}
			if (i + 1 < n_cells_x && mp_grid_get_cell(grid, i+1, j) != -1
				&& free_cells_g[# i+1, j] != true) { // east
				ds_list_add(free_cells, [i+1, j])
				free_cells_g[# i+1, j] = true
			}
			if (j + 1 < n_cells_y && mp_grid_get_cell(grid, i, j+1) != -1
				&& free_cells_g[# i, j+1] != true) { // south
				ds_list_add(free_cells, [i, j+1])
				free_cells_g[# i, j+1] = true
			}
			if (i - 1 >= 0 && mp_grid_get_cell(grid, i-1, j) != -1
				&& free_cells_g[# i-1, j] != true) { // west
				ds_list_add(free_cells, [i-1, j])
				free_cells_g[# i-1, j] = true
			}
		} else { // if not occupied
			dist_transform[# i, j] = -1 // put -1 distance for unexplored cells
		}
	}
}

while (ds_list_size(free_cells) > 0) {
	for (var c = 0; c < ds_list_size(free_cells); c ++) {
		var _cell = free_cells[|c] // get free cell coordinates
		var i = _cell[0]; var j = _cell[1] // column and row index of cell
		
		// check distance of neighbours
		var _north = infinity
		if (j - 1 >= 0 && dist_transform[# i, j-1] != -1)
			_north = dist_transform[# i, j-1]
		var _east = infinity
		if (i + 1 < n_cells_x && dist_transform[# i+1, j] != -1)
			_east = dist_transform[# i+1, j]
		var _south = infinity
		if (j + 1 < n_cells_y && dist_transform[# i, j+1] != -1)
			_south = dist_transform[# i, j+1]
		var _west = infinity
		if (i - 1 >= 0 && dist_transform[# i-1, j] != -1)
			_west = dist_transform[# i-1, j]
			
		var _min_dist = min(_north, _east, _south, _west) // compute minimum dist of neighbours
		dist_transform[# i, j] = _min_dist + 1 // put new dist at current free cell
		
		// add free neighbours
		if (j - 1 >= 0 && dist_transform[# i, j-1] == -1
			&& free_cells_g[# i, j-1] != true) { // if north is in range and distance trans not defined yet and not already added to free cells
			ds_list_add(free_cells, [i, j-1]) // add to free cells list
			free_cells_g[# i, j-1] = true
		}
		if (i + 1 < n_cells_x && dist_transform[# i+1, j] == -1
			&& free_cells_g[# i+1, j] != true) { // east
			ds_list_add(free_cells, [i+1, j])
			free_cells_g[# i+1, j] = true
		}
		if (j + 1 < n_cells_y && dist_transform[# i, j+1] == -1
			&& free_cells_g[# i, j+1] != true) { // south
			ds_list_add(free_cells, [i, j+1])
			free_cells_g[# i, j+1] = true
		}
		if (i - 1 >= 0 && dist_transform[# i-1, j] == -1
			&& free_cells_g[# i-1, j] != true) { // west
			ds_list_add(free_cells, [i-1, j])
			free_cells_g[# i-1, j] = true
		}
			
		ds_list_delete(free_cells, c) // remove cell from free list and grid
		free_cells_g[# i, j] = false
		c --
	}
}


ds_list_destroy(free_cells) // destroy list and grid
ds_grid_destroy(free_cells_g)

// Define source nodes
source_min_dist = 3 // minimal distance from walls for cell to be source
sources = ds_grid_create(n_cells_x, n_cells_y)
for (var i = 0; i < ds_grid_width(sources); i ++) {
	for (var j = 0; j < ds_grid_height(sources); j ++) {
		if (dist_transform[# i, j] > source_min_dist)
			sources[# i, j] = 0
		else {
			sources[# i, j] = -1
		}
	}
}

// Define orientations
orientations = ds_grid_create(n_cells_x, n_cells_y) // orientations of wall normals
strengths = ds_grid_create(n_cells_x, n_cells_y) // strength of wall normal vector
for (var i = 0; i < ds_grid_width(orientations); i ++) {
	for (var j = 0; j < ds_grid_height(orientations); j ++) {
		
		if (i >= 1 && i < n_cells_x-1 && j >= 1 && j < n_cells_y-1) {
			var _gx = dist_transform[# i+1, j] - dist_transform[# i-1, j]
			var _gy = dist_transform[# i, j+1] - dist_transform[# i, j-1]
			
			var _jxx = _gx*_gx
			var _jxy = _gx*_gy
			var _jyy = _gy*_gy
			
			var _gradient = 0.5 * arctan2(-2*_jxy, _jxx - _jyy)
			orientations[# i, j] = radtodeg(_gradient + 0.5 * pi)
			strengths[# i, j] = 1 - min(4, max(0, dist_transform[# i, j]-3)) / 4
		}
		
	}
}