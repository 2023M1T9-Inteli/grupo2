extends Node2D


var jogador = preload("res://Branch/Player.tscn").instance()
var kanban = preload("res://Cenas/popUpKanban.tscn").instance()
var pode_atirar = false
var tempo

onready var fase = get_node("/root/CategoriaGlobal")
onready var categoria = get_node("/root/CategoriaGlobal")
#onready var movimento = get_node("/root/GlobalTeste")

func _ready():
	add_child(jogador)

	jogador.position = Vector2(-1687, 161)
	fase.level = "fase 4"
	if(categoria.categoria == 0): tempo = 150
	elif categoria.categoria == 1: tempo = 225
	elif categoria.categoria == 2: tempo = 180
	elif categoria.categoria == 3: tempo = 120
	else: tempo = 225
	$Player/timer/CanvasLayer/Control.start_timer(tempo)
	$KinematicBody2D/AnimatedSprite.play("default")


func _process(delta):
	$Player.morte_queda()
	atirar_flecha()
	
	if !$kanban.visible:
		jogador.movimentacao = true
		self.pause_mode = false



func atirar_flecha():
	#a função só retorna algo se o botão ui_atirar for pressionado e se a variável pode_atirar for verdadeira
	if Input.is_action_just_pressed("ui_atirar") and pode_atirar:

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
		

func _on_Area2D_body_entered(body):
	pode_atirar = true
#	movimento.movimento_player = false
#	jogador.movimentacao = false
#	kanban.visible = true
	
	get_node("KinematicBody2D").get_node("AnimatedSprite").play("new")
	$KinematicBody2D/AnimatedSprite.play("new")
	$kanban.visible = true
	$kanban/Control/WindowDialog.popup_centered()
	jogador.movimentacao = false
	$Player/Sprite.play("Idle")
	self.pause_mode = true
