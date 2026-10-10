suite(function () {
	section("obj_ai_action_planner", function() {
		
		test("memory_contained", function() {			
			test_memory_contained(obj_ai_tree_planner)
		})
		
		test("initialize_goodweather", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _element = new AITreeElement(undefined)
			
			// Assert
			expect(_planner.root).toBe(undefined)
			
			// Act
			_planner.initialize(_element)
			
			// Assert
			expect(_planner.root).never().toBe(undefined)
			expect(_planner.root).toBe(_element)
			expect(ds_list_find_index(_planner.elements, _element)).never().toBe(-1)
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("initialize_reinitialize_throws", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _element1 = new AITreeElement(undefined)
			var _element2 = new AITreeElement(undefined)
			_planner.initialize(_element1)
			
			// Assert
			expect(_planner.initialize, [_element2]).toThrow() // expect reinitialization to throw
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("initialize_reinitialize_does_not_throw", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _element1 = new AITreeElement(undefined)
			var _element2 = new AITreeElement(undefined)
			_planner.initialize(_element1)
			
			// Act
			_element1.mark_delete()
			
			// Assert
			expect(_planner.initialize, [_element2]).never().toThrow() // expect reinitialization NOT to throw
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
	})
})