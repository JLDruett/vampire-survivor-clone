extends CharacterBody2D


var mov_speed = 40.0

func _physics_process(delta):
	movement()
	pass
	
func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	velocity = mov.normalized()*mov_speed
	move_and_slide()
