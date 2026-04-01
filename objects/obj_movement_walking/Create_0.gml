event_inherited()

//Three states:
//	- idle: no input, no movement
//	- try: trying single leg kick, retry automatically if retry timer expires. If velocity is high enough, switch to walk state
//	- walk: regular walking motion. If velocity gets too low, switch back to try state

//Pendulum model: pendulum-like model for leg sprites for naturally swinging back legs. Used in idle and try state
//Sine model: used in walk state to periodically swing legs

// Player reference
player = noone

// Movement constants
lin_static_friction = 0.35					//linear friction when standing still

ang_pid = new pid(2, 1.5, 0.03, 3000)//new pid(0.06, 0.04, 0.001, 300)	//pid object for angular movement
turn_speed = 0								//speed to update body rotation with
turn_speed_max_change = 25					//maximal value to update turn speed with

lin_pid = new pid(9, 0, 0, 0)				//pid object for linear movement

lin_kick_init_force_factor = 11				//factor on lin_motion (linear input) for initial try kick force
lin_kick_force_decay = 0.93					//decay factor on try force
lin_kick_sprite_pendulum_force_factor = 4	//factor on lin_motion (linear input) try kick in pendulum sprite model 
lin_retry_time = 40							//time after which to retry
lin_state_switch_threshold = 0.1			//speed threshold for switching between trying and walking
lin_movement_period = 0.08					//period for walking sine function
lin_movement_phase_depth = 0.32				//magnitude of bobbing effect during walking movement

function lin_movement_amplitude() {			//function that computes maximum amplitude of leg swing
	if (lin_motion > 0) {
		return min(30 + abs(get_forwards_velocity()) * 15, 90)
	}
	return min(30 + abs(get_forwards_velocity()) * 10, 90)
}

leg_gravity = 4.5							//virtual gravity on legs for pendulum model

// Movement state
leg_angle = 0								//virtual angle (degrees) of left leg
leg_swing_speed = 0							//speed at which the leg is swung
left_leg = true								//whether to kick left leg
lin_kick_force = 0							//kick force in trying state
lin_retry_timer = 0							//retry timer
lin_movement_x = 0							//input for sine function of walking state

lin_motion = 0								//how much forward motion
ang_motion = 0								//how much angular motion
angular_pid_smooth_reference = 0			//smooth reference of angular pid, for smoother looking turn

//Helper functions
{
	function forward_friction(_max_friction) {
		with (player.body) {
			var forwards_velocity = get_speed() * dcos(angle_difference(get_speed_dir(), get_trunk_rotation()));
			var capped_forwards_velocity = min(_max_friction, abs(forwards_velocity)) * sign(forwards_velocity);
			add_speed(-lengthdir_x(capped_forwards_velocity, get_trunk_rotation()),
				-lengthdir_y(capped_forwards_velocity, get_trunk_rotation()))
		}
	}

	function sideways_friction(_max_friction) {
		with (player.body) {
			var sideways_velocity = get_speed() * dcos(angle_difference(get_speed_dir(), get_trunk_rotation() - 90))
			var capped_linear_velocity = min(_max_friction, abs(sideways_velocity)) * sign(sideways_velocity);
			add_speed(-lengthdir_x(capped_linear_velocity, get_trunk_rotation() - 90),
				-lengthdir_y(capped_linear_velocity, get_trunk_rotation() - 90))
		}
	}

	function get_forwards_velocity() {
		with (player.body) {
			return get_speed() * dcos(angle_difference(get_speed_dir(), get_trunk_rotation()));
		}
	}
	
	// Update leg sprite according to 'pendulum' model
	function leg_pendulum_update() {
		leg_swing_speed -= dsin(leg_angle) * leg_gravity									//apply gravity to swing speed
		leg_angle += leg_swing_speed														//update angle
		if (left_leg) {																		//cap depending on which leg is swinging
			leg_angle = max(0, leg_angle)
		} else {
			leg_angle = min(0, leg_angle)
		}
		leg_angle = clamp(leg_angle, -lin_movement_amplitude(), lin_movement_amplitude())	//clamp in amplitude range
	}
}

linsm_current = "idle"						//linear movement state machine current state