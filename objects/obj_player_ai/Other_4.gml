event_inherited()

// Safe delete all RTT branches
for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
	var _branch = rrt_branches[|i]
	if (ds_exists(_branch.links, ds_type_list))
		ds_list_destroy(_branch.links)
}
ds_list_clear(rrt_branches)
ds_list_clear(rrt_branches_open)

rrt_branch = undefined