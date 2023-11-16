extends Node2D

# Array of the object scenes (PackedScene) to spawn
var objects_to_spawn = [preload("res://Objet1.tscn")]
onready var camera = get_node("Camera2D") # Adjust the path according to your scene tree


# Predefined positions
 # var positions = [[-1, -19], [3, -14], [-3, -11], [3, -9], [7, -10], [7, -7], [2, -5], [-3, -5], [6, 5], [6, 14]]
var positions = [[16, 10], [17, 9], [3, 10], [17, 11], [18, 10], [16, 9], [16, 9], [16, 9], [16, 9], [16, 9]]
func _ready():
	randomize()
	shuffle_positions()
	spawn_objects()
	_draw()
	var viewport_size = get_viewport_rect().size
	var camera_position = camera.global_position
	print("Camera Position: ", camera_position)
	var top_left = camera_position - viewport_size / 2
	var bottom_right = camera_position + viewport_size / 2
	print("Top Left: ", top_left, ", Bottom Right: ", bottom_right)
func shuffle_positions():
	positions.shuffle()

func spawn_objects():
	for i in range(min(objects_to_spawn.size(), positions.size())):
		var object_scene = objects_to_spawn[0]
		var object_instance = object_scene.instance()

		
		object_instance.global_position = Vector2(positions[i][0], positions[i][1])

		add_child(object_instance)
		print("Object ", i, " position: ", object_instance.position)

