// For an object, check if all its data structures get cleaned up when destroying it
function test_memory_contained(obj){
	var _before = obj_debug.ds_count_all()
			
	var _inst = create(0, 0, obj) // create and destroy again
	instance_destroy(_inst)
			
	var _after =  obj_debug.ds_count_all()
			
	expect(_before).toBeEqual(_after)
	
	instance_destroy(_inst)
}