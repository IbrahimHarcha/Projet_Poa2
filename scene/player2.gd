extends CharacterBody2D

var speed = 100
var player_state
var score = 0
var seekable_group = "objets"
var obj_pos = []
@export var movement_target = Node2D
@export var navigation_agent: NavigationAgent2D
@export var inventory : Inventory

func _ready():
	var node_a = get_tree().current_scene
	obj_pos = node_a.obj_pos
	navigation_agent.path_desired_distance = 15
	navigation_agent.target_desired_distance = 15
	call_deferred("actor_setup")
	
func actor_setup():
	await get_tree().physics_frame
	print(obj_pos)
	print(obj_pos[1][1])
	navigation_agent.target_position=obj_pos[1][1]
	print(navigation_agent.target_position)
func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
	var current_agent_position: Vector2 = global_position
	var next_path_position : Vector2 = navigation_agent.get_next_path_position()
	var new_velocity : Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity*speed
	velocity = new_velocity
	move_and_slide()
#func _process(delta):
#	var closest_item = obj_pos[0][1]
#	if closest_item:
#		navigation_agent.set_target_location(closest_item)
#		move_towards_target(delta)	



func player() : 
	pass


func get_closest_item():
	var items = get_tree().get_nodes_in_group(seekable_group)
	var min_distance = INF
	var closest_item = null

	for item in items:
		var distance = global_position.distance_to(item.global_position)
		if distance < min_distance:
			min_distance = distance
			closest_item = item

	return closest_item

#func move_towards_target(delta):
#		var next_position = navigation_agent.get_next_location()
#		var direction = (next_position - global_position).normalized()
#		var velocity = direction*speed
#		move_and_slide()


func collect(item) : 
	# si l'inventaire a encore une case vide alors on met l'objet dedans
	#if(inventory.items.has(null)): 
	inventory.insert(item)
