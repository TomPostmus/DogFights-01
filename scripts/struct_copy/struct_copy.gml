// Copy values from struct to new struct
function struct_copy(_struct){
	var new_struct = {}
	var names = variable_struct_get_names(_struct)
	for (var i = 0; i < array_length(names); i ++) {
		variable_struct_set(new_struct, names[i],
			variable_struct_get(_struct, names[i]))
	}
	return new_struct
}