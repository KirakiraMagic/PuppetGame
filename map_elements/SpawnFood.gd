extends Node3D 
@onready var food = [preload("res://map_elements/sphere_food.tscn"), preload("res://map_elements/cube_food.tscn"), preload("res://map_elements/capsule_food.tscn")]
@export var spawn_rate := 0.1
var time_since_spawn := 0.0
var prev_point = Vector3.ZERO
var spawn_points = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		spawn_points.append(child.global_position)
		print(child)
	spawn_food()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		time_since_spawn += delta
		if time_since_spawn >= spawn_rate:
			spawn_food()
			time_since_spawn = 0.0

func spawn_food():
	var spawn_point = spawn_points[randi() % spawn_points.size()]
	print(spawn_point)
	print(prev_point)
	if spawn_point != prev_point:
		var drop = food[randi() % food.size()].instantiate()
		drop.global_position = spawn_point
		add_child(drop)
		prev_point = spawn_point
	else:
		pass
