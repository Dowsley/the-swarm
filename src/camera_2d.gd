extends Camera2D

# Adjust these variables to your liking
@export var move_speed: float = 500.0
@export var zoom_speed: float = 2.0
@export var min_zoom: float = 0.5
@export var max_zoom: float = 2.0

func _process(delta):
	# Handle movement
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	
	position += input_vector * move_speed * delta
	
	# Handle zooming
	var zoom_delta = 0.0
	if Input.is_action_just_released("zoom_in"):
		zoom_delta += zoom_speed
	if Input.is_action_just_released("zoom_out"):
		zoom_delta -= zoom_speed
	
	zoom.x = clamp(zoom.x + zoom_delta * delta, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y + zoom_delta * delta, min_zoom, max_zoom)
