event_inherited()

heat -= 0.01
//colour = make_color_rgb(255, 255 /*clamp(255 * heat, 0, 255)*/, 0)

tail.colour = colour
tail.colour_alpha = heat
tail.cap = min(128, point_distance(x, y, initial_x, initial_y))