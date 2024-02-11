extends State

@export
var dash_state: State
@export
var fall_state: State
@export
var idle_state: State
@export
var jump_state: State

func process_input(_event: InputEvent) -> State:
	if state_input.get_start_dash_input():
		print("dash")
		return dash_state
	
	return null

func process_physics(delta: float) -> State:
	if state_input.get_jump_input() and parent.is_on_floor():
		return jump_state

	parent.velocity.y += gravity * delta

	var movement = state_input.get_movement_direction() * parent.move_speed
	
	if movement == 0:
		return idle_state
	
	sprite.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
