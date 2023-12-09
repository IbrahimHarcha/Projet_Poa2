extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const SPEED = 300.0
const direction =Vector2(1,0)



func slide():
	velocity = direction * SPEED
	move_and_slide()
	
func _process(delta):
	_animated_sprite.play("end")
	if get_parent().get_node("Player2").isatApple() or get_parent().get_node("Player3").isatApple() or get_parent().get_node("Player4").isatApple() or get_parent().get_node("Player5").isatApple():
		slide()
