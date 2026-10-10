suite(function () {
	section("ai_powerlaw_weighting", function() {
		
		test("empty_list", function() {
			// Arrange
			var _list = ds_list_create()
			
			// Assert
			expect(ai_powerlaw_weighting, [_list, true, 1]).toHaveReturnedWith(undefined)
			
			// Cleanup
			ds_list_destroy(_list)
		})
		
		test("size_one", function() {
			// Arrange
			var _list = ds_list_create()
			var _element = new AITreeElement(undefined)
			ds_list_add(_list, _element)
			_element.s_cost = 1
			
			// Act
			var _result = ai_powerlaw_weighting(_list, true, 1)
			
			// Assert
			expect(_result).toBe(_element)
			
			// Cleanup
			ds_list_destroy(_list)
		})
		
		test("zero_s_cost", function() {
			// Arrange
			var _list = ds_list_create()
			var _element = new AITreeElement(undefined)
			ds_list_add(_list, _element)
			
			// Act
			expect(ai_powerlaw_weighting, [_list, true, 1]).never().toThrow()
			var _result = ai_powerlaw_weighting(_list, true, 1)
			
			// Assert
			expect(_result).toBe(_element)
			
			// Cleanup
			ds_list_destroy(_list)
		})
		
		test("result_contained", function() {
			// Arrange
			var _list = ds_list_create()
			var _element1 = new AITreeElement(undefined)
			var _element2 = new AITreeElement(undefined)
			ds_list_add(_list, _element1, _element2)
			_element1.s_cost = 1
			_element2.s_cost = 1
			
			// Act
			var _result = ai_powerlaw_weighting(_list, true, 1)
			
			// Assert
			expect(ds_list_find_index(_list, _result)).never().toBeEqual(-1)
			
			// Cleanup
			ds_list_destroy(_list)
		})
	})
})