suite(function () {
	section("obj_game_teambattle", function() {
		
		test("memory_contained", function() {
			test_memory_contained(obj_game_teambattle)
		})
		
		test("initialize_teams", function() {
			// Arrange
			var _teams_number = 2			
			var _game = create(0, 0, obj_game_teambattle)
			
			// Act
			expect(_game.initialize_teams, [_teams_number]).never().toThrow()
			
			// Assert
			expect(ds_list_size(_game.teams)).toBeEqual(_teams_number)
			expect(instance_exists(_game.teams[|0])).toBeTruthy()
			expect(instance_exists(_game.teams[|1])).toBeTruthy()
			expect(_game.teams[|0].team_id).toBe(0)
			expect(_game.teams[|1].team_id).toBe(1)
			
			// Cleanup
			instance_destroy(_game)
		})
		
		test("cleans_up_teams", function() {
			// Arrange
			var _teams_number = 2			
			var _game = create(0, 0, obj_game_teambattle)
			_game.initialize_teams(_teams_number)
			
			var _team1 = _game.teams[|0]
			var _team2 = _game.teams[|1]
			
			// Act
			instance_destroy(_game)
			
			// Assert
			expect(instance_exists(_team1)).toBeFalsy()
			expect(instance_exists(_team2)).toBeFalsy()
		})
		
		test("initialize_teams_reinitialize_throws", function() {
			// Arrange
			var _game = create(0, 0, obj_game_teambattle)
			_game.initialize_teams(1)
			
			// Assert
			expect(_game.initialize_teams, [1]).toThrow()
				
			// Cleanup
			instance_destroy(_game)		
		})
		
		test("compute_team_size_uniform_with_remainder", function() {
			var _game = create(0, 0, obj_game_teambattle)
		
			var _team_sizes = _game.compute_team_size_uniform_with_remainder(2, 4)
			expect(array_length(_team_sizes)).toBeEqual(2)
			expect(_team_sizes[0]).toBeEqual(2)
			expect(_team_sizes[1]).toBeEqual(2)
			
			_team_sizes = _game.compute_team_size_uniform_with_remainder(2, 5)
			expect(array_length(_team_sizes)).toBeEqual(2)
			expect(_team_sizes[0]).toBeEqual(3)
			expect(_team_sizes[1]).toBeEqual(2)
			
			_team_sizes = _game.compute_team_size_uniform_with_remainder(2, 0)
			expect(array_length(_team_sizes)).toBeEqual(2)
			expect(_team_sizes[0]).toBeEqual(0)
			expect(_team_sizes[1]).toBeEqual(0)
			
			_team_sizes = _game.compute_team_size_uniform_with_remainder(3, 2)
			expect(array_length(_team_sizes)).toBeEqual(3)
			expect(_team_sizes[0]).toBeEqual(1)
			expect(_team_sizes[1]).toBeEqual(1)
			expect(_team_sizes[2]).toBeEqual(0)
			
			expect(_game.compute_team_size_uniform_with_remainder, [0, 2]).toThrow(
				"Cannot compute team sizes; n_teams smaller than or equal to 0.")
			expect(_game.compute_team_size_uniform_with_remainder, [2, -1]).toThrow(
				"Cannot compute team sizes; n_players smaller than 0.")
				
			// Cleanup
			instance_destroy(_game)
		})
		
		test("initial_player_team_assignment", function() {
			// Arrange
			var _teams_number = 2
			var _game = create(0, 0, obj_game_teambattle)
			_game.initialize_teams(_teams_number)
			
			var _team1 = _game.teams[|0]
			var _team2 = _game.teams[|1]
			
			//var _assign_func1 = spy(_team1.assign_player_to_team) // wrap with spy
			//var _assign_func2 = spy(_team2.assign_player_to_team)
			//_team1.assign_player_to_team = function(_player) {_assign_func1.call([_player])}
			//_team2.assign_player_to_team = function(_player) {_assign_func2.call([_player])}
			
			var _players = ds_list_create()
			var _player1 = create(0, 0, obj_player)
			var _player2 = create(0, 0, obj_player)
			var _player3 = create(0, 0, obj_player)
			ds_list_add(_players, _player1, _player2, _player3)
			
			// Act
			expect(_game.initial_player_team_assignment, [_players]).never().toThrow()
			//expect(_assign_func1).toHaveBeenCalled()
			//expect(_assign_func2).toHaveBeenCalled()
			expect(_player1.team_id).never().toBeEqual(-1)
			expect(_player2.team_id).never().toBeEqual(-1)
			expect(_player3.team_id).never().toBeEqual(-1)
			
			// Cleanup
			instance_destroy(_game)
			instance_destroy(_player1)
			instance_destroy(_player2)
			instance_destroy(_player3)
		})
		
		test("notify_on_character_kik", function() {
		
			// Arrange
			var _game = create(0, 0, obj_game_teambattle)
			_game.initialize_teams(2)
			var _team1 = _game.teams[|0]
			var _team2 = _game.teams[|1]
			
			var _player = create(0, 0, obj_player)
			_team1.assign_player_to_team(_player)
			var _character = create(0, 0, obj_character)
			ds_list_add(_team1.characters, _character)
			_character.team_id = _team1.team_id
			_team1.assign_character_to_player(_character, _player)
			
			var _kikker = create(0, 0, obj_player)
			var _kikker_same_team = create(0, 0, obj_player)
			_team2.assign_player_to_team(_kikker)
			_team1.assign_player_to_team(_kikker_same_team) // assign to same team as player
			
			var _score2_before = _team2.score_
			
			// Arrange spy for end criterion
			_game.end_criterion_spy = spy(function () {})
			_game.check_end_criterion = method(_game, function () {end_criterion_spy.call()})
			
			// Act 
			_game.notify_on_character_kik(_character, _kikker) // kikker kiks character
			expect(_game.end_criterion_spy).toHaveBeenCalledTimes(1)
			
			// Assert
			expect(_team2.score_).toBeEqual(_score2_before + 1)
			
			var _score1_before = _team1.score_
			_score2_before = _team2.score_
			
			// Act 
			_game.notify_on_character_kik(_character, _kikker_same_team) // kikker kiks character from same team
			
			// Assert
			expect(_team1.score_).toBeEqual(_score1_before)
			expect(_team2.score_).toBeEqual(_score2_before)
						
			// Cleanup
			instance_destroy(_game)
			instance_destroy(_player)
			instance_destroy(_kikker)
			instance_destroy(_kikker_same_team)
			instance_destroy(_character)
		
		})
		
	})
})