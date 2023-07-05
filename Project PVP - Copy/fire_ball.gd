extends Node2D


var velocity = Vector2(1, 0)
var speed = 15
var look_once = false
var homing = true
var damage = 2
var homing2 = true




func _process(delta):
	if homing2:
		if homing:
			look_at(get_global_mouse_position())
			homing = false
	global_position += velocity.rotated(rotation) * speed

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
		body.health -= 5
		print("sick")
	queue_free()
	
