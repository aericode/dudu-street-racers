extends Node2D

var rng = RandomNumberGenerator.new()

@export var frequency : int   = 5
@export var amplitude : int   = 150
@export var speed : int = 0
@export var horizontal_randomizer : int = 0
@export var is_reversed : bool

var time = 0


func _ready():
	frequency   = rng.randi_range(5, 8)
	amplitude   = rng.randi_range(600, 1000)
	speed = rng.randi_range(100, 400)
	horizontal_randomizer = rng.randi_range(-8, 8) * 30
	
	is_reversed =  (rng.randi_range(0, 1) == 1)
 
func move_straight(delta):
	var vertical_movement = clamp((PlayerVariables.speed), 400, 800 )* delta
	position += Vector2(0, vertical_movement)

func wave_movement(delta):
	time += delta
	var movement
	movement = cos(time*frequency)*amplitude
	if is_reversed:
		movement = movement * -1
	return movement
	
func move_wavy(delta):
	var horizontal_movement = (wave_movement(delta) + horizontal_randomizer)* delta
	var vertical_movement = speed * delta
	position += Vector2(horizontal_movement, vertical_movement)

func _physics_process(delta):
	if position.y < 60:
		move_straight(delta)
	else:
		move_wavy(delta)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		PlayerVariables.speed+= 50
		queue_free()
