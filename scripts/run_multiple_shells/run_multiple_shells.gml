function run_multiple_shells(){
	
	var shell_count = 2;
	var param_count = parameter_count()
	if (param_count < 2 + shell_count) {
		var params = "";
		for (var i = 1; i < param_count+1; i ++) {
			if (i == 2) {
				params += "\"" + parameter_string(i) + "\" "
			} else {
				params += parameter_string(i) + " "
			}
		}
	
		params += " -secondary "
	
		shell_execute(parameter_string(0), params)
		window_set_caption("Shell " + string(param_count - 2))
	} else if (param_count == 2 + shell_count) {
		window_set_caption("Shell " + string(param_count - 2))
	}
	
}