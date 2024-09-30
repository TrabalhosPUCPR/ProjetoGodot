extends CharacterBody3D

@export var player: Node3D

@export var speed: float = 10.
@export var acceleration: float = 5.
@export var max_player_distance: float = 15.

var walking = false

func _physics_process(delta: float) -> void:
	var player_distance = position.distance_to(player.position)
	var direction = (player.position - position).normalized()
	$Pivot.basis = lerp($Pivot.basis, Basis.looking_at(direction), delta * acceleration)
	if player_distance > max_player_distance:
		if not walking:
			$Pivot/Shiba/AnimationPlayer.play("walk")
			walking = true
		velocity.x = lerp(velocity.x, direction.x * speed, acceleration * delta)
		velocity.z = lerp(velocity.z, direction.z * speed, acceleration * delta)
	else:
		velocity = lerp(velocity, Vector3.ZERO, acceleration * delta)
		if walking:
			$Pivot/Shiba/AnimationPlayer.play("idle")
			walking = false
	move_and_slide()
