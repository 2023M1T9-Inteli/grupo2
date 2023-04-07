extends Node2D

#Variáveis para contar a passagem do tempo no cronometro
var tempo
onready var categoria = get_node("/root/CategoriaGlobal")
#Define as variáveis de poder usar o poder ou não.
var pode_atirar1 = false
var pode_atirar2 = false
var pode_atirar3 = false
#variavel que instancia o jogador na cena
var jogador = preload("res://Branch/Player.tscn").instance()

func _ready():
#	Atribui um valor para o tempo que o jogador tem, baseado no desempenho da matriz
	if(categoria.categoria == 0): tempo = 150
	elif categoria.categoria == 1: tempo = 225
	elif categoria.categoria == 2: tempo = 180
	elif categoria.categoria == 3: tempo = 120
	else: tempo = 225
#	Invoca o timer e passa quanto tempo ele deve ter
	$Player/timer/CanvasLayer/Control.start_timer(tempo)
	self.pause_mode = false
	
#Define os poderes como desativados
	pode_atirar1 = false
	pode_atirar2 = false
	pode_atirar3 = false

func _process(delta):
#Player morre de queda
	$Player.morte_queda()

#Roda a animação certa dos blocos de poderes dependendo do poder selecionado
	if  not pode_atirar1:
		$GUT/AnimatedSprite.play("default")
	else:
		$GUT/AnimatedSprite.play("new")
	if not pode_atirar2:
		$Bloco_Tomate/AnimatedSprite.play("default")
	else:
		$Bloco_Tomate/AnimatedSprite.play("new_default")
	if not pode_atirar3:
		$Kanban/AnimatedSprite.play("default")
	else:
		$Kanban/AnimatedSprite.play("new")


#Poder atirar se for true
	ChamaroPoder()
	ChamaroPoder2()
	ChamaroPoder3()
#função para usar o poder do GUT. É chamada apenas pelo _process
func ChamaroPoder():
#a função só retorna algo se o botão ui_atirar for pressionado e se a variável pode_atirar for verdadeira
	if Input.is_action_just_pressed("ui_atirar") and pode_atirar1:
		
		ControleMusica.laserFx()
		#intancia a cena Flecha e joga dentro da variável cena_flecha
		var cena_flecha = preload("res://Cenas/Flecha.tscn").instance()
		
		#se o sprite da personagem estiver voltado para a esquerda, a flecha vai para a esquerda
		if $Player/Sprite.flip_h == true:
			cena_flecha.position = Vector2($Player.position.x - 55, $Player.position.y)
			cena_flecha.linear_velocity = (Vector2(-750, 0))
		
		#senão, a flecha vai para a direita
		else:
			cena_flecha.position = Vector2($Player.position.x + 55, $Player.position.y)
			cena_flecha.linear_velocity = (Vector2(750, 0))
		
		#adiciona a cena Flecha, que foi instanciada, na cena atual
		get_tree().current_scene.add_child(cena_flecha)
#função para usar o poder do Pomodoro. É chamada apenas pelo _process
func ChamaroPoder2():
	if Input.is_action_just_pressed("ui_atirar") and pode_atirar2:
		
		ControleMusica.pomodoroFx()

		#intancia a cena Tomate e joga dentro da variável cena_flecha
		var cena_tomate = preload("res://Cenas/Tomate.tscn").instance()
		
		#se o sprite da personagem estiver voltado para a esquerda, a flecha vai para a esquerda
		if $Player/Sprite.flip_h == true:
			cena_tomate.position = Vector2($Player.position.x - 55, $Player.position.y)
			cena_tomate.linear_velocity = (Vector2(-750, 0))
		
		#se não, a flecha vai para a direita
		else:
			cena_tomate.position = Vector2($Player.position.x + 55, $Player.position.y)
			cena_tomate.linear_velocity = (Vector2(750, 0))
		
		#adiciona a cena Flecha, que foi instanciada, na cena atual
		get_tree().current_scene.add_child(cena_tomate)

#função para usar o poder do kanban. É chamada apenas pelo _process
func ChamaroPoder3():
	#a função só retorna algo se o botão ui_atirar for pressionado e se a variável pode_usar for verdadeira
	if Input.is_action_just_pressed("ui_atirar") and pode_atirar3:
		
		ControleMusica.kanbanFx()
		#intancia a cena Card e joga dentro da variável cena_card
		var cena_card = preload("res://Cenas/Card.tscn").instance()
		
		#se o sprite da personagem estiver voltado para a esquerda, o card aparece na esquerda
		if $Player/Sprite.flip_h == true:
			cena_card.position = Vector2($Player.position.x - 55, $Player.position.y)
			cena_card.linear_velocity = (Vector2(-550, 40))
		
		#senão, o card aparece na direita
		else:
			cena_card.position = Vector2($Player.position.x + 55, $Player.position.y)
			cena_card.linear_velocity = (Vector2(550, 40))
		
		#adiciona a cena Card, que foi instanciada, na cena atual
		get_tree().current_scene.add_child(cena_card)
		
#define o poder como o do método GUT
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$GUT/AnimatedSprite.play("new")
		pode_atirar2 = false
		pode_atirar3 = false
		pode_atirar1 = true

#define o poder como o do método Kanban
func _on_Area2D3_body_entered(body):
	if body.is_in_group("player"):
		$Kanban/AnimatedSprite.play("new_default")
		pode_atirar1 = false
		pode_atirar2 = true
		pode_atirar3 = false

#define o poder como o do método Pomodoro
func _on_Area2D2_body_entered(body):
	if body.is_in_group("player"):
		$Bloco_Tomate/AnimatedSprite.play("new")
		pode_atirar1 = false
		pode_atirar2 = false
		pode_atirar3 = true

func _on_Area2DPortal_body_entered(body):
#Mudar de cena quando o player entrar no portal
	get_tree().change_scene("res://Cenas/quizFase5.tscn")



func _on_Area2DBait_body_exited(body):
#Mostrar o sprite quando o personagem sair da área secreta
	$IndustrialBait.show()


func _on_Area2DBait_body_entered(body):
#Esconder o sprite quando o personagem entrar na área secreta
	$IndustrialBait.hide()


func _on_Area2DBaitado_body_entered(body):
#Esconde a segunda parede quando colidir
	$BaitFraco.hide()


func _on_Area2DBaitado_body_exited(body):
#Mostra novamente a parede quando o player sair da área.
	$BaitFraco.show()
