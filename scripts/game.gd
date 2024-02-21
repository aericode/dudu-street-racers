extends Node2D

var rng = RandomNumberGenerator.new()
var barrier_timer : int

const BARRIER = preload("res://scenes/barrier.tscn")

func reset_barrier_timer():
	barrier_timer = rng.randi_range(1200, 2000)

func reset_player_variables():
	PlayerVariables.score = 0
	PlayerVariables.life = 3
	PlayerVariables.speed = 10

func _ready():
	reset_barrier_timer()
	reset_player_variables()


func spawn_barrier():
	var barrier_horizontal_position = rng.randi_range(385, 770)
	var barrier = BARRIER.instantiate()
	barrier.position = Vector2(barrier_horizontal_position, -50)
	get_parent().add_child(barrier)
	
func _process(_delta):
	barrier_timer -= 1
	if barrier_timer < 0:
		reset_barrier_timer()
		spawn_barrier()
