extends Node2D

func _ready():
	$startBtn.grab_focus()

func _on_startBtn_pressed():
	get_tree().change_scene("res://Cenas/primeira_tela.tscn")
