astr_reset()
ds_list_destroy(astriver_rows)
ds_list_destroy(astriver_cells)
instance_destroy(colslider)
ds_list_destroy(targets)

// Safe delete all RTT branches
for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
	var _branch = rrt_branches[|i]
	if (ds_exists(_branch.links, ds_type_list))
		ds_list_destroy(_branch.links)
}

ds_list_destroy(rrt_branches)