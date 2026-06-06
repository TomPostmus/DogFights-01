instance_destroy(colslider)
ds_list_destroy(targets)

// Safe delete all RTT branches
for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
	var _branch = rrt_branches[|i]
	if (ds_exists(_branch.links, ds_type_list))
		ds_list_destroy(_branch.links)
}

ds_list_destroy(rrt_branches)
ds_list_destroy(rrt_branches_open)
ds_list_destroy(astpath_costs)
ds_list_destroy(astpath_ths)