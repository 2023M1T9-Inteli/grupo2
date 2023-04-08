extends Node2D

#variavel que instancia o jogador na cena
var jogador = preload("res://Cenas/Personagens/Player.tscn").instance()
#variável que indica se o jogador pode usar o poder ou não
var pode_usar = false
#Variável de controle para saber quanto tempo será disponibilizado para realizar a fase
var tempo

#onready var movimento = get_node("/root/GlobalTeste")

func _ready():
	#adiciona a cena do jogador, que foi instanciada, na cena atual
	add_child(jogador)
	
	#determina as coordenadas em que aparece o jogador
	jogador.position = Vector2(-1687, 161)
	#	Atribui o valor a variável global level, para que caso ocorra GameOver, saiba-se em que nível está. 
	CategoriaGlobal.level = "fase 4"
	
#	Define a quantidade de tempo que o jogador terá para completar a fase com base no desempenho da matriz
	if(CategoriaGlobal.categoria == 0): tempo = 150
	elif CategoriaGlobal.categoria == 1: tempo = 225
	elif CategoriaGlobal.categoria == 2: tempo = 180
	elif CategoriaGlobal.categoria == 3: tempo = 120
	else: tempo = 225
	
#	Inicia o timer
	$Player/timer/CanvasLayer/Control.start_timer(tempo)
	$KinematicBody2D/AnimatedSprite.play("default")


func _process(_delta):
	#player morre de queda
	$Player.morte_queda()
	usar_poder()
	
	#torna o popup invisível enquanto o bloco não é acionado
	if !$kanban.visible:
		get_tree().paused = false


#função para usar o poder do kanban. É chamada apenas pelo _process
func usar_poder():
	#a função só retorna algo se o botão ui_atirar for pressionado e se a variável pode_usar for verdadeira
	if Input.is_action_just_pressed("ui_atirar") and pode_usar:
		
		
		#efeito sonoro
		ControleMusica.kanbanFx()

		#intancia a cena Card e joga dentro da variável cena_card
		var cena_card = preload("res://Cenas/Poderes/Card.tscn").instance()
		
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
		
#funcao para tocar o efeito sonoro quando player encosta no bloco
func _on_Area2D_body_entered(_body):
	#efeito sonoro
	$blocoFx.play()

#função que aciona o poder assim que o player encosta no bloco e abre o pop up explicando o poder
func _on_blocoFx_finished():
	pode_usar = true
	get_node("KinematicBody2D").get_node("AnimatedSprite").play("new")
	$KinematicBody2D/AnimatedSprite.play("new")
	
	$kanban.visible = true
	$kanban/Control/WindowDialog.popup_centered()
	# pausa a movimentação do jogador e a cena enquanto o popup está aberto
	$Player/Sprite.play("Idle")
	get_tree().paused = true


