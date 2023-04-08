extends KinematicBody2D	

const CIMA = Vector2(0,-1)
const GRAVIDADE = 40
var velocidade = 250
var jump_height = -800 
var vida = 1
var motion = Vector2()
var movimentacao = true
var pausar = false

onready var ani = $Sprite

var recorded_data = []  #array que atualiza quando personagem se move
var is_rewinding = false #bool para indicar se função de rebobinar está ativa ou inativa
var rewind_length = (60 * 3) #3 segundos
var rewind_ghost = load("res://Cenas/Poderes/RewindGhost.tscn")  #direcionar ao sprite que está rebobinando para mostrar seu rastro na tela

#variaveis para controle de efeito sonoro
var first_time = true
var is_playing = false
var sound = false

func _ready():
	$pause.visible = false

#aciona os processos físico do personagem, ou seja, a movimentação de andar para os lados e pular. Além de conter a gravdidade para queda da personagem
func _physics_process(_delta):
	
	if is_rewinding and !sound:
		$rewindFx.play()
		sound = true
	elif !is_rewinding and sound:
		sound = false
		$rewindFx.stop()
	#funcão de rebobinar
	handle_rewind_function()
	motion.y += GRAVIDADE
	player_movement()
	
	if is_on_floor(): 
		if movimentacao:
			if Input.is_action_pressed("ui_up"):
				motion.y = jump_height	
				$Sprite.play("jump")
				$JumpFx.play()
				
	motion = move_and_slide(motion, CIMA)
	
	if !is_on_floor():
		$Sprite.play("jump")
	if !$pause.visible && pausar:
		pausar = false
		movimentacao = true
		$timer/CanvasLayer/Control.retomarTimer()

#função para fazer o personagem voltar no tempo (rebobinar)
func handle_rewind_function():
	var _ani_number = ani.get_index()
	var _dir_number = 0

	#se a tecla "espaço for apertada, a ação do personagem é rebobinada
	if(Input.is_action_pressed("ui_space")): 
		is_rewinding = true
		$AnimatedSprite.visible = true
		$AnimatedSprite.play("default")
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
		$AnimatedSprite.set_frame(0)
		$AnimatedSprite.stop()
		$AnimatedSprite.visible = false
		
		if(ani.flip_h):
			_dir_number = 1
		else:
			_dir_number = 0
		# salva a posição, animação e flip do personagem no recorded_data como primeiro item
		recorded_data.push_front([ani.animation,global_position,ani.flip_h])
		#eliminar dados com mais de 3 segundos
		if(recorded_data.size() > rewind_length): 
			recorded_data.pop_back()

#movimentos da personagem principal(Player), como andar para os lados e pular
func player_movement():
	if movimentacao:
		if Input.is_action_pressed("ui_right"):
			motion.x = velocidade
			$Sprite.play("Run")
			$Sprite.flip_h = false

		elif Input.is_action_pressed("ui_left"):
			motion.x = -velocidade
			$Sprite.play("Run")
			$Sprite.flip_h = true
		else:
			motion.x = 0
			$Sprite.play("Idle")
	else:
		motion.x = 0
		$Sprite.play("Idle")
#player mata inimigo
func _on_pes_body_entered(body):
	body.dano()
	motion.y = jump_height
	

#player toma dano
func _on_dano_body_entered(_body):
	ControleMusica.danoPersonagem()
#	Chama a função do timer para que ele perca tempo do seu cronometro
	$timer/CanvasLayer/Control.perder_tempo()
	$Sprite/AnimationPlayer.play("danoPersonagem")



#Função para verificar se o jogador caiu e não utilizou o rewind
func morte_queda():
#	Se passar dessa posição, significa que ele caiu mais de 3 segundos
	if position.y > 8000:
#		Mata o jogador
		vida -= 1
	
#	Se ele tiver caído, será chamado a cena de gameOver.
	if vida == 0:
		queue_free()
		get_tree().change_scene("res://Cenas/GameOver.tscn")

#função que aciona o estado pause, torna a tela de pause visível e pausa o cronometro
func _on_pausar_pressed():
	$pause.visible = true
	$timer/CanvasLayer/Control.pause_timer()
	movimentacao = false
	pausar = true
	get_tree().paused = true

#função que chama as funções mute e som do script global para regular o volume do som do jogo
func _on_som_toggled(_button_pressed):
	if $hud/som.pressed:
		ControleMusica.mute()
	else:
		ControleMusica.som()
