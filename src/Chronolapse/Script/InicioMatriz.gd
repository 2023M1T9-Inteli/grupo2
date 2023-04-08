extends Node2D

func _ready():
	pass

func _on_Button_pressed():
	#Muda a cena para a tela em que usuário fará sua matriz
	get_tree().change_scene("res://Cenas/Matriz/Matriz.tscn")
