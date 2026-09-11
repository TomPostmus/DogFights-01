suite(function () {
	section("ai_vision", function() {
		//test("create_poi", function() {
		//	var _type = POI_TYPE.ENEMY
		//	var _poi = new Poi(_type, noone, 0, 0)
		//	expect(_type).never().toThrow()
		//})
		
		test("memory_contained", function() {
			var _before = obj_init.ds_count_all()
			
			var _inst = create(0, 0, obj_ai_vision) // create and destroy again
			instance_destroy(_inst)
			
			var _after =  obj_init.ds_count_all()
			
			expect(_before).toBeEqual(_after)
		})
	})
})