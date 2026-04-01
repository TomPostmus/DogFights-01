function pid(_p, _i, _d, _max_integration) constructor {
	p = _p
	i = _i
	d = _d
	max_integration = _max_integration
	
	integration = 0
	prev = 0
	
	function get(_current, _reference) {
		var error = _reference - _current
		
		// Integration
		integration += error
		integration = clamp(integration, -max_integration, max_integration)
		
		// Derivation
		var diff = error - prev
		prev = error
		
		return p * error + i * integration + d * diff
	}
}