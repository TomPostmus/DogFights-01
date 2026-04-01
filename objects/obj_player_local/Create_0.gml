event_inherited()

// Test state
type = "dog"
movement_mode = "walking"

weapon = create_controllers(obj_weapon_gun_usp)//create_controllers(choose(obj_weapon_gun_lupara, obj_weapon_gun_striker, obj_weapon_gun_usp))
weapon.player = id
weapon.anim_init()
weapon.set_mod("barrel", "silencer")
appearance = create_controllers(obj_appearance)
appearance.player = id