function AITreeElement(_parent) constructor {
	
	parent = _parent
	children = ds_list_create()
	delete_flag = false // flag that element is ready to be deleted from outside
	cleaned = false // flag indicating that cleanup has been called and element should no longer be called upon

	h_cost = undefined
	g_cost = undefined
	s_cost = undefined

	// Mark element and children for deletion recursively
	function mark_delete(_decouple=true) {
		delete_flag = true // raise flag
		
		if (_decouple) {
			var _list_i = ds_list_find_index(parent.children, self) // find self in parent children list
			ds_list_delete(parent.children, _list_i) // remove self from list
		}
			
		for (var i = 0; i < ds_list_size(children); i ++)
			children[|i].mark_delete(false)	// mark children for deletion, without decoupling them (whole branch can go in trash)
	}	
	
	// Cleanup data structures
	function cleanup() {
		cleaned = true			
		ds_list_destroy(children)
	}

}