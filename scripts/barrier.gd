extends Node2D

var is_broken = false
@export var sprite : Sprite2D

func move():
	var movement_vector = Vector2(0,PlayerVariables.speed)
	position += movement_vector
	
func _physics_process(_delta):
	move()


func _on_area_2d_area_entered(area):
	if area.name == "BottomCollider":
		queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "Player" && !is_broken :
		is_broken = true
		PlayerVariables.life -= 1
		sprite.texture = load("res://assets/barrier broken.png")

func damage_player():
	pass
