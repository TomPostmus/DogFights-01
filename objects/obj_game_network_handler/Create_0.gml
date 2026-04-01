//External definitions
tcp_socket = undefined
server_tcp_socket = undefined
udp_socket = undefined
udp_port = undefined
server_address = undefined
server_udp_port = undefined
room_index = undefined
game_number = undefined
game_obj = undefined
player_id_slots = undefined

local_players = ds_map_create()
all_players = ds_map_create()
request_number_to_player = ds_map_create()
players_requested_id = ds_list_create()
players_request_number = 0
request_begin_state = true
players_queue_positions = ds_map_create()

transmit_tick = 0
local_players_hp = ds_map_create()