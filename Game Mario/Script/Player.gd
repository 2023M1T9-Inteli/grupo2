extends KinematicBody2D	

const CIMA = Vector2(0,-1)
const GRAVIDADE = 40
var VELOCIDADE = 250
var JUMP_HEIGHT = -800 
var life = 1
var motion = Vector2()

onready var ani = $Sprite

var recorded_data = []  #array que atualiza quando personagem se move
var is_rewinding = false #bool para indicar se função de rebobinar está ativa ou inativa
var rewind_length = (60 * 3) #3 segundos
var rewind_ghost = load("res://Cenas/rewind_ghost.tscn")  #direcionar ao sprite que está rebobinando para mostrar seu rastro na tela

#aciona os processos físico do personagem, ou seja, a movimentação de andar para os lados e pular. Além de conter a gravdidade para queda da personagem
func _physics_process(_delta):
	
	#funcão de rebobinar
	handle_rewind_function()
	motion.y += GRAVIDADE
	player_movement()
	
	if is_on_floor(): 
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT	
			$Sprite.play("jump")
			$JumpFx.play()
			
	motion = move_and_slide(motion, CIMA)
	
	if !is_on_floor():
		$Sprite.play("jump")
	

#função para fazer o personagem voltar no tempo (rebobinar)
func handle_rewind_function():
	var _ani_number = ani.get_index()
	var _dir_number = 0

	#se a tecla "espaço for apertada, a ação do personagem é rebobinada
	if(Input.is_action_pressed("ui_space")): 
		is_rewinding = true
		if(recorded_data.size() > 0):
			var current_frame = recorded_data[0]
			
			#Definir a animação/posição/direção de nossos objetos
			if(current_frame != null):
				$Sprite.hide()	
				ani.animation = current_frame[0]
				global_position = current_frame[1]
				ani.flip_h = current_frame[2]
				$Sprite.play("rewind")
				#definir as propriedades do efeito fantasma do personagem
				var ghost : Sprite = rewind_ghost.instance()
				ghost.texture = ani.frames.get_frame(ani.animation,ani.frame)
				ghost.global_position = global_position
				ghost.flip_h = ani.flip_h
				get_parent().add_child(ghost)
				
			#remove o frame atual para não repetir
			recorded_data.pop_front()
		else:
			$Sprite.show()	
	#salvar os dados da posição do personagem		
	else: 
		$Sprite.show()
		is_rewinding = false
		
		if(ani.flip_h):
			_dir_number = 1
		else:
			_dir_number = 0
		
		recorded_data.push_front([ani.animation,global_position,ani.flip_h])
		if(recorded_data.size() > rewind_length): #eliminar dados com mais de 3 segundos
			recorded_data.pop_back()

#movimentos da personagem principal(Player), como andar para os lados e pular
func player_movement():
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

#player mata inimigo
func _on_pes_body_entered(body):
	body.dano()
	motion.y = JUMP_HEIGHT
	

#player toma dano
func _on_dano_body_entered(body):
	life -= 1 
	if life == 0:
		$".".queue_free()
		get_tree().change_scene("res://Cenas/GameOver.tscn")
