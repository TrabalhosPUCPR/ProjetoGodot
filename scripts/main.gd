extends Node
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit Game"):
		get_tree().quit()
