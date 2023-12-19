extends Node2D
class_name ArrivalTarget

@export var arrival_radius = 200 

func _draw():
  draw_arc(Vector2(0,0), arrival_radius, 0, 360, 360, Color.AQUAMARINE)
