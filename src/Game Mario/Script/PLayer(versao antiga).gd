extends KinematicBody2D	

const CIMA = Vector2(0,-1)
const GRAVIDADE = 40 
var VELOCIDADE = 250
var JUMP_HEIGHT = -800

var motion = Vector2() # vai passar duas variaveis x e y.
#aciona os processos físico do personagem, ou seja, a movimentação de andar para os lados e pular. Além de conter a gravdidade para queda da personagem
func _physics_process(delta):
	
	motion.y += GRAVIDADE
	
	if Input.is_action_pressed("ui_right"):
		motion.x = VELOCIDADE
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -VELOCIDADE
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT	
			
	motion = move_and_slide(motion, CIMA)


func _on_pes_body_entered(body):
	body.dano()
