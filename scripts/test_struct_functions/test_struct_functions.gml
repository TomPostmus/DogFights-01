suite(function () {
	section("struct_functions", function() {
		
		test("struct_merge", function() {
			
			// Arrange
			var _struct1 = {
				var1: 1,
				var2: 2
			}
			
			var _struct2 = {
				var3: 5,
				var4: 6
			}
			
			// Act
			expect(struct_merge, [_struct1, _struct2]).never().toThrow()
			var _merged_struct = struct_merge(_struct1, _struct2)
			
			// Assert
			expect(variable_struct_names_count(_merged_struct)).toBe(4)
			expect(variable_struct_exists(_merged_struct, "var1")).toBeTruthy()
			expect(variable_struct_exists(_merged_struct, "var2")).toBeTruthy()
			expect(variable_struct_exists(_merged_struct, "var3")).toBeTruthy()
			expect(variable_struct_exists(_merged_struct, "var4")).toBeTruthy()
			expect(variable_struct_get(_merged_struct, "var1")).toBe(1)
			expect(variable_struct_get(_merged_struct, "var2")).toBe(2)
			expect(variable_struct_get(_merged_struct, "var3")).toBe(5)
			expect(variable_struct_get(_merged_struct, "var4")).toBe(6)
			
		})
		
		test("struct_merge_overlap", function() {
			
			// Arrange
			var _struct1 = {
				var1: 1,
				var2: 2
			}
			
			var _struct2 = {
				var2: 5,
				var3: 6
			}
			
			// Act
			expect(struct_merge, [_struct1, _struct2]).never().toThrow()
			var _merged_struct = struct_merge(_struct1, _struct2)
			
			// Assert
			expect(variable_struct_names_count(_merged_struct)).toBe(3)
			expect(variable_struct_get(_merged_struct, "var2")).toBe(5) // expect struct 2 to contain final value
			
		})
		
		test("struct_merge_empty_does_not_throw", function() {
			
			// Arrange
			var _struct = {
				var1: 1,
				var2: 2
			}
			
			// Assert
			expect(struct_merge, [_struct, {}]).never().toThrow()
			expect(struct_merge, [{}, _struct]).never().toThrow()
			expect(struct_merge, [{}, {}]).never().toThrow()
			
		})
		
		test("struct_melt_into_instance", function() {
			
			// Arrange
			var _inst = create(0, 0, obj_test_stub_object) // whatever instance
			var _struct = {
				var1: 1,
				var2: 2
			}
			
			// Assert
			expect(variable_instance_exists(_inst, "var1")).toBeFalsy()
			expect(variable_instance_exists(_inst, "var2")).toBeFalsy()
			
			// Act
			expect(struct_melt_into_instance, [_struct, _inst]).never().toThrow()
			
			// Assert
			expect(variable_instance_exists(_inst, "var1")).toBeTruthy()
			expect(variable_instance_exists(_inst, "var2")).toBeTruthy()
			expect(variable_instance_get(_inst, "var1")).toBe(1)
			expect(variable_instance_get(_inst, "var2")).toBe(2)
			
			// Cleanup
			instance_destroy(_inst)
		})
	
	})
})