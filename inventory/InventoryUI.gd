extends Control

@onready var inventory : Inventory = preload("res://inventory/playerInventory.tres")
@onready var slots : Array = $NinePatchRect/GridContainer.get_children()

var is_open = false


func _ready():
	inventory.update.connect(updateSlot)
	updateSlot()
	close()


func updateSlot() : 
	for i in range (min(inventory.slots.size(), slots.size())) : 
		slots[i].update(inventory.slots[i])

func _process(delta):
	if Input.is_action_just_pressed("i") : 
		if is_open : 
			close()
		else : 
			open()
			
func open() :
	visible = true
	is_open = true
	
func close() : 
	visible = false
	is_open = false
