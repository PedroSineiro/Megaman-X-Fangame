class_name Player
extends CharacterBody2D

@export
var move_speed: float = 150

@onready
var sprite: AnimatedSprite2D = $PlayerAnimations
#@onready
#var gun_animations: AnimatedSprite2D = $gun_animations

@onready var animator: AnimationPlayer = $AnimationPlayer

@onready
var movement_state_machine: StateMachine = $StateMachine
#@onready
#var gun_state_machine: StateMachine = $gun_state_machine
@onready
var player_state_input = $PlayerInput

func _ready() -> void:
	movement_state_machine.init(self, sprite, player_state_input, animator)
#	gun_state_machine.init(self, gun_animations, player_move_component)

func _unhandled_input(event: InputEvent) -> void:
	movement_state_machine.process_input(event)
#	gun_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	movement_state_machine.process_physics(delta)
#	gun_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_state_machine.process_frame(delta)
#	gun_state_machine.process_frame(delta)
