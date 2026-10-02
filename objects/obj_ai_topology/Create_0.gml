obstr_objects = tag_get_asset_ids("AIObstruction", asset_object) // array of objects that are considered obstructions for AI motion planning

cell_size = 8
n_cells_x = ceil(room_width/cell_size)
n_cells_y = ceil(room_height/cell_size)