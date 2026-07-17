// Delete RTT branches marked for deletion
function rrt_clean(){
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) { // loop through all branches
		var _branch = rrt_branches[|i]
		
		if (_branch.del) {
			// reset root and dest variables
			if (_branch == rrt_branch) // if to be deleted branch is current root branch
				rrt_branch = undefined // reset current rrt_branch variable
			if (_branch == rrt_dest) // same for destination branch
				rrt_dest = undefined
			
			// remove from parent links
			if (_branch.parent != undefined && !_branch.parent.del) { // if has parent that is not marked for deletion
				var _branch_parent = _branch.parent
				var _branch_i = ds_list_find_index(_branch_parent.links, _branch)
				ds_list_delete(_branch_parent.links, _branch_i) // remove this branch from its parent's links
				
				var _thickness = 1 + _branch.thickness // thickness of branch with itself included
				rrt_grow(_branch_parent, -_thickness) // subtract
			}
			
			// remove from branches lists
			var j = ds_list_find_index(rrt_branches_open, _branch) // also find in open branches list
			if (j != -1)
				ds_list_delete(rrt_branches_open, j) // remove from open branches
		
			ds_list_delete(rrt_branches, i) // remove from list
			i --
			
			// destroy branch data structures
			ds_list_destroy(_branch.links) // destroy its links data structure
			delete _branch // delete struct
		}
	}
}