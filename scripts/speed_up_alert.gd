extends Node2D

@export var speed_up : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(speed_up.position.x, 40)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if speed_up.position.y > 0:
		queue_free()
