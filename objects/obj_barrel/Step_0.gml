var max_linear_friction = 0.3;
var capped_linear_velocity = min(max_linear_friction, point_distance(0, 0, phy_speed_x, phy_speed_y));
phy_speed_x -= lengthdir_x(capped_linear_velocity, point_direction(0, 0, phy_speed_x, phy_speed_y))
phy_speed_y -= lengthdir_y(capped_linear_velocity, point_direction(0, 0, phy_speed_x, phy_speed_y))
var max_angular_friction = 180
phy_angular_velocity -= sign(phy_angular_velocity) * min(max_angular_friction, abs(phy_angular_velocity))