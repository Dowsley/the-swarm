@tool class_name CelestialBody extends Node2D


@export var color: Color = Color("#fefef9"):
	set(value):
		color = value
		queue_redraw()
	get:
		return color

@export var radius: float = 50.0:
	set(value):
		radius = value
		queue_redraw()
	get:
		return radius


func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color, true)
