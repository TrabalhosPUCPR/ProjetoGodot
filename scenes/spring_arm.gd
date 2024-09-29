extends SpringArm3D

@export var mouse_sensitivity = 0.05

@export var min_camera_distance = 4
@export var max_camera_distance = 50

@export var min_camera_height = 5
@export var max_camera_height = 30

var _current_camera_height = 5

func set_camera_height(height):
	position.y = height + _current_camera_height

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -90., 30.)
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0., 360.)
		
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if Input.is_action_pressed("Camera Height"):
				if _current_camera_height < max_camera_height:
					_current_camera_height += 1
			elif spring_length < max_camera_distance:
					spring_length += 1
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if Input.is_action_pressed("Camera Height"):
				if _current_camera_height > min_camera_height:
					_current_camera_height -= 1
			elif spring_length > min_camera_distance:
				spring_length -= 1
