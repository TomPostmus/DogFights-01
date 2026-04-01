function biquad_filter() constructor {
	coefficients = array_create(argument_count)
	values = array_create(argument_count, 0)
	for (var i = 0; i < argument_count; i ++) {
		coefficients[i] = argument[i]
	}
	
	// Update values array and return filter value
	function update(_value) {
		for (var i = array_length(values)-1; i > 0; i --) {
			values[i] = values[i-1]
		}
		values[0] = _value
		return get()
	}
	
	// Return filter value
	function get() {
		var values_sum = 0, coeffients_sum = 0
		for (var i = 0; i < array_length(values); i ++) {
			values_sum += values[i]
			coeffients_sum += coefficients[i]
		}
		return values_sum / coeffients_sum
	}
}