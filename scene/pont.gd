extends TileMap
@export var bb1: Node2D
@export var bb2: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	bb1=get_parent().get_node("blackboard_2")
	bb2=get_parent().get_node("blackboard_2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bb1.fin and bb2.fin :
		visible = true

