extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.5
var cont = 0
onready var ani = $Sprite

var recorded_data = []  #array que atualiza quando personagem se move
var is_rewinding = false #bool para indicar se função de rebobinar está ativa ou inativa
var rewind_length = (60 * 3) #3 segundos
var rewind_ghost = load("res://Cenas/rewindGhost.tscn")  #direcionar ao sprite que está rebobinando para mostrar seu rastro na tela



# a primeira do relógio(TicTac), pega seu inicio, fim e deixa na primeira posição da imagem 
func _ready():
	$Sprite.play("walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial +  100

#está fazendo com que o a personagem relógio(TicTac) seja processada várias vezes para sua locomoção e mudança de imagem dela
func _process(_delta):
	
	handle_rewind_function()
	
	if (posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false

	if ($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true

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
		# salva a posição, animação e flip do personagem no recorded_data como primeiro item
		recorded_data.push_front([ani.animation,global_position,ani.flip_h])
		if(recorded_data.size() > rewind_length): #eliminar dados com mais de 3 segundos
			recorded_data.pop_back()
		
		
#inimigo fica vermelho
func dano():
	ControleMusica.inimigoDie()
	get_node("anim").play("die")
	die()
	
#faz o inimigo desaparecer da tela
func die():
	queue_free()
	

#vai fazer o inimigo morrer/desaparecer da tela quando a animação acabar
func _on_anim_animation_finished(anim_name):
	if anim_name == "die":
		die()
