extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const SPEED = 5000.0
var direction =Vector2(0,-1)



func slide():
	_animated_sprite.visible=true
	velocity = direction * SPEED
	if self.position.y<150:
		direction =Vector2(0,0)
	move_and_slide()
	
func _process(delta):
	_animated_sprite.play("end")
	if get_parent().get_node("Player2").isatApple() or get_parent().get_node("Player3").isatApple() or get_parent().get_node("Player4").isatApple() or get_parent().get_node("Player5").isatApple():
		slide()
