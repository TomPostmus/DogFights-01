function AITreeElement() constructor {
	
	parent = undefined
	children = ds_list_create()
	
	h_cost = 0
	g_cost = 0
	s_cost = 0
	
	// Cleanup data structures
	function cleanup() {	
		ds_list_destroy(children)
	}

}