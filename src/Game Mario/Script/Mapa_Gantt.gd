extends Node2D

onready var fase = get_node("/root/CategoriaGlobal")
var jogador = preload("res://Branch/Player.tscn").instance()
var pode_atirar = false



func _ready():
	fase.level = "fase 3"
	jogador.position = Vector2(-1844, 526)
	add_child(jogador)
	$KinematicBody2D/AnimatedSprite.play("default")



func _process(delta):
	$Player.morte_queda()
	atirar_flecha()



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
	$KinematicBody2D/AnimatedSprite.play("new")
