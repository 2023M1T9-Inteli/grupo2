extends Node2D

func _ready():
	#Para permitir que o usuário possa já apertar o botão de restart	
	$startBtn.grab_focus()

func _on_startBtn_pressed():
	#Abre a primeira cena para que o usuário reinicie o jogo	
	get_tree().change_scene("res://Cenas/World.tscn")
