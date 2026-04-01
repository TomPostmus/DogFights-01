event_inherited()

has_title = false
header = false
height = 80
width = 250
corner_size = 20

backg_colour = WINDOW_RED_COLOUR

description = true
description_text = "description"
description_obj = undefined
description_line_obj = undefined

loader = create_ui(0, 0, obj_ui_loader)
loader.colour = WINDOW_RED_SECCOLOUR

ui_window_add_element(loader, height/2, height/2 - 2)

loading_text_obj = create_ui(0, 0, obj_ui_text)
loading_text_obj.text = "Loading..."
loading_text_obj.halign = fa_left
loading_text_obj.colour = c_white
loading_text_obj.font = ft_menu_title

ui_window_add_element(loading_text_obj, height/2 + 30, height/2 - 3)