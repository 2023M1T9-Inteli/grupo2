extends Node2D
var controle = 1
var animacao 

func _ready():
	$AnimatedSprite.play("anima1")
	$Timer.start()
	
func _on_Timer_timeout():
	controlar()
	mudarAnimacao()
	$Timer.start()

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/InicioMatriz.tscn")
	
func controlar():
	if controle != 32:
		controle += 1
	elif controle == 32:
		get_tree().change_scene("res://Cenas/InicioMatriz.tscn")

func mudarAnimacao():
	animacao = "anima" + str(controle)
	print(animacao)
	$AnimatedSprite.play(animacao)
