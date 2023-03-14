extends Node2D


func _ready():
	pass

#quando pressionar o botao
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Cenas/primeiraTela.tscn")
