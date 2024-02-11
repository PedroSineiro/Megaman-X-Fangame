# You could also declare a class_name for the move state
# so you don't have to reference the script directly
extends State

@export
var move_state: State
@export
var fall_state: State
@export
var idle_state: State
@export
var jump_state: State

@export
var dash_time : float = 1
@export
var dash_speed: float = 300

var initial_direction : float
var end_dash: bool

func enter() -> void:
	super()

	end_dash = false
	dash_timer()

	# Simple check for which initial_direction to dash towards
	if sprite.flip_h:
		initial_direction = -1
	else:
		initial_direction = 1


func process_physics(delta: float) -> State:
	if !state_input.get_dash_input():
		print("dash_input")
		if state_input.get_movement_direction() == 0:
			return idle_state
		return move_state
	
	if !parent.is_on_floor():
		return fall_state
	
	if state_input.get_jump_input() and parent.is_on_floor():
		return jump_state
	
	if state_input.get_movement_direction() == -initial_direction:
		print("move_input")
		return move_state
	
	if end_dash:
		print("idle")
		return idle_state
	
	parent.velocity.y += gravity * delta
	parent.velocity.x = initial_direction * dash_speed
	parent.move_and_slide()

	return null

func dash_timer() -> void:
	await get_tree().create_timer(dash_time).timeout
	end_dash = true