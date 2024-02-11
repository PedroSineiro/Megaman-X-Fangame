class_name StateInput
extends Node

# Return the desired direction of movement for the character
# in the range [-1, 1], where positive values indicate a desire
# to move to the right and negative values to the left.
func get_movement_direction() -> float: #float
	push_error("UNIMPLEMENTED ERROR: StateInput.get_movement_direction")
	return 0

# Return a boolean indicating if the character wants to jump
func get_jump_input() -> bool: #bool
	push_error("UNIMPLEMENTED ERROR: StateInput.get_jump_input")
	return false

func get_start_dash_input() -> bool:
	push_error("UNIMPLEMENTED ERROR: StateInput.get_start_dash_input")
	return false

func get_dash_input() -> bool:
	push_error("UNIMPLEMENTED ERROR: StateInput.get_dash_input")
	return false

func get_shoot_input() -> bool:
	push_error("UNIMPLEMENTED ERROR: StateInput.get_shoot_input")
	return false
