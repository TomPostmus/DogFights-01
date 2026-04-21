// Copy values from struct to new struct
function struct_functions(_struct){
	var new_struct = {}
	var names = variable_struct_get_names(_struct)
	for (var i = 0; i < array_length(names); i ++) {
		variable_struct_set(new_struct, names[i],
			variable_struct_get(_struct, names[i]))
	}
	return new_struct
}

// Merge two structs, return new merged struct
function struct_merge(_struct1, _struct2) {
	var new_struct = {}
	var names
	names = variable_struct_get_names(_struct1)
	for (var i = 0; i < array_length(names); i ++) {
		variable_struct_set(new_struct, names[i],
			variable_struct_get(_struct1, names[i]))
	}
	names = variable_struct_get_names(_struct2)
	for (var i = 0; i < array_length(names); i ++) {
		variable_struct_set(new_struct, names[i],
			variable_struct_get(_struct2, names[i]))
	}
	return new_struct
}