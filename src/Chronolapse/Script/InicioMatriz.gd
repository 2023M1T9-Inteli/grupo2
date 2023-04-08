extends Node2D


#Função para trocar de cena
func _on_Button_pressed():
	#efeito sonoro
	ControleMusica.blocoFx()
	
	get_tree().change_scene("res://Cenas/Matriz/Matriz.tscn")
