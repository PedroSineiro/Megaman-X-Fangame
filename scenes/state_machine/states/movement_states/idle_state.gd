extends State

@export
var dash_state: State
@export
var fall_state: State
@export
var jump_state: State
@export
var move_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(_event: InputEvent) -> State:
	if state_input.get_jump_input() and parent.is_on_floor():
		return jump_state
	if state_input.get_movement_direction() != 0.0:
		return move_state
	if state_input.get_dash_input():
		print("dash")
		return dash_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
