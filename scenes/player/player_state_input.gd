extends StateInput

# Return the desired direction of movement for the character
# in the range [-1, 1], where positive values indicate a desire
# to move to the right and negative values to the left.
func get_movement_direction() -> float:
	return Input.get_axis('left', 'right')

# Return a boolean indicating if the character wants to jump
func get_jump_input() -> bool:
	return Input.is_action_just_pressed('jump')

func get_start_dash_input() -> bool:
	return Input.is_action_just_pressed("dash")

func get_dash_input() -> bool:
	return Input.is_action_pressed("dash")

func get_shoot_input() -> bool:
	return Input.is_action_just_pressed("shoot")
