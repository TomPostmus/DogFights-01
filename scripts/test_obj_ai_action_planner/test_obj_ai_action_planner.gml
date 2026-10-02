suite(function () {
	section("obj_ai_action_planner", function() {
		test("memory_contained", function() {			
			test_memory_contained(obj_ai_action_planner)
		})
		
		
		test("compute_defense_power_gun_goodweather", function() {
			// Arrange
			var _gun = create(0, 0, obj_weapon_gun)
			var _hp_max = 100 // pin on 100, might change to central definition later
			
			_gun.stats.damage = _hp_max // mock weapon
			_gun.ammo_reserve = 3
			_gun.ammo_mag = 1
			
			// Act
			var _defpow = obj_ai_action_planner.compute_defense_power(_gun, _hp_max)
			
			// Assert
			expect(_defpow).toBeEqual(4)
			
			// Cleanup
			instance_destroy(_gun)
		})
		
		test("compute_defense_power_gun_no_ammo", function() {
			// Arrange
			var _gun = create(0, 0, obj_weapon_gun)
			var _hp_max = 100
			_gun.stats.damage = _hp_max // assure non-zero damage
			_gun.ammo_reserve = 0 // assure no bullets
			_gun.ammo_mag = 0
			
			// Act
			var _defpow = obj_ai_action_planner.compute_defense_power(_gun, _hp_max)
			
			// Assert
			expect(_defpow).toBeEqual(0)
		})
		
		test("compute_defense_power_melee", function() {
			// Arrange
			var _weapon = create(0, 0, obj_weapon_melee)
			var _hp_max = 100
			_weapon.stats.damage = _hp_max
			
			// Assert
			expect(obj_ai_action_planner.compute_defense_power, [_weapon, _hp_max]).toThrow() // expect to throw 'not implemented' error
		})
	})
})