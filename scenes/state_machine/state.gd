class_name State
extends Node

@export
var animation_name: String

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var sprite: AnimatedSprite2D
var state_input: StateInput
var parent: Player
var animator: AnimationPlayer
	

func enter() -> void:
	animator.play(animation_name)

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	
	return null

func process_physics(_delta: float) -> State:
	
	return null


#func get_movement_input() -> float:
#	return move_component.get_movement_direction()

#func get_jump() -> bool:
#	return move_component.wants_jump()
