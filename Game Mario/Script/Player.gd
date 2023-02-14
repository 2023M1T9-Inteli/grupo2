extends KinematicBody2D	

const UP = Vector2(0,-1)
const GRAVITY = 20
var SPEED = 200
var JUMP_HEIGHT = -550

var motion = Vector2() # vai passar duas variaveis x e y.

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		print("esta no chao")
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT	
			
	motion = move_and_slide(motion, UP)
