extends Demo_Scene
class_name Wander_Scene

func _ready():
	behavior = preload("res://resources/wander.tres")
	vehicle_scene = preload("res://scenes/wanderer.tscn")
