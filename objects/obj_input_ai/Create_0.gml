event_inherited()

last_seen_target_x = 0		// position where target is and was last seen if no longer in-sight
last_seen_target_y = 0
targets = ds_list_create()	// list of bodies that are potential targets
target = noone				// current target (body object)
scope_w = 640
scope_h = 320
path = undefined
path_point = 0
trigger_timer = 0			// timer that turns input_attack true on zero

state = "explore"

// Decision tree
dtree_timer = 0				// timer to call decision tree update
dtree_update_time = 60		// number of steps between each dtree update
conflict = false			// whether there are enemies to conflict with
fight_or_flight = ""		// when conflict, whether to fight, flight or await
path_recompute_timer = 0	// timer to recompute path when dealing with dynamic goal
path_recompute_time = 20	// number of steps between each path recompute

//Function to generate motion-planning grid
function generate_mp_grid(_cell_size) {
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(objects); i ++) {
		mp_grid_add_instances(grid, objects[i], true)
	}
	return grid
}

// Generate mp grid with only high obstructions
function generate_mp_grid_high(_cell_size) {
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(objects); i ++) {
		for (var j = 0; j < instance_number(objects[i]); j ++) {
			var obstacle = instance_find(objects[i], j)
			if (obstacle.height == HL.high)
				mp_grid_add_instances(grid, obstacle, true)
		}
	}
	return grid
}

//Define motion-planning grids
grid = generate_mp_grid(16)
grid_high = generate_mp_grid_high(8)

