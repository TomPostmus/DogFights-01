/// @description Inject a spy in an instance to mock a function of that instance
function test_inject_spy(_inst, _fn_name_to_mock, _fn_mock) {

	if (!variable_instance_exists(_inst, _fn_name_to_mock)) // check if instance has function
		show_error(string("Instance of object {0} has no variable named {1}", object_get_name(_inst.object_index), _fn_name_to_mock), true)

	var _fn_to_mock = variable_instance_get(_inst, _fn_name_to_mock) // get variable
	if (is_callable(_fn_to_mock) && !is_method(_fn_to_mock))
		show_error(string("Function to mock {0} is a script and not a method; spy cannot be injected. Please rewrite the script into a method using method syntax (i.e. some_function = function([args]) {code}).", script_get_name(_fn_to_mock)), true) 
	
	// Create spy in instance context
	var _spy_name = string("{0}_spy", _fn_name_to_mock) // name of the spy variable
	var _spy = spy(_fn_mock) // create spy around mock function
	variable_instance_set(_inst, _spy_name, _spy) // put spy variable in instance context
	
	// Override instance method variable with call to spy
	var _new_method = method(_inst, function() {
		_spy_name  =3 
	})
	variable_instance_set(_inst, _fn_name_to_mock, _new_method)
	
}