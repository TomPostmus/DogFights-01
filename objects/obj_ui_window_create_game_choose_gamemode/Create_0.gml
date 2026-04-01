event_inherited()

width = 400
title = "Choose a game mode"
backg_colour = $FFD64848//$FFAF5200
border_colour = $FFD64848//$FFAF5200
corner_size = 0

ui_window_create_exit_button()

/*
ok_button = create_ui(0, 0, obj_ui_button)
ok_button.icon = spr_ui_icon_checkmark
ok_button.text = "Ok"

ok_button.width = 70
ok_button.height = 20

ok_button.colour = $FF00FFFA
ok_button.secborder_colour = $FFBFFFFD


ui_window_add_element(ok_button, width - 10 - ok_button.width, height - 10 - ok_button.height)
*/

gamemodeselection = create_ui(0, 0, obj_ui_gamemodeselection)
gamemodeselection.width = width - 20
gamemodeselection.height = height - 40

ui_window_add_element(gamemodeselection, 10, 30)

scrollbar = create_ui(0, 0, obj_ui_scrollbar)
scrollbar.width = 15
scrollbar.height = gamemodeselection.height - 20

scrollbar.colour = $FF59FFFF
scrollbar.secborder_colour = $FF47BCBC

scrollbar.colour_hover = $FFC1FFFF
scrollbar.secborder_hover_colour = $FF47BCBC

scrollbar.colour_click = $FF45CCCC
scrollbar.secborder_click_colour = $FF47BCBC

scrollbar.bar.height = 60

scrollbar.scroll_zone_left = left
scrollbar.scroll_zone_top = top
scrollbar.scroll_zone_width = width
scrollbar.scroll_zone_height = height

ui_window_add_element(scrollbar, width - 20 - scrollbar.width, 40)