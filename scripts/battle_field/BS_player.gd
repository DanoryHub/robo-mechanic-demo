extends CharacterBody2D

const SPEED = 300.0
	
func outer_call_test():
	print("Its working !")

func _physics_process(delta: float) -> void:
	pass
	#var direction: Vector2 = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down"))
	#
	#if direction.x:
		#velocity.x = direction.x * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#
	#if direction.y:
		#velocity.y = direction.y * SPEED
	#else:
		#velocity.y = move_toward(velocity.y, 0, SPEED)
#
	#move_and_slide()
