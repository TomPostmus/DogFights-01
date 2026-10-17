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
		
		test("add_element_progeny_count", function() {
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			
			var _root = new AITreeElement(undefined)
			var _element1 = new AITreeElement(_root)
			var _element2 = new AITreeElement(_element1)
			
			_planner.initialize(_root)
			_planner.add_element(_element1)
			_planner.add_element(_element2)
			
			// Assert
			expect(_root.progeny).toBe(2)
			expect(_element1.progeny).toBe(1)
			expect(_element2.progeny).toBe(0)
			
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
		
		test("delete_element_progeny_count", function() {
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _element1 = new AITreeElement(_root)
			var _element2 = new AITreeElement(_element1)
			
			_planner.initialize(_root)
			_planner.add_element(_element1)
			_planner.add_element(_element2)
			
			// Act
			_planner.delete_element(_element1)
			
			// Assert
			expect(_root.progeny).toBe(0)
			
			// Cleanup
			instance_destroy(_planner)
			
		})
				
		test("compute_path_goodweather", function() {	
					
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _branch1_element1 = new AITreeElement(_root)
			var _branch2_element1 = new AITreeElement(_root)
			var _branch2_element2 = new AITreeElement(_branch2_element1)
			
			_planner.initialize(_root)
			_planner.add_element(_branch1_element1)
			_planner.add_element(_branch2_element1)
			_planner.add_element(_branch2_element2)
			
			var _destination = _branch2_element2
			
			// Act
			expect(_planner.compute_path, [_destination]).never().toThrow()
			
			// Assert
			expect(ds_list_size(_planner.path)).toBe(3)
			expect(_planner.path[|0]).toBe(_root) // expect path to be branch 2, starting at root, ending at destination
			expect(_planner.path[|1]).toBe(_branch2_element1)
			expect(_planner.path[|2]).toBe(_destination)
			expect(ds_list_find_index(_planner.path, _branch1_element1)).toBe(-1) // expect branch 1 not to be included in path
			
			// Cleanup
			instance_destroy(_planner)
		
		})
		
		test("compute_path_tree_size_one", function() {
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			
			_planner.initialize(_root)
			
			// Act
			expect(_planner.compute_path, [_root]).never().toThrow()
			
			// Assert
			expect(ds_list_size(_planner.path)).toBe(1)  // expect path to only root
			expect(_planner.path[|0]).toBe(_root)
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("compute_path_reinitialize", function() {
			
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _element1 = new AITreeElement(_root)
			var _element2 = new AITreeElement(_root)
			
			_planner.initialize(_root)
			_planner.add_element(_element1)
			_planner.add_element(_element2)
			
			_planner.compute_path(_element1)
			
			// Act
			_planner.compute_path(_element2) // reinitialize path
			
			// Assert
			expect(ds_list_size(_planner.path)).toBe(2)
			expect(_planner.path[|0]).toBe(_root) // expect path to be to element 2
			expect(_planner.path[|1]).toBe(_element2)
			expect(ds_list_find_index(_planner.path, _element1)).toBe(-1) // expect element 1 no longer to be included
			
			// Cleanup
			instance_destroy(_planner)
			
		})
		
		test("compute_path_destination_outside_tree", function() {	
					
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _element = new AITreeElement(_root)
			
			_planner.initialize(_root)
			
			// Act
			expect(_planner.compute_path, [_element]).toThrow(
				"Could not compute path to destination that is not part of tree.")
			
			// Cleanup
			instance_destroy(_planner)
		
		})
		
		test("compute_path_flow", function() {	
					
			// Arrange
			var _planner = create(0, 0, obj_ai_tree_planner)
			var _root = new AITreeElement(undefined)
			var _branch1_element1 = new AITreeElement(_root)
			var _branch2_element1 = new AITreeElement(_root)
			var _branch2_element2 = new AITreeElement(_branch2_element1)
			
			_planner.initialize(_root)
			_planner.add_element(_branch1_element1)
			_planner.add_element(_branch2_element1)
			_planner.add_element(_branch2_element2)
			
			// Act
			_planner.compute_path_flow()
			
			// Assert
			expect(ds_list_size(_planner.path)).toBe(3)
			expect(_planner.path[|0]).toBe(_root) // expect path to be branch 2, starting at root, ending at destination
			expect(_planner.path[|1]).toBe(_branch2_element1)
			expect(_planner.path[|2]).toBe(_branch2_element2)
			expect(ds_list_find_index(_planner.path, _branch1_element1)).toBe(-1) // expect branch 1 not to be included in path
			
			// Cleanup
			instance_destroy(_planner)
		
		})
		
	})
})