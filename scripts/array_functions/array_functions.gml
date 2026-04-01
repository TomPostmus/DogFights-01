function array_contains(_array, _element) {
	for (var i = 0; i < array_length(_array); i ++) {
		if (_array[i] == _element)
			return true
	}
	return false
}