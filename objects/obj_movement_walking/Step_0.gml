event_inherited()

// Input
lin_motion = player.input.move_input * 2.5
ang_motion = player.input.turn_input
if (player.weapon.aiming) { // when aiming down sights
	lin_motion /= 2 // walk at half movement speed
	ang_motion /= 2 // turn at half the speed
}

// Linear state machine
{
	var forwards_velocity = get_forwards_velocity()
		
	// Always apply sideways friction for steering during walking
	// Forward friction is only applied when stationary
	sideways_friction(lin_static_friction)
	
	if (lin_motion == 0) {																//if no input, switch to idle state by default
		linsm_current = "idle"
	}
	
	if (linsm_current == "idle") {
		leg_pendulum_update()															//update pendulum model for sprite
			
		forward_friction(lin_static_friction)											//apply forward friction
			
		// State guard
		if (lin_motion != 0) {															//switch to try state
			linsm_current = "try"
			lin_retry_timer = 0															//for immediately triggering retry timer
		}
	} else if (linsm_current == "try") {			
		if (lin_retry_timer <= 0) {														//timer event
			lin_kick_force = lin_motion * lin_kick_init_force_factor					//reset kick force
			lin_kick_force *= 1 - clamp(abs(forwards_velocity) - 0.5, 0, 3) / 3			//dampen with factor between 0 and 1, proportional to current forwards vel in lin motion direction (to avoid infinite kick bug, where spamming forward causes player to speed up enormously due to the rapid kicks)
			lin_retry_timer = lin_retry_time											//reset timer
			if (leg_angle == 0) {														//if leg in neutral position, switch leg
				left_leg = !left_leg
			}
			var swing_factor = lin_kick_sprite_pendulum_force_factor * abs(lin_motion)	//factor for pendulum swing
			leg_swing_speed = (left_leg ? 1 : -1)  * swing_factor						//give pendulum a swing
		}
		lin_retry_timer --																//timer update
		
		leg_pendulum_update()															//update pendulum model for sprite
		
		forward_friction(lin_static_friction)
		
		with (player.body.trunk)
			physics_apply_local_force(0, 0, other.lin_kick_force, 0)	//apply kick force to body
		
		lin_kick_force *= lin_kick_force_decay											//lessen kick force
			
		// State guard
		var threshold = abs(forwards_velocity) >= lin_state_switch_threshold			//if forwards velocity below threshold, switch to regular walking behaviour
		if (leg_angle == 0 && threshold) {												//only switch if threshold and leg is in neutral position
			linsm_current = "walk"
			lin_movement_x = left_leg ? pi / lin_movement_period : 0					//if necessary apply offset for logical flow into walk state
		}
	} else if (linsm_current == "walk") {		
		var movement_phase = sin(lin_movement_x * lin_movement_period)					//compute movement phase with sine function
		var _movement_factor = clamp(abs(get_forwards_velocity()) * 3, 3, 9)			// factor of leg swing, clamped between minimal value (to avoid slow motion swinging) and maximum (to avoid hyper fast swinging)
		var _amplitude = _movement_factor												// amplitude of leg swinging
		if (lin_motion < 0)
			_amplitude *= 0.7															// for backwards movement, dampen swing amplitude slightly
		
		lin_movement_x += _movement_factor * 0.28
		leg_swing_speed = movement_phase * _amplitude
		left_leg = movement_phase > 0													//calculate current swinging leg, necessary for smooth transition to other states
		
		leg_pendulum_update()															//update pendulum model for sprite
		
		var phase_force_factor = 1 - lin_movement_phase_depth * abs(movement_phase)		//phase factor on pid reference for bobbing effect
		var phased_reference = lin_motion * phase_force_factor							
		var pid_force = lin_pid.get(forwards_velocity, phased_reference)				//get pid output
		with (player.body.trunk)
			physics_apply_local_force(0, 0, pid_force, 0)								//apply force to body
			
		// State guard
		var threshold = abs(forwards_velocity) < lin_state_switch_threshold				//if forwards velocity below threshold, switch to trying behaviour
		if (threshold) {
			linsm_current = "try"														//switch to try state
			lin_retry_timer = 0															//for immediately triggering retry timer
		}
	}
}

// Angular movement
//turn_speed += clamp(ang_motion - turn_speed, -turn_speed_max_change, turn_speed_max_change)
//player.body.rotation += turn_speed	//update body rotation

var torque = ang_pid.get(player.body.get_trunk_speed_rot(), ang_motion * 2.5) // angular PID (desired round time 1.98s)
with (player.body.trunk) physics_apply_torque(-torque)

/*var reference_error = -ang_motion*250 - turn_speed // calculate reference for smooth reference
turn_speed += sign(reference_error) * min(abs(reference_error), 25) // update smooth reference
var torque = ang_pid.get(player.body.trunk.phy_angular_velocity, turn_speed) // angular PID (desired round time 1.98s)
with (player.body.trunk) physics_apply_torque(torque)*/

// Set leg angle in appearance animation state
player.appearance.set_leg_angle(leg_angle)