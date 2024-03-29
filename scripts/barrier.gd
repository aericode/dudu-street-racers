extends Node2D

var is_broken = false
@export var sprite : Sprite2D

	
func _physics_process(delta):
	var movement_vector = Vector2(0,PlayerVariables.speed * delta) 
	position += movement_vector

func _on_area_2d_area_entered(area):
	if area.name == "BottomCollider":
		queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "Player" && !is_broken :
		is_broken = true
		PlayerVariables.life -= 1
		sprite.texture = load("res://assets/barrier broken.png")
		
		PlayerVariables.life -= int(0.8*PlayerVariables.speed)
		PlayerVariables.speed = int(0.9*PlayerVariables.speed)

func damage_player():
	pass
