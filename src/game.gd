extends Node2D


@onready var camera := $Camera2D


func _ready() -> void:
	var initial_body: CelestialBody = $CelestialBody
	camera.position = initial_body.position
