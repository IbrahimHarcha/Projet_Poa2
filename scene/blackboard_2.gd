extends Node2D

var worker: CharacterBody2D
var worker2: CharacterBody2D
var object=["stick","stick","stick","stick"]
var object_en_possession=0
# Called when the node enters the scene tree for the first time.
func _ready():
	worker = get_parent().get_node("Player4")
	worker2 = get_parent().get_node("Player5")
	shuffle_object()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if worker and !worker.is_collecting():
		request_resource_worker_1()
	if worker2 and !worker2.is_collecting():
		request_resource_worker_2()
	
	
func shuffle_object():
	object.shuffle()
	
	
func request_resource_worker_1():
	# Check if the collector exists and has the collect_resource method
	if worker and worker.has_method("actor_setup") and object.size()!=object_en_possession:
		print("Requesting resource worker 1!")
		worker.call_deferred("actor_setup", object[object_en_possession])

func request_resource_worker_2():
	# Check if the collector exists and has the collect_resource method
	if worker2 and worker2.has_method("actor_setup") and object.size()!=object_en_possession:
		print("Requesting resource worker 2!")
		worker2.call_deferred("actor_setup", object[object_en_possession])
	
func object_apporte():
	if object.size()!=object_en_possession:
		print(object_en_possession)
		object_en_possession=object_en_possession+1