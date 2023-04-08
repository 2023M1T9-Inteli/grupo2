extends Node2D
#Variavel global de controle para saber em que fase do jogo está
onready var controle = get_node("/root/CategoriaGlobal")

func _ready():
	
	#efeito sonoro
	ControleMusica.gameover()
	
	#Para permitir que o usuário possa já apertar o botão de restart	
	$startBtn.grab_focus()

func _on_startBtn_pressed():
	#Abre a cena em que o usuário estava do início.	
	if controle.level == "fase 1":
		get_tree().change_scene("res://Cenas/Fases/Cena1.tscn")
	elif controle.level == "fase 2":
		get_tree().change_scene("res://Cenas/Fases/Cena2.tscn")
	elif controle.level == "fase 3":
		get_tree().change_scene("res://Cenas/Fases/Mapa_Gantt.tscn")	
	elif controle.level == "fase 4":
		get_tree().change_scene("res://Cenas/Fases/MapaDoKanban.tscn")
	elif controle.level == "fase5":
		get_tree().change_scene("res://Cenas/Fases/MapaFase5.tscn")
