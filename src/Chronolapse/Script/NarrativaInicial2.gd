extends Node2D
var controle = 18
var animacao 

func _ready():
	$AnimatedSprite.play("anima18")
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
	$AnimatedSprite.play(animacao)
