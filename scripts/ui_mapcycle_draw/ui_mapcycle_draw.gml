/// @param mapselection
function ui_mapcycle_draw() {

	var mapselection = argument[0];
	if (ds_list_size(mapselection.cards) == 0 && mapselection.drag_card == -1) {
		draw_set_colour(c_black)
		draw_set_alpha(0.3)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_rectangle(mapselection.left, mapselection.top-1, mapselection.left + mapselection.width-1, mapselection.top + mapselection.height-1, false)
		draw_set_colour(c_white)
		draw_set_alpha(1)
		draw_text_ext(mapselection.left + mapselection.width/2, mapselection.top + mapselection.height/2, mapselection.nomap_text, 20, 180)
		draw_set_alpha(1)
	
		//Mapcycle border
		draw_set_colour(mapselection.active ? mapselection.border_colour : mapselection.border_colour_inactive)
		draw_rectangle(mapselection.left, mapselection.top-1, mapselection.left + mapselection.width-1, mapselection.top + mapselection.height-1, true)
	} else {
		//Mapcycle border
		draw_set_colour(mapselection.active ? mapselection.border_colour : mapselection.border_colour_inactive)
		draw_rectangle(mapselection.left, mapselection.top-1, mapselection.left + mapselection.width-1, mapselection.top + mapselection.height-1, true)

		for (var i = 0; i < ds_list_size(mapselection.cards); i++) {
			var card = mapselection.cards[|i];
			ui_mapcard_draw(card)
	
			if (mapselection.drag_card != -1 && mapselection.drag_insert_index != -1 && i == mapselection.drag_insert_index) {
				draw_set_color(card.border_hover_colour)
				draw_line(card.left-1, card.top-1, card.left-1 + card.width, card.top-1)
				draw_sprite(spr_ui_icon_insertarrow, 0, card.left - 5, card.top)
			}
		}

		if (mapselection.drag_card != -1 && mapselection.drag_insert_index == ds_list_size(mapselection.cards)) {
			//card = mapselection.cards[|ds_list_size(mapselection.cards)-1];
			draw_set_color(mapselection.drag_card.border_hover_colour)
			//draw_line(card.left-1, card.top-1 + card.height, card.left-1 + card.width, card.top-1 + card.height)
			draw_line(mapselection.left-1, mapselection.top-1 + mapselection.height, mapselection.left-1 + mapselection.width, mapselection.top-1 + mapselection.height)
			draw_sprite(spr_ui_icon_insertarrow, 0, card.left - 5, card.top + card.height)
		}

		if (mapselection.drag_card != -1) {
			ui_mapcard_draw(mapselection.drag_card)
		}
	}

	draw_set_colour(c_white)


}
