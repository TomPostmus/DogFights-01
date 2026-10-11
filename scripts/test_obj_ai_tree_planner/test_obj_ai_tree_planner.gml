suite(function () {
	section("obj_ai_tree_planner", function() {
		
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
			expect(ds_list_size(_planner.elements)).toBe(1)
			expect(ds_list_find_index(_planner.elements, _element)).never().toBe(-1)
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("initialize_reinitialize_throws", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root1 = new AITreeElement(undefined)
			var _root2 = new AITreeElement(undefined)
			_planner.initialize(_root1)
			
			// Assert
			expect(_planner.initialize, [_root2]).toThrow() // expect reinitialization to throw
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("initialize_with_rooted_element_throws", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _element = new AITreeElement(_root) // element based on root
			
			// Assert
			expect(_planner.initialize, [_element]).toThrow() // element with root -> throws
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("add_element_goodweather", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			_planner.initialize(_root)
			
			var _element = new AITreeElement(_root)
						
			// Assert
			expect(_planner.add_element, [_element]).never().toThrow()
			expect(ds_list_size(_planner.elements)).toBe(2)
			expect(ds_list_find_index(_planner.elements, _element)).never().toBe(-1)
			expect(ds_list_find_index(_root.children, _element)).never().toBe(-1)
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("add_element_before_initialise", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _element = new AITreeElement(_root)
						
			// Assert
			expect(_planner.add_element, [_element]).toThrow(
				"Could not add element to parent that is not part of tree.")
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("add_element_undefined_parent", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			_planner.initialize(_root)
			
			var _element = new AITreeElement(undefined)
						
			// Assert
			expect(_planner.add_element, [_element]).toThrow(
				"Could not add element to tree, to undefined parent.")
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("add_element_to_parent_outside_tree", function() {	
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root1 = new AITreeElement(undefined)
			var _root2 = new AITreeElement(undefined)
			var _element = new AITreeElement(_root2)
			_planner.initialize(_root1)
						
			// Assert
			expect(_planner.add_element, [_element]).toThrow(
				"Could not add element to parent that is not part of tree.")
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("delete_element_from_root", function() {	
					
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _element = new AITreeElement(_root)
			_planner.initialize(_root)
			_planner.add_element(_element)
			
			// Act
			expect(_planner.delete_element, [_element]).never().toThrow()
			
			// Assert
			expect(ds_list_size(_planner.elements)).toBe(1)
			expect(ds_list_find_index(_planner.elements, _element)).toBe(-1)
			expect(ds_list_find_index(_root.children, _element)).toBe(-1)
			
			// Cleanup
			instance_destroy(_planner)
		
		})
		
		test("delete_element_delete_root", function() {	
					
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _ds_count_before = obj_init.ds_count_all()
			var _root = new AITreeElement(undefined)
			var _element = new AITreeElement(_root)
			_planner.initialize(_root)
			_planner.add_element(_element)			
			
			// Act
			_planner.delete_element(_root)
			var _ds_count_after = obj_init.ds_count_all()
			
			// Assert
			expect(ds_list_size(_planner.elements)).toBe(0)
			expect(_planner.root).toBe(undefined)
			expect(_ds_count_before).toBeEqual(_ds_count_after) // expect memory contained
			
			// Cleanup
			instance_destroy(_planner)
		
		})
		
		
		test("delete_element_outside_tree", function() {	
					
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root1 = new AITreeElement(undefined)
			var _root2 = new AITreeElement(undefined)
			_planner.initialize(_root1)
			
			// Assert
			expect(_planner.delete_element, [_root2]).toThrow(
				"Could not delete element that is not part of tree.")
			
			// Cleanup
			instance_destroy(_planner)
		
		})
				
		test("compute_path", function() {	
					
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root1 = new AITreeElement(undefined)
			var _root2 = new AITreeElement(undefined)
			_planner.initialize(_root1)
			
			// Assert
			// TODO: implement
			
			// Cleanup
			instance_destroy(_planner)
		
		})
		
	})
})