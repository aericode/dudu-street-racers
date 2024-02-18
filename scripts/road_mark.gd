extends Area2D


func move():
	var movement_vector = Vector2(0,5)
	position += movement_vector
	
func _physics_process(_delta):
	move()


func _on_area_entered(area):
	if area.name == "RoadMarkReseter":
		position = Vector2(570, -210)
