extends CharacterBody3D

@export var acceleration = 5.
@export var sprint_speed = 35.
@export var walk_speed = 15.
@export var jump_strength = 35.5
@export var gravity = 100.

@onready var _model: Node3D = $Pivot/boneco 

func _physics_process(delta: float) -> void:
	
	var move_direction = Vector3.ZERO
	move_direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	move_direction.z = Input.get_action_strength("Backward") - Input.get_action_strength("Forward")

	if move_direction != Vector3.ZERO:
		move_direction = move_direction.normalized()
		move_direction = move_direction.rotated(Vector3.UP, $SpringArm3D.rotation.y)
		$Pivot.basis = lerp($Pivot.basis, Basis.looking_at(move_direction), delta * acceleration)
	var speed: float
	if Input.is_action_pressed("Sprint"):
		speed = sprint_speed
	else:
		speed = walk_speed
	
	var current_velocity = Vector3.ZERO
	current_velocity.x = move_direction.x * speed
	current_velocity.z = move_direction.z * speed
	
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			velocity.y = jump_strength
		else:
			velocity.y = 0
	else:
		velocity.y -= gravity * delta
		
	if velocity != current_velocity:
		velocity.x = lerp(velocity.x, current_velocity.x, delta * acceleration)
		velocity.z = lerp(velocity.z, current_velocity.z, delta * acceleration)
	move_and_slide()

func _process(delta: float) -> void:
	$SpringArm3D.position.x = position.x
	$SpringArm3D.position.z = position.z
	$SpringArm3D.set_camera_height(position.y)
