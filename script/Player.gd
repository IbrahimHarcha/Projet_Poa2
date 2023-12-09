extends CharacterBody2D

var speed = 100
var player_state
var score = 0

@export var inventory : Inventory

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0 : 
		player_state = "idle"
		
	elif direction.x != 0 or direction.y != 0 : 
		player_state = "walking"
	
	velocity = direction * speed
	move_and_slide()


func player() : 
	pass

	
func collect(item) : 
	# si l'inventaire a encore une case vide alors on met l'objet dedans
	#if(inventory.items.has(null)): 
	inventory.insert(item)
