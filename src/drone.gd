class_name Drone extends Sprite2D

@export var orbit_distance: float = 20.0
@export var target_body: CelestialBody = null

var orbit_angle: float = 0.0
var orbit_speed: float = 0.5


func _process(delta: float) -> void:
	var distance_to_target := global_position.distance_to(target_body.global_position)
	if distance_to_target > orbit_distance+target_body.radius+10:
		# Move towards the target
		var direction = (target_body.global_position - global_position).normalized()
		global_position += direction * 100 * delta
		rotation = direction.angle()
	else:
		# Orbit the target
		orbit_angle += orbit_speed * delta
		global_position = target_body.global_position + Vector2(cos(orbit_angle), sin(orbit_angle)) * (orbit_distance+target_body.radius)
		rotation = orbit_angle
