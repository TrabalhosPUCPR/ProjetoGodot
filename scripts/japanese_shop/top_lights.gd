extends Node3D

func _init() -> void:
	randomize()

func _on_timer_timeout() -> void:
	var rand_amt = randf() * 8
	$SpotLight3D3.light_energy = rand_amt
	$Timer.start(rand_amt/20)
