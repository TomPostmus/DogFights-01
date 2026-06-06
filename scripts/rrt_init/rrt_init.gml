// Initialize RRT
function rrt_init(_body_x, _body_y, _body_rot){
	
	rrt_branch = new rrt_root_element(_body_x, _body_y, _body_rot) // root node of tree
	
	var _field_vars = rrt_field(_body_x, _body_y, _body_rot) 
	rrt_branch.h_cost = _field_vars[0] // H cost for init node
	rrt_branch.lowest_cost_dir = _field_vars[1] // direction towards lowest cost
	
	ds_list_add(rrt_branches, rrt_branch)
	ds_list_add(rrt_branches_open, rrt_branch)
	
}