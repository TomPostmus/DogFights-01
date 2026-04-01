// This is the death particles object that keeps track of the particle group that spawns when player dies

part_radius = 32 // radius at which repulsion starts
part_attr_radius = 100 // radius at which attraction starts
part_t = 0 // this is the input t for the particle sine movement (as in sin(t))
collisions = ds_list_create() // list of objects that are colliding with collision mask of this particle handler object

// Constructor for particle struct
function part() constructor {
	var _xbody = irandom_range(-5, 5); // relative location on body
	var _ybody = irandom_range(-15, 10);
	xp = other.x + lengthdir_x(_xbody, other.rotation + 90) + lengthdir_x(_ybody, other.rotation) // absolute location (taking rotation into account)
	yp = other.y + lengthdir_y(_xbody, other.rotation + 90) + lengthdir_y(_ybody, other.rotation)
	xv = other.speed_x + lengthdir_x(degtorad(other.rotation_vel) * _xbody, other.rotation + 180) + lengthdir_x(degtorad(other.rotation_vel) * _ybody, other.rotation + 90)
	yv = other.speed_y + lengthdir_y(degtorad(other.rotation_vel) * _xbody, other.rotation + 180) + lengthdir_y(degtorad(other.rotation_vel) * _ybody, other.rotation + 90)
	sin_amp = 0.0001//random_range(0.00005, 0.00013) // amplitude of sine function
	sin_scale = 1 / 100 // time scale of sine function
	sin_xshift = random_range(0, 2 * pi) // shift in sine function
	sin_yshift = random_range(0, 2 * pi)
	alpha = 1
	alpha_dimstep = random_range(0.002, 0.007) //how much to dimish alpha each step
	radius = other.part_radius
}

parts_num = 5
parts = ds_list_create() // array with particles for this effect
repeat(parts_num)
	ds_list_add(parts, new part()) // populate list with new particles