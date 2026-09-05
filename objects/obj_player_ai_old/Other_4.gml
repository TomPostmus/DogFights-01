event_inherited()

// Safe delete all RTT branches
for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
	var _branch = rrt_branches[|i]
	if (ds_exists(_branch.links, ds_type_list))
		ds_list_destroy(_branch.links)
}
ds_list_clear(rrt_branches)
ds_list_clear(rrt_branches_open)
ds_list_clear(apf_sources)

var _attr_source = create_groundhigh(0, 0, obj_ai_apf_source) // single attraction source for single target
_attr_source.rep_type = false // set to attraction source
ds_list_add(apf_sources, _attr_source)

rrt_branch = undefined