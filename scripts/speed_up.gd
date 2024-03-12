extends Node2D

var rng = RandomNumberGenerator.new()

@export var frequency : int   = 5
@export var amplitude : int   = 150
@export var extra_speed : int = 0


var time = 0


func _ready():
	frequency   = rng.randi_range(1, 10) + PlayerVariables.speed/100
	amplitude   = rng.randi_range(1000, 1800)
	extra_speed = rng.randi_range(0, 300)
 
func _physics_process(delta):
	time += delta
	var horizontal_movement = (cos(time*frequency)*amplitude) * delta
	var vertical_movement = clamp((PlayerVariables.speed+extra_speed), 400, 800 )* delta
	position += Vector2(horizontal_movement, vertical_movement)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		PlayerVariables.speed+= 100
		queue_free()
