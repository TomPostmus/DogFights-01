for (var i = 0; i < array_length(cyclic_paths); i ++)
	if (ds_exists(cyclic_paths[i], ds_type_list))
		ds_list_destroy(cyclic_paths[i])