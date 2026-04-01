/// @param list
function list_deep_destroy() {

	var list = argument[0];

	for (var i = 0; i < ds_list_size(list); i ++) {
		if (instance_exists(list[|i])) instance_destroy(list[|i])
	}
	list_deep_destroy(list)


}
