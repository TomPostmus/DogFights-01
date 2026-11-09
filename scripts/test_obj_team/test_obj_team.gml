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
		
		test("start_spawn_team_characters_no_marker_throws", function() {
			// Arrange
			var _team = create(0, 0, obj_team)
			var _team_size = 2
			
			// Arrange spies
			_team.find_marker_spy = spy(function() { // mock that no marker is found
		        return noone;
		    })
			
			_team.spawn_team_spy = spy(function(_n_characters) { // mock returns empty list
				var _characters = ds_list_create()
		    })
			
			// Override the methods
		    _team.find_start_spawn_marker = method(_team, function() { // bind call to spy to team instance
		        return find_marker_spy.call()
		    })
			
			_team.spawn_team_in_formation = method(_team, function(_n_characters) {
				return spawn_team_spy.call([_n_characters])
			})
			
			// Assert
			expect(_team.start_spawn_team_characters, [_team_size]).toThrow(
				string("Could not start spawn team with id {0}; no start spawn marker found", _team.team_id))
			
			expect(_team.find_marker_spy).toHaveBeenCalledTimes(1)
			
			// Cleanup
			instance_destroy(_team)
			
		})
		
		test("find_start_spawn_marker", function() {
		
			// Arrange
			var _team_id = 5
			var _team = create(0, 0, obj_team)
			_team.team_id = _team_id
			
			// Assert
			expect(_team.find_start_spawn_marker()).toBe(noone)
			
			// Arrange
			var _marker_different_team = create(0, 0, obj_marker_team_spawn, {team_id: 2})
			
			// Assert
			expect(_team.find_start_spawn_marker()).toBe(noone)
			
			// Arrange
			var _marker_same_team = create(0, 0, obj_marker_team_spawn, {team_id: _team_id})
			
			// Assert
			expect(_team.find_start_spawn_marker()).toBe(_marker_same_team)
			
			// Cleanup
			instance_destroy(_team)
			instance_destroy(obj_marker_team_spawn)
		
		})
		
		test("spawn_team_in_formation", function() {
		
			// Arrange
			var _team_size = 10
			var _team = create(0, 0, obj_team)
			create(0, 0, obj_spawns_controller)
			
			// Arrange spy
			obj_spawns_controller.spawn_character_spy = spy(function() {
				return create(0, 0, obj_character)
			})
			
			// Inject spy
			obj_spawns_controller.spawn_character = method(obj_spawns_controller, function() {
				return spawn_character_spy.call()
			})
			
			// Act
			var _characters = _team.spawn_team_in_formation(_team_size, 0, 0, 0)
			
			// Assert
			expect(obj_spawns_controller.spawn_character_spy).toHaveBeenCalledTimes(_team_size)
			expect(ds_list_size(_characters)).toBeEqual(_team_size)
			
			// Cleanup
			ds_list_destroy(_characters)
			instance_destroy(_team)
			instance_destroy(obj_character)
			instance_destroy(obj_spawns_controller)
		
		})
		
		test("spawn_team_in_formation_throws_when_spawns_controller_unexistent", function() {
		
			// Arrange
			var _team = create(0, 0, obj_team)
			
			// Assert
			expect(_team.spawn_team_in_formation, [3, 0, 0, 0]).toThrow(
				"Team could not be spawned; obj_spawns_controller does not exist.")
			
			// Cleanup
			instance_destroy(_team)
			
		})
		
		test("assign_character_to_player", function() {
		
			// Arrange
			var _team = create(0, 0, obj_team)
			var _player = create(0, 0, obj_player)
			var _character = create(0, 0, obj_character)
			
			// Act
			_team.assign_character_to_player(_character, _player)
			
			// Assert
			expect(_player.character).toBe(_character)
			expect(_team.character_to_player[?_character]).toBe(_player)
			
			// Cleanup
			instance_destroy(_team)
			instance_destroy(_player)
			instance_destroy(_character)
		
		})
		
		test("assign_character_to_player_already_assigned_throws", function() {
		
			// Arrange
			var _team = create(0, 0, obj_team)
			var _player1 = create(0, 0, obj_player)
			var _player2 = create(0, 0, obj_player)
			var _character = create(0, 0, obj_character)
			_team.assign_character_to_player(_character, _player1)
			
			// Act
			expect(_team.assign_character_to_player, [_character, _player2]).toThrow(
				string("Cannot assign character {0} to player {1}; already assigned.", _character, _player2))
			
			// Cleanup
			instance_destroy(_team)
			instance_destroy(_player1)
			instance_destroy(_player2)
			instance_destroy(_character)
		
		})
		
		test("unassign_player", function() {
					
			// Arrange
			var _team = create(0, 0, obj_team)
			var _player = create(0, 0, obj_player)
			var _character = create(0, 0, obj_character)
			_team.assign_character_to_player(_character, _player)
			
			// Assert
			expect(ds_map_exists(_team.character_to_player, _character)).toBeTruthy()
			expect(instance_exists(_player.character)).toBeTruthy()
			
			// Act
			_team.unassign_player(_player)
			
			// Assert
			expect(ds_map_exists(_team.character_to_player, _character)).toBeFalsy()
			expect(instance_exists(_player.character)).toBeFalsy()
			
			// Cleanup
			instance_destroy(_team)
			instance_destroy(_player)
			instance_destroy(_character)
		
		})
		
		test("find_first_unassigned_character", function() {
		
			// Arrange
			var _team = create(0, 0, obj_team)
			var _player = create(0, 0, obj_player)
			var _character1 = create(0, 0, obj_character)
			var _character2 = create(0, 0, obj_character)
			ds_list_add(_team.characters, _character1, _character2)
			_team.assign_character_to_player(_character1, _player)
			
			// Assert
			expect(_team.find_first_unassigned_character()).toBe(_character2)
						
			// Cleanup
			instance_destroy(_team)
			instance_destroy(_player)
			instance_destroy(_character1)
			instance_destroy(_character2)
		
		})
		
		test("notify_on_character_kik", function() {
		
			// Arrange
			var _team = create(0, 0, obj_team)
			var _character = create(0, 0, obj_character)
			ds_list_add(_team.characters, _character)
			
			// Act
			_team.notify_on_character_kik(_character, noone)
			
			// Assert
			expect(ds_list_find_index(_team.characters, _character)).toBeEqual(-1)
			
			// Cleanup
			instance_destroy(_team)
			instance_destroy(_character)
		
		})
		
	})
})