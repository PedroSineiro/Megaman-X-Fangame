extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State

@export
var jump_force: float = 400.0

func enter() -> void:
	super()
	parent.velocity.y = -jump_force

func process_physics(delta: float) -> State:
	
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = state_input.get_movement_direction() * parent.move_speed
	
	if movement != 0:
		sprite.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()	
	
	if parent.is_on_floor():
		if state_input.get_movement_direction() != 0:
			return move_state
		return idle_state
	
	return null

