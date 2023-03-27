extends Node2D


#funçao que fecha o popup e volta para a tela inicial
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Cenas/primeiraTela.tscn")
