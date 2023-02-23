extends KinematicBody2D	

const UP = Vector2(0,-1)
const GRAVITY = 40 # dobrou o valor antes era 20
var SPEED = 250
var JUMP_HEIGHT = -800 # antes era 550

var motion = Vector2() # vai passar duas variaveis x e y.

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor(): # colcoar 
#		print("esta no chao")
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT	
			
	motion = move_and_slide(motion, UP)


func _on_pes_body_entered(body):
	body.dano()
