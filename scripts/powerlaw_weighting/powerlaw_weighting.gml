// Given a list of structs with S cost fields, randomly chose one on basis of powerlaw weighting
/// @function powerlaw_weighting(list, inv)
/// @pure
/// @param {ds_list} list List containing elements
/// @param {bool} inv Bool whether to take inverse of S cost as weights
/// @param {real} p Exponent value
/// @returns {struct} The chosen element
function powerlaw_weighting(_list, _inv, _p) {
	
	var _size = ds_list_size(_list)
	
	var _cost_min = infinity
	var _cost_max = -infinity
	for (var i = 0; i < _size; i ++) { // determine min and max costs
		var _element = _list[|i]
		
		var _cost = _element.s_cost
				
		if (_cost < _cost_min)
			_cost_min = _cost
		if (_cost > _cost_max)
			_cost_max = _cost
	}
	
	if (_size == 1) { // if just one element
		
		return _list[|0] // return that one
		
	} else if (_size > 1) { // do power law weighting for choosing element
	
		var _ws = array_create(_size) // weights
		var _w_sum = 0 // sum of weights
		var _cost_range = _cost_max - _cost_min // range of cost (same for each cell)
		for (var i = 0; i < _size; i ++) {
			var _element = _list[|i]
		
			var _cost_norm = _cost_range == 0 ? 1 : (0.1 + 0.9 * (_element.s_cost - _cost_min) / _cost_range) // normalise in range of 0.1, 1
			var _cost_power = power(_cost_norm, _p) // power of cost (the higher the power, the stronger high costs are favoured)
			if (_inv)
				_cost_power = 1 / _cost_power // take inverse
			
			_ws[i] = _cost_power
			_w_sum += _cost_power
		}
	
		// choose element randomly, weighted with cost
		var _rn = random(1) // draw random number within 0, 1
		var _acc = 0 // var that accumulates probabilities
		for (var i = 0; i < _size; i ++) {
			var _p_i = _ws[i] / _w_sum // probability of branch i
			if (_rn >= _acc && _rn < _acc + _p_i) // if _rn falls between weighted portion
				return _list[|i] // choose this cell
				
			_acc += _p_i
		}
		
	}
	
	return undefined
	
}