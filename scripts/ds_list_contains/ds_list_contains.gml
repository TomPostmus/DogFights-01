/// @param list
/// @param value
function ds_list_contains(_list, _value) {
	return ds_list_find_index(_list, _value) != -1
}
