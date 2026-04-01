left = 0
top = 0
width = 15
height = 100

active = true
subfocus = true

scroll_value = 0
parts_margin = 2

colour = c_ltgray
border_colour = c_black
secborder_colour = c_gray

colour_hover = c_white
border_hover_colour = c_black
secborder_hover_colour = c_gray

colour_click = c_gray
border_click_colour = c_black
secborder_click_colour = c_dkgray

bar = create_ui(0, 0, obj_ui_button)
bar.width = width
bar.height = 20

button_up = create_ui(0, 0, obj_ui_button)
button_up.width = width
button_up.height = width
button_up.shape = "triangle_up"

button_down = create_ui(0, 0, obj_ui_button)
button_down.width = width
button_down.height = width
button_down.shape = "triangle_down"

dragging = false
drag_anchor_y = 0

scroll_zone_left = 0
scroll_zone_top = 0
scroll_zone_width = 0
scroll_zone_height = 0