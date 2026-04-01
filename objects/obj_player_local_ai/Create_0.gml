event_inherited()

turn_input = 0
move_input = 0
attack_input = false

last_seen_target_x = 0
last_seen_target_y = 0
targets = ds_list_create()
target = noone
scope_w = 640
scope_h = 320
path = undefined
path_point = 0

state = "explore"

//Function to generate motion-planning grid
function generate_mp_grid(_cell_size) {
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(objects); i ++) {
		mp_grid_add_instances(grid, objects[i], true)
	}
	return grid
}

//Define motion-planning grid
grid = generate_mp_grid(16)
