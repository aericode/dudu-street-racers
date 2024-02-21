extends Area2D


func move():
	var movement_vector = Vector2(0, PlayerVariables.speed)
	position += movement_vector
	
func _physics_process(_delta):
	move()


func _on_area_entered(area):
	if area.name == "BottomCollider":
		position = Vector2(570, -420)
