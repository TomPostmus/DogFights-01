elements = ds_list_create() // list of AITreeNode elements
path = ds_list_create() // list of elements that are the path from the root node to a destination node
root = undefined // current root element


/// @function initialize(element)
/// @description Initializes tree with root element
/// @param {AITreeElement} element The element that is to become the root
/// @context obj_ai_tree_planner
function initialize(_element) {
	if (root != undefined)
		show_error("Root must be deleted before re-initializing tree.", true)
	if (_element.parent)
		show_error("Tree must be initialised with element that has no parent.", true)
	
	root = _element
	ds_list_add(elements, _element)
}


/// @function add_element(parent, element)
/// @description Adds a new element to the tree at the parent
/// @param {AITreeElement} element The new element being added to tree
/// @context obj_ai_tree_planner
function add_element(_element) {
	var _parent = _element.parent
	if (!_parent)
		show_error("Could not add element to tree, to undefined parent.", true)
	if (ds_list_find_index(elements, _parent) == -1)
		show_error("Could not add element to parent that is not part of tree.", true)
	
	ds_list_add(_parent.children, _element)
	ds_list_add(elements, _element)
}

/// @function delete_element(element, [decouple])
/// @description Gracefully removes element from tree. Also its children are removed.
/// @param {AITreeElement} element The element to be removed
/// @param {bool} decouple Whether to remove element from its parent's children list. Should only be false in recursive calls on children.
/// @context obj_ai_tree_planner
function delete_element(_element, decouple=true) {
	var _list_i = ds_list_find_index(elements, _element)
	if (_list_i == -1)
		show_error("Could not delete element that is not part of tree.", true)
	
	ds_list_delete(elements, _list_i)
	
	if (_element == root) {
		root = undefined	
	} else if (decouple) { // decouple from parent
		_list_i = ds_list_find_index(_element.parent.children, _element) // find element in parent children list		
		ds_list_delete(_element.parent.children, _list_i)
	}
	
	for (var i = 0; i < ds_list_size(_element.children); i ++) // delete children recursively
		delete_element(_element.children[|i], false)
		
	_element.cleanup() // clean up data structures
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


/// @function draw()
/// @description Draw each element in elements list
/// @context obj_ai_tree_planner
function draw() {
	for (var i = 0; i < ds_list_size(elements); i ++)
		elements[|i].draw()
}