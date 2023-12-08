extends CharacterBody2D

var speed = 100
var player_state
var score = 0
var collecte = false 
var seekable_group = "objets"
var obj_pos = []
@export var movement_target = Node2D
@export var navigation_agent: NavigationAgent2D
@export var inventory : Inventory
@export var boss: Node2D

func _ready():
	var node_a = get_tree().current_scene
	obj_pos = node_a.obj_pos
	boss=get_parent().get_node("blackboard_2")
	navigation_agent.path_desired_distance = 10
	navigation_agent.target_desired_distance = 10
	#call_deferred("actor_setup","stick")
	
func actor_setup(obj):
	collecte=true
	await get_tree().physics_frame
	#var obj = "stick"
	var j=1000000
	var distanceuh =  Vector2(1000000,100000)
	for i  in range (obj_pos.size()):
		if obj_pos[i][0] == obj:
			if  obj_pos[i][1].distance_to(global_position) < global_position.distance_to(distanceuh):
				j=i
				distanceuh = obj_pos[i][1]
	if j<obj_pos.size():
		obj_pos.pop_at(j)
	navigation_agent.target_position=distanceuh
func _physics_process(delta):
	if navigation_agent.is_navigation_finished() and navigation_agent.target_position==boss.position :
		inventory.dropAll()
		collecte = false
		
		return
	if navigation_agent.is_navigation_finished():
		navigation_agent.target_position=boss.position
	var current_agent_position: Vector2 = global_position
	var next_path_position : Vector2 = navigation_agent.get_next_path_position()
	var new_velocity : Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity*speed
	velocity = new_velocity
	move_and_slide()




func player() : 
	pass
	
func is_collecting()->bool:
	return collecte

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