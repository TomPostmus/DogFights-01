/// @description The character object represents a character in the world. It can be player controlled or an NPC
// It holds the weapon, movement controller, body and appearance

// References
player = noone
body = noone
weapon = noone
movement = create_controllers(obj_movement_walking)
movement.character = id
appearance = noone

// Rotation variable used for initialization
rotation = 0

// Team ID
team_id = undefined

// Interact focus
interact = false // whether to interact (e.g. if interact key is being pressed)
interact_range = 100 // maximum range to be able to interact with object
interact_focus = undefined // which instance is currently in the interact focus of character (e.g. for pickups)
interact_type = undefined // which object index the focused instance has
interactables = [obj_package, obj_parent_pickups] // array of objects that char can interact with (interactable parent is not used, as it would interfer with physics parent of objects)

// Health constants
hp_max = 100
hp_regen_downtime = 150
hp_regen_amount = 10
hp_regen_time = 80
hp_regen_tick = 0
hp_protection = false // whether HP is protected (i.e. no damage can be done)

// Health state
hp = hp_max
hp_previous = hp_max

// Damage bill
damage_bill = ds_list_create() // list of tuples mapping player to damage dealt [player, damage] like a bill
damage_last_affector = noone // last affector player that dealt damage

// Initialize character
function initialize() {	
	var _vars = {rotation: rotation} // var struct to give to creation
	body = create_groundhigh(x, y, obj_body, _vars)
	body.character = id
	body.appearance = appearance
	body.set_physical(true)
}

// Register damage
function register_damage(_p_affector, _damage) {
	if (!hp_protection) {
		hp -= _damage
		
		if (instance_exists(_p_affector)) { // if affector player was given with bullet
			ds_list_add(damage_bill, [_p_affector, _damage]) // add entry to bill
			damage_last_affector = _p_affector // remember the player as last affector player that dealt damage
		}
	}
}

// Handle pickup of item
function pickup(_item) {
	if (_item.type == "weapon") { // if picking up weapon

		if (instance_exists(weapon))		
			instance_destroy(weapon) // destroy old weapon
			
		weapon = create_controllers(_item.weapon_index) // create new weapon and assign
		weapon.character = id
		weapon.anim_init()
		
	}
	
	instance_destroy(_item) // destroy pickup
}