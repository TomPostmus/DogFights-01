elements = ds_list_create() // list of AITreeNode elements
path = ds_list_create() // list of elements that are the path from the root node to a destination node
root = undefined // current root element

// Path mode
enum AI_PATH_MODE {
	DESTINATION_BASED, // path find mode, path is computed based on lowest S cost
	FLOW_BASED // path flow mode, path is computed based on progeny count
}
path_mode = AI_PATH_MODE.FLOW_BASED

// Timers
tree_update_frames = 1 // after how many frames to do tree update (grow or prune)
alarm[0] = tree_update_frames
path_update_frames = 1 // after how many frames to compute optimal path through tree
alarm[1] = path_update_frames

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
	
	update_progeny_upstream(_parent, 1) // progeny count from 1 of element, element cannot have children yet
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
		
		update_progeny_upstream(_element.parent, -1 - _element.progeny) // subtract self and children from upstream progeny
	}
	
	for (var i = 0; i < ds_list_size(_element.children); i ++) // delete children recursively
		delete_element(_element.children[|i], false)
		
	_element.cleanup() // clean up data structures
}

/// @function update_progeny_upstream(element, added_progeny)
/// @description Backtrack from element upstream until root, update progeny counts for every element on the way
/// @param {AITreeElement} element The element to start from
/// @param {int} added_progeny The progeny count to add to every branch
/// @context obj_ai_tree_planner
function update_progeny_upstream(_element, _added_progeny) {
	var _next_elem = _element
	while (_next_elem != undefined) { // backtrack through parents until found root
		_next_elem.progeny += _added_progeny // increase progeny count
		_next_elem = _next_elem.parent // go to parent
	}
}

/// @function compute_path(destination)
/// @description Computes a path from the root to the destination node by backtracking
/// @param {AITreeElement} destination The destination element to compute path towards
/// @context obj_ai_tree_planner
function compute_path(_destination) {
	if (ds_list_find_index(elements, _destination) == -1)
		show_error("Could not compute path to destination that is not part of tree.", true)
		
	ds_list_clear(path) // clear 
	var _next_elem = _destination // start backtracking from destination
	while (_next_elem != undefined) { // backtrack through parents until found no parent at root
		ds_list_insert(path, 0, _next_elem) // insert at start of path list
		_next_elem = _next_elem.parent // go to parent
	}
}

/// @function compute_path_flow()
/// @description Compute a path, starting from root, following the flow, or maximaly progeny counts, of the tree
/// @context obj_ai_tree_planner
function compute_path_flow() {
	ds_list_clear(path) // clear 
	var _max_progeny, _next_elem
	var _cur_elem = root
	while(_cur_elem) {
		ds_list_add(path, _cur_elem)
		
		_next_elem = undefined
		_max_progeny = 0
		for (var i = 0; i < ds_list_size(_cur_elem.children); i ++) { // find next element based on highest progeny count
			var _child = _cur_elem.children[|i]
			if (_child.progeny >= _max_progeny) {
				_max_progeny = _child.progeny
				_next_elem =  _child
			}
		}
		
		_cur_elem = _next_elem
	}
}

/// @description Compute H cost
/// @context obj_ai_tree_planner
function compute_h_cost(_element) {
	show_error("This function is meant to be implemented in inheriting objects.", true)
}


/// @function draw()
/// @description Draw each element in elements list
/// @context obj_ai_tree_planner
function draw() {
	
	draw_set_colour(c_blue)
	for (var i = 0; i < ds_list_size(elements); i ++) {
		if (ds_list_find_index(path, elements[|i]) != -1)
			continue
		
		elements[|i].draw()
	}
		
	draw_set_colour(c_lime)
	for (var i = 0; i < ds_list_size(path); i ++)
		path[|i].draw()
		
}