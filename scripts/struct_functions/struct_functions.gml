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

/// @function struct_melt_into_instance(struct, inst)
/// @description Melts variables from struct into instance, i.e. the instance will have the variables
function struct_melt_into_instance(_struct, _inst) {
	var _vars = variable_struct_get_names(_struct)
	for (var i = 0; i < array_length(_vars); i ++) {
		var _value = variable_struct_get(_struct,  _vars[i]) // read value from struct
		variable_instance_set(_inst, _vars[i], _value)
	}
}