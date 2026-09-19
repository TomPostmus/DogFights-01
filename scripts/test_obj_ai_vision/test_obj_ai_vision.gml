suite(function () {
	section("obj_ai_vision", function() {		
		test("memory_contained", function() {
			var _before = obj_init.ds_count_all()
			
			var _inst = create(0, 0, obj_ai_vision) // create and destroy again
			instance_destroy(_inst)
			
			var _after =  obj_init.ds_count_all()
			
			expect(_before).toBeEqual(_after)
		})
	})
})