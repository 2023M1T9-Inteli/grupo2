extends Node2D
onready var controle = get_node("/root/CategoriaGlobal")

func _ready():
	#Para permitir que o usuário possa já apertar o botão de restart	
	$startBtn.grab_focus()

func _on_startBtn_pressed():
	#Abre a primeira cena para que o usuário reinicie o jogo	
	if controle.level == "fase 1":
		get_tree().change_scene("res://Cenas/World.tscn")
	elif controle.level == "fase 2":
		get_tree().change_scene("res://Cenas/Cena2.tscn")
	elif controle.level == "fase 3":
		get_tree().change_scene("res://Cenas/Mapa_Gantt.tscn")	
	elif controle.level == "fase 4":
		get_tree().change_scene("res://Cenas/Mapap_do_Kanban.tscn")
