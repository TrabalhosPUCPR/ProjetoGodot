extends Node3D

@export var light_left_on: bool = true
@export var light_right_on: bool = true

func _ready() -> void:
	if not light_left_on:
		for child in $LightLeft.get_children():
			(child as SpotLight3D).light_energy = 0
	if not light_right_on:
		for child in $LightRight.get_children():
			(child as SpotLight3D).light_energy = 0
