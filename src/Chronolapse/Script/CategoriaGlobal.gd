extends Node

#script global

#variáveis utilizadas para definir em qual fase o usuário está
var categoria = 1
var level = "fase 1"

#variáveis utlizadas para fazer o player andar ou parar
var andar = false
var movimento_player = true
var direcao_do_jogador = false

#Função para trocar de fase
func trocaFase():
	if Input.is_action_pressed("ui_fase1"):
		get_tree().change_scene("res://Cenas/Cena1.tscn")
	if Input.is_action_pressed("ui_fase2"):
		get_tree().change_scene("res://Cenas/Cena2.tscn")
	if Input.is_action_pressed("ui_fase3"):
		get_tree().change_scene("res://Cenas/MapaGut.tscn")
	if Input.is_action_pressed("ui_fase4"):
		get_tree().change_scene("res://Cenas/MapaDoKanban.tscn")
	if Input.is_action_pressed("ui_fase5"):
		get_tree().change_scene("res://Cenas/MapaFase5.tscn")
	if Input.is_action_pressed("ui_matriz"):
		get_tree().change_scene("res://Cenas/InicioMatriz.tscn")
	if Input.is_action_pressed("ui_quiz"):
		get_tree().change_scene("res://Cenas/quizPomodoro.tscn")
