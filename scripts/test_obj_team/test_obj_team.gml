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
		
		test("start_spawn_team_characters", function() {
			// Arrange
			var _team = create(0, 0, obj_team)
			var _team_size = 2
			
			// Arrange spies
			_team.find_marker_spy = spy(function() { // mock that a marker is found
		        return create(0, 0, obj_marker_team_spawn);
		    })
			
			_team.spawn_team_spy = spy(function(_n_characters) { // mock n characters are spawned
				
				var _characters = ds_list_create()
				repeat(_n_characters)
					ds_list_add(_characters, create(0, 0, obj_character))
					
		        return _characters;
				
		    })
			
			// Override the methods
		    _team.find_start_spawn_marker = method(_team, function() { // bind call to spy to team instance
		        return find_marker_spy.call()
		    })
			
			_team.spawn_team_in_formation = method(_team, function(_n_characters) {
				return spawn_team_spy.call([_n_characters])
			})
			
			// Act 
			expect(_team.start_spawn_team_characters, [_team_size]).never().toThrow()
			
			// Assert
			expect(_team.find_marker_spy).toHaveBeenCalledTimes(1)
			expect(_team.spawn_team_spy).toHaveBeenCalledTimes(1)
			expect(ds_list_size(_team.characters)).toBeEqual(_team_size)
			
			// Cleanup
			instance_destroy(_team)
			instance_destroy(obj_marker_team_spawn)
			instance_destroy(obj_character)
			
		})
		
	})
})