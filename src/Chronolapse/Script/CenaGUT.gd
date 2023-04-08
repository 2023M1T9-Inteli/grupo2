extends Node2D


var jogador = preload("res://Branch/Player.tscn").instance()
var pode_atirar = false
var tempo

onready var fase = get_node("/root/CategoriaGlobal")
onready var categoria = get_node("/root/CategoriaGlobal")


func _ready():
#	Atribui o valor a variável global level, para que caso ocorra GameOver, saiba-se em que nível está. 
	fase.level = "fase 3"
	jogador.position = Vector2(-1844, 526)
#adiciona a cena do jogador na cena atual
	add_child(jogador)
	$KinematicBody2D/AnimatedSprite.play("default")
#	Define a quantidade de tempo que o jogador terá para completar a fase com base no desempenho da matriz
	if(categoria.categoria == 0): tempo = 150
	elif categoria.categoria == 1: tempo = 225
	elif categoria.categoria == 2: tempo = 180
	elif categoria.categoria == 3: tempo = 120
	else: tempo = 225

	#	Inicia o timer
	$Player/timer/CanvasLayer/Control.start_timer(tempo)


func _process(_delta):
	#player morre de queda
	$Player.morte_queda()
	#atirar poder se for true
	atirar_flecha()
	
	#torna o popup invisível enquanto o bloco não é acionado
	if !$gut.visible:
		get_tree().paused = false



func atirar_flecha():
	#a função só retorna algo se o botão ui_atirar for pressionado e se a variável pode_atirar for verdadeira
	if Input.is_action_just_pressed("ui_atirar") and pode_atirar:
		
		$LaserFx.play()

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
		


#funcao para tocar o efeito sonoro quando player encosta no bloco
func _on_Area2D_body_entered(_body):
	#efeito sonoro
	$blocoFx.play()
		
#função chamada assim que o player interage com o Bloco_Tomate
func _on_blocoFx_finished():
	pode_atirar = true
	$KinematicBody2D/AnimatedSprite.play("new")
		
	$gut.visible = true
	$gut/popup.popup_centered()
# pausa a movimentação do jogador e a cena enquanto o popup está aberto
	$Player/Sprite.play("Idle")
	get_tree().paused = true


