var card_default_height = 100

//Close mapcard
for (var i = 0; i < ds_list_size(cards); i++) {
	var card = cards[|i]
	if (!instance_exists(card)) {
		ds_list_delete(cards, i)
		i --;
	}
}

if (active && subfocus) {
	//Mapcard mouse interaction
	var dragging_card = drag_card != -1
	for (var i = 0; i < ds_list_size(cards); i ++) {
		with (cards[|i]) {
			if (active) {
				//Check click
				hover = false
				click = false
				clicked = false
				clicked_header = false
				clicked_body = false
				hover_header = false
				hover_body = false
			
				if (!dragging_card) {
					var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
					if (point_in_rectangle(mouse[0], mouse[1], left, top, left + width - exit_button.width-2, top + header_height)) {
						hover_header = true
					} else if (point_in_rectangle(mouse[0], mouse[1], left, top + header_height, left + width, top + height-1)) {
						hover_body = true
					}
	
					if (point_in_rectangle(mouse[0], mouse[1], left, top, left + width, top + height)) {
						hover = true
					}
	
					if (hover_header && mouse_check_button_pressed(mb_left)) {
						clicked_header = true
					}
	
					if (hover_body && mouse_check_button_released(mb_left)) {
						clicked_body = true
					}
				}
			}
		}
	}

	//Drag mapcard
	if (drag_card == -1) {
		for (var i = 0; i < ds_list_size(cards); i++) {
			var card = cards[|i];
			card.exit_button.subfocus = true
			if (card.clicked_header) {
				drag_card = card
				var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
				drag_anchor_x = mouse[0] - card.left
				drag_anchor_y = mouse[1] - card.top
				ds_list_delete(cards, i)
				drag_index_from = i
				break
			}
		}
	} else {
		var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
		drag_card.left = mouse[0] - drag_anchor_x
		drag_card.top = mouse[1] - drag_anchor_y
		drag_card.width = width
		drag_card.height += (card_default_height - drag_card.height)/4
		drag_card.map_index = ""
	
		drag_insert_index = -1
		//if (point_in_rectangle(mouse[0], mouse[1], left, top, left + width, top + height)) {
			var close_index = 0
			if (ds_list_size(cards) == 0) {
				close_index = 0
			} else {
				var dist = point_distance(0, mouse[1], 0, cards[|0].top);
				for (var i = 0; i < ds_list_size(cards)+1; i++) {
					if (i < ds_list_size(cards)-1 || (i == 0 && ds_list_size(cards) == 1)) {
						if (cards[|i] != drag_card && point_distance(0, mouse[1], 0, cards[|i].top) < dist) {
							dist = point_distance(0, mouse[1], 0, cards[|i].top)
							close_index = i
						}
					} else {
						if (point_distance(0, mouse[1], 0, cards[|i-1].top + cards[|i-1].height) < dist) {
							dist = point_distance(0, mouse[1], 0, cards[|i-1].top + cards[|i-1].height)
							close_index = i
						}
					}
				}
			}
			drag_insert_index = close_index
		//}
	
		if (mouse_check_button_released(mb_left)) {
			if (drag_insert_index != -1) {
				ds_list_insert(cards, drag_insert_index, drag_card)
				drag_card.height = 0
				drag_card.left = left
				drag_card.top = drag_insert_index == 0 ? top : cards[|drag_insert_index-1].top + cards[|drag_insert_index-1].height
				drag_card = -1
			} else {
				ds_list_insert(cards, drag_index_from, drag_card)
				drag_card.height = 0
				drag_card.left = left
				drag_card.top = drag_index_from == 0 ? top : cards[|drag_index_from-1].top + cards[|drag_index_from-1].height
				drag_card = -1
			}
		}
	
		for (var i = 0; i < ds_list_size(cards); i++) {
			if (cards[|i] != drag_card) {
				cards[|i].exit_button.subfocus = false
			}
		}
	}

	//Determine spacings
	var hover_index = -1
	ds_list_clear(card_spacings)
	for (var i = 0; i < ds_list_size(cards); i++) {
		ds_list_add(card_spacings, 0)
		if (cards[|i].hover) {
			hover_index = i
		}
	}

	if (hover_index != -1) {
		ds_list_replace(card_spacings, hover_index, card_default_height)
	} else {
		if (ds_list_size(cards) > 0) {
			ds_list_replace(card_spacings, ds_list_size(cards)-1, card_default_height)
		}
	}

	for (var i = 0; i < ds_list_size(cards); i++) {
		var card_height = (max_height - card_default_height)/(ds_list_size(cards)-1)
		card_height = clamp(card_height, 0, card_default_height)
		if (card_spacings[|i] == 0) {
			ds_list_replace(card_spacings, i, card_height)
		}
	}
	
	//Positioning
	var y_pos = 0
	for (var i = 0; i < ds_list_size(cards); i++) {
		var card = cards[|i]
		if (card != drag_card) {
			card.left = left
			card.top += ((top + y_pos) - card.top)/4
			card.width = width
			card.height += (card_spacings[|i] - card.height)/4
			y_pos += card_spacings[|i]
			card.map_index = string(i + 1) + ". "
		}
	}

	height = 0
	if (ds_list_size(cards) > 0) {
		var last_card = cards[|(ds_list_size(cards)-1)]
		height = (last_card.top - top) + last_card.height
	} else if (drag_card == -1) {
		height = nomap_height
	}

	//Correction
	if (ds_list_size(cards) > 0) {
		var last_card = cards[|(ds_list_size(cards)-1)]
		if height > max_height last_card.height = max_height - (last_card.top - top)
		last_card.height = clamp(last_card.height, 0, card_default_height)
	}
}

//Synchronize activeness
for (var i = 0; i < ds_list_size(cards); i++) {
	cards[|i].active = active
	cards[|i].subfocus = subfocus
}