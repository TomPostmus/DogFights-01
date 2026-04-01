/// @param object_index_1
/// @param object_index_2
function object_is_class() {

	var obj1 = argument[0];
	var obj2 = argument[1];

	return (obj1 == obj2 || object_is_ancestor(obj1, obj2) || object_is_ancestor(obj2, obj1))


}
