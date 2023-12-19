extends Demo_Scene

@onready var flag = $World/Target

func _ready():
	behavior = preload("res://resources/seek.tres")

func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_T:
				if target == null:
					target_text = "Flag"
					target = flag
				else:
					target_text = "Mouse"
					target = null
	super(event)
