extends StaticBody2D

@export var item : InventoryItem
var player = null

func _on_area_2d_body_entered(body):
	if body.has_method("player") : 
		player = body
		if player.navigation_agent.target_position==global_position : 
			playerCollect()
			queue_free()
		
func playerCollect() : 
	player.collect(item)
