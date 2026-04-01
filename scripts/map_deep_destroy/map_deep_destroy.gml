/// @param map
function map_deep_destroy() {

	var map = argument[0];

	var inst = ds_map_find_first(map)
	while (inst != undefined && instance_exists(inst)) {
		instance_destroy(inst)
		inst = ds_map_find_next(map, inst)
	}
	ds_map_destroy(map)


}
