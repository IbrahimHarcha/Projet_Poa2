extends CharacterBody2D

var speed = 100
var player_state
var score = 0
var seekable_group = "objets"
var navigation_agent: NavigationAgent2D
@export var inventory : Inventory


func _ready():
	
	navigation_agent = get_node("NavigationAgent2D")


func _process(delta):
	var closest_item = get_closest_item()
	if closest_item:
		navigation_agent.set_target_location(closest_item.global_position)
		move_towards_target(delta)	



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

func move_towards_target(delta):
		var next_position = navigation_agent.get_next_location()
		var direction = (next_position - global_position).normalized()
		var velocity = direction*speed
		move_and_slide()


func collect(item) : 
	# si l'inventaire a encore une case vide alors on met l'objet dedans
	#if(inventory.items.has(null)): 
	inventory.insert(item)
