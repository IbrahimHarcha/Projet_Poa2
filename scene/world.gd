extends Node2D

# Array of the object scenes (PackedScene) to spawn
var objects_to_spawn = [preload("res://scene/stick.tscn"),preload("res://scene/stick.tscn"),preload("res://scene/stick.tscn"),preload("res://scene/stick.tscn"),preload("res://scene/stick.tscn"),preload("res://scene/stick.tscn"),preload("res://scene/rock.tscn"),preload("res://scene/rock.tscn"),preload("res://scene/rock.tscn"),preload("res://scene/rock.tscn"),preload("res://scene/rock.tscn")]


# Predefined positions
# var positions = [[-1, -19], [3, -14], [-3, -11], [3, -9], [7, -10], [7, -7], [2, -5], [-3, -5], [6, 5], [6, 14]]
var positions = [[182, 145], [111, 189], [30, 10],[111, 189],[-91, 186],[-174, 137],[-190, 35]
,[-99, 36],[-170, -58],[8, -67],[151, -63],[299, -113],[436, -147],[-381, -124],[76, 301],[-128, 282],[378, 142]]
func _ready():
	randomize()
	shuffle_positions()
	spawn_objects()
func shuffle_positions():
	positions.shuffle()

func spawn_objects():
	for i in range(min(objects_to_spawn.size(), positions.size())):
		var object_scene = objects_to_spawn[i]
		var object_instance = object_scene.instantiate()

		
		object_instance.global_position = Vector2(positions[i][0], positions[i][1])

		add_child(object_instance)
		print("Object ", i, " position: ", object_instance.position)
