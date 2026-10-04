suite(function () {
	section("ai_powerlaw_weighting", function() {
		
		test("empty_list", function() {
			// Arrange
			var _list = ds_list_create()
			
			// Act
			var _result = ai_powerlaw_weighting(_list, true, 1)
			
			// Assert
			expect(_result).toHaveReturnedWith(undefined)
			
			// Cleanup
			ds_list_destroy(_list)
		})
		
		test("size_one", function() {
			var _list = ds_list_create()
			
			
			
			ds_list_destroy(_list)
		})
	})
})