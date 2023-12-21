extends Demo_Scene
class_name Boid_Scene

@onready var nboids = 100

func _ready():
	var instance = null
	vehicle_scene = preload("res://scenes/boid.tscn")
	behavior = preload("res://resources/flocking.tres")
	for i in range(nboids):
		instance = spawn_ship({"position": Vector2(randi_range(50, 1300),randi_range(50, 700))})
		instance.velocity = Vector2(randi_range(-20,20), randi_range(-20,20))
	update_vehicles()
	update_labels()
