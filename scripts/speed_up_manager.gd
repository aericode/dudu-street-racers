extends Node

var rng = RandomNumberGenerator.new()

var speed_up_timer: int

const SPEED_UP = preload("res://scenes/speed_up.tscn")
const ALERT = preload("res://scenes/speed_up_alert.tscn")

func _ready():
	reset_speed_up_timer()

func reset_speed_up_timer():
	speed_up_timer = rng.randi_range(1500, 2500)
	
func spawn_speed_up():
	var horizontal_position = rng.randi_range(485, 670)
	var speed_up = SPEED_UP.instantiate()
	var alert    = ALERT.instantiate()
	alert.speed_up = speed_up
	
	speed_up.position = Vector2(horizontal_position, -800)
	get_parent().add_child(speed_up)
	get_parent().add_child(alert)


func _process(_delta):
	speed_up_timer -= 1
	if speed_up_timer < 0:
		spawn_speed_up()
		reset_speed_up_timer()
	
