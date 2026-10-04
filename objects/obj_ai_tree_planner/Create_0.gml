elements = ds_list_create() // list of AITreeNode elements
path = ds_list_create() // list of elements that are the path from the root node to a destination node
root = undefined // current root element


/// @function initialize(element)
/// @description Initializes tree with root element
/// @param {AITreeElement} element The element that is to become the root
/// @context obj_ai_tree_planner
function initialize(_element) {
	if (root != undefined && !root.delete_flag)
		show_error("Root must be deleted before re-initializing tree.", true)
	
	root = _element
	ds_list_add(elements, _element)
}


/// @function add_element(parent, element)
/// @description Adds a new element to the tree at the parent
/// @param {AITreeElement} parent The parent element that new element is based on
/// @param {AITreeElement} element The new element being added to tree
/// @context obj_ai_tree_planner
function add_element(_parent, _element) {
	if (!_parent)
		show_error("Could not add element to tree, to undefined parent.", true)
	if (ds_list_find_index(elements, _parent) == -1)
		show_error("Could not add element to parent that is not part of tree.", true)
			
	ds_list_add(_parent.children, _element)
	ds_list_add(elements, _element)
}


/// @function compute_path(destination)
/// @description Computes a path from the root to the destination node by backtracking
/// @param {AITreeElement} destination The destination element to compute path towards
/// @context obj_ai_tree_planner
function compute_path(_destination) {
	if (ds_list_find_index(elements, _destination) == -1)
		show_error("Could not compute path to destination that is not part of tree.", true)
		
	ds_list_clear(path) // clear 
	ds_list_add(path, _destination) // add destination to path
	var _next_elem = _destination // start backtracking from destination
	while (_next_elem != root) { // backtrack through parents until found root
		_next_elem = _next_elem.parent // go to parent
		
		if (_next_elem == undefined)
			show_error("Encountered undefined parent link in computing path to destination. Possibly tree is disjointed.", true)
		
		ds_list_insert(path, 0, _next_elem) // insert at start of path list
	}
}


/// @function cleanup_elements()
/// @description Clean up elements that are marked for deletion
/// @context obj_ai_tree_planner
function cleanup_elements() {
	for (var i = 0; i < ds_list_size(elements); i ++) {
		var _element = elements[|i]
		
		if (root == _element)
			root = undefined // reset root
		
		if (_element.delete_flag)
			_element.cleanup()
			
	}
}