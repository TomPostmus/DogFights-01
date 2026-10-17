function AITreeElement(_parent) constructor {
	
	parent = _parent
	children = ds_list_create()
	progeny = 0 // how many children/n-grandchildren element has
	
	h_cost = 0
	g_cost = 0
	s_cost = 0
	
	// Cleanup data structures
	function cleanup() {	
		ds_list_destroy(children)
	}

}