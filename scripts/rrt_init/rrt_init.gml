// Initialize RRT
function rrt_init(_body_x, _body_y, _body_rot){
	
	rrt_branch = new rrt_root_element(_body_x, _body_y, _body_rot) // root node of tree
	var _field_vars = rrt_field(_body_x, _body_y, _body_rot) // get manifold properties at point
	rrt_branch.mani_z = _field_vars[0]
	rrt_branch.mani_tang_x = _field_vars[1]
	rrt_branch.mani_tang_y = _field_vars[2]
	rrt_branch.mani_slope = _field_vars[3]
	
	ds_list_add(rrt_branches, rrt_branch)
	ds_list_add(rrt_branches_open, rrt_branch)
	
}