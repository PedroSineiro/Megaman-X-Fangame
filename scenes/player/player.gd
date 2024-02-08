extends CharacterBody2D
class_name Player


@export var move_speed: float = 150.0
@export var jump_velocity: float = 400.0

@onready var anim: AnimationPlayer = $AnimationPlayer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_velocity
		anim.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: float = Input.get_axis("left", "right")
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * move_speed
		if velocity.y == 0:
			anim.play("Run")
		elif velocity.y > 0:
			anim.play("Fall")
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		if velocity.y == 0:
			anim.play('Idle')
		elif velocity.y > 0:
			anim.play("Fall")
		

	move_and_slide()
