extends Node
class_name Demo_Scene

#Interactive Nodes
@onready var vehicle_container = $World/Vehicles

#Label Nodes to update
@onready var fps_label = $MarginContainer/Current_Vars/MarginContainer/VBoxContainer/hboxfields2/hbox_fps/fps_value
@onready var target_label = $MarginContainer/Current_Vars/MarginContainer/VBoxContainer/hboxfields/hbox_target/target_value
@onready var max_force_label = $MarginContainer/Current_Vars/MarginContainer/VBoxContainer/hboxfields/hbox_max_force/max_force_value
@onready var max_speed_label = $MarginContainer/Current_Vars/MarginContainer/VBoxContainer/hboxfields/hbox_max_speed/max_speed_value
@onready var mass_label = $MarginContainer/Current_Vars/MarginContainer/VBoxContainer/hboxfields/hbox_mass/mass_value
@onready var ships_label = $MarginContainer/Current_Vars/MarginContainer/VBoxContainer/hboxfields2/hbox_ships/ships_value

#Preloads
@onready var vehicle_scene = preload("res://scenes/vehicle.tscn")
@onready var behavior = preload("res://resources/seek.tres")

#Ships properties
@onready var max_speed = 10
@onready var max_force = 1
@onready var mass = 1
@onready var target = null
@onready var target_text = "Mouse"
@onready var ships_count = 0

#Keep fps label updated every frame
func _process(delta):
	fps_label.set_text(str(Engine.get_frames_per_second()))

#Change ships properties via shortcuts
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_Z:
				mass = mass - 1 if mass != 1 else 1
			KEY_C:
				mass = mass + 1 if mass != 10 else 10
			KEY_A:
				max_speed = max_speed - 1 if max_speed != 1 else 1
			KEY_D:
				max_speed = max_speed + 1 if max_speed != 10 else 10
			KEY_Q:
				max_force = max_force - 1 if max_force != 1 else 1
			KEY_E:
				max_force = max_force + 1 if max_force != 10 else 10
			KEY_ESCAPE:
				get_tree().change_scene_to_file("res://levels/menu_screen.tscn")

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			spawn_ship(event)
	
	update_vehicles()
	update_labels()

func remove_vehicle(_vehicle):
	ships_count -= 1
	_vehicle.queue_free()

func update_vehicles():
	for vehicle in vehicle_container.get_children():
		vehicle.target = target
		vehicle.max_force = max_force
		vehicle.max_speed = max_speed
		vehicle.mass = mass

func update_labels():
	target_label.set_text(target_text)
	max_force_label.set_text(str(max_force))
	max_speed_label.set_text(str(max_speed))
	mass_label.set_text(str(mass))
	ships_label.set_text(str(ships_count))
	
func spawn_ship(_event):
	ships_count += 1
	var instance = vehicle_scene.instantiate()
	instance.right_clicked.connect(remove_vehicle)
	instance.steering_behavior = behavior
	instance.target = target
	instance.max_speed = max_speed
	instance.max_force = max_force
	instance.mass = mass
	vehicle_container.add_child(instance)
	instance.position = _event.position
	return instance
