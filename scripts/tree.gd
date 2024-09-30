extends Node3D

enum TreeType { CHERRY, GREEN, GREENER }
@export var tree_type: TreeType = TreeType.CHERRY

func _ready() -> void:
	if tree_type == TreeType.GREENER:
		$"Cherry Tree".queue_free()
		$"Normal Tree".queue_free()
		$"Normal Tree Greener".visible = true
	elif tree_type == TreeType.GREEN:
		$"Cherry Tree".queue_free()
		$"Normal Tree".visible = true
		$"Normal Tree Greener".queue_free()
	else:
		$"Cherry Tree".visible = true
		$"Normal Tree".queue_free()
		$"Normal Tree Greener".queue_free()
	
