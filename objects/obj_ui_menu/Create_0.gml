parent = undefined // parent menu which it can go back to
children = ds_map_create() // map from object_index of a obj_menu to the instance created of that object
windows = ds_list_create()

draw = function() {
	
	for (var i = 0; i < ds_list_size(windows); i ++)
		windows[|i].draw()
	
}