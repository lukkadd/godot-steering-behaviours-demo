extends Control

@onready var scene_label: Label = $CenterContainer/VBoxContainer/VBoxContainer/HBoxContainer/SceneLabel

@onready var scene_index = 0
@onready var scenes = [
	{"label": "Seek", "scene": "res://levels/seek_scene.tscn"},
	{"label": "Flee", "scene": "res://levels/flee_scene.tscn"},
]

func _ready():
	scene_label.text = scenes[scene_index].label

func _on_right_pressed():
	scene_index = scene_index + 1 if scene_index < scenes.size() - 1 else 0
	scene_label.text = scenes[scene_index].label

func _on_left_pressed():
	scene_index = scene_index - 1 if scene_index > 0 else scenes.size() - 1
	scene_label.text = scenes[scene_index].label

func _on_play_pressed():
	get_tree().change_scene_to_file(scenes[scene_index].scene)
