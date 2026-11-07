ds_list_destroy(players)
ds_list_destroy(players_active)

// TODO: according to my design, the lobby should manage the game and therefore cleanup the game
// However, that leads to problems when suddenly calling game_end(), because then this event gets called twice and the data structures to longer exist
//if (instance_exists(game))
//	instance_destroy(game)