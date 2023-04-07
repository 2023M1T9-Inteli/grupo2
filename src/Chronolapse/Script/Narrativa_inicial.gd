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
	if controle != 18:
		controle += 1
	elif controle == 18:
		get_tree().change_scene("res://Cenas/NarrativaInicial2.tscn")

func mudarAnimacao():
	animacao = "anima" + str(controle)
	$AnimatedSprite.play(animacao)
