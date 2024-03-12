extends Area2D

func _physics_process(delta):
	var movement_vector = Vector2(0, PlayerVariables.speed * delta)
	position += movement_vector
	

func _on_area_entered(area):
	if area.name == "BottomCollider":
		position = Vector2(570, -420)
