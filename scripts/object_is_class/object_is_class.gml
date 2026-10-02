/// @param {int} ind_child
/// @param {int} ind_parent
/// @returns {bool} Whether ind_child is child of ind_parent 
function object_is_class(_ind_child, _ind_par) {

	return (_ind_child == _ind_par || object_is_ancestor(_ind_child, _ind_par))


}
