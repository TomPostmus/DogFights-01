/// @description Creates a list of object indices that inherit from parent
/// @param {parent_index} The object_index of the parent
/// @returns {list} List of object_indices of children
function object_get_children(_parent_index) {
	var _children = ds_list_create()
	
	var _index = 0
	while (object_exists(_index)) { // loop until found index that does not correspond to object
		if (object_is_ancestor(_index, _parent_index))
			ds_list_add(_children, _index)
			
		_index ++ // go to next index
	}
	
	return _children
}