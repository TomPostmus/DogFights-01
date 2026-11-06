suite(function () {
	section("obj_team", function() {		
		test("memory_contained", function() {
			test_memory_contained(obj_team)
		})
		
		test("assign_player_to_team", function() {
			// Arrange
			var _team_id = 3
			var _player = create(0, 0, obj_player)
			var _team = create(0, 0, obj_team)
			_team.team_id = _team_id
			
			// Assert
			expect(ds_list_empty(_team.players)).toBeTruthy()
			
			// Act
			expect(_team.assign_player_to_team, [_player]).never().toThrow()
			
			// Assert
			expect(ds_list_size(_team.players)).toBeEqual(1)
			expect(_team.players[|0]).toBe(_player)
			expect(_player.team_id).toBeEqual(_team_id)
			
			// Cleanup
			instance_destroy(_player)
			instance_destroy(_team)
		})
		
		test("assign_player_to_team_reassign_throws", function() {
			// Arrange
			var _player = create(0, 0, obj_player)
			var _team = create(0, 0, obj_team)
			_team.team_id = 0
			_team.assign_player_to_team(_player)
			
			// Act
			expect(_team.assign_player_to_team, [_player]).toThrow(
				"Player's team_id is expected to be -1, is 0. Cannot reassign player to a team")
			
			// Cleanup
			instance_destroy(_player)
			instance_destroy(_team)
		
		})
	})
})