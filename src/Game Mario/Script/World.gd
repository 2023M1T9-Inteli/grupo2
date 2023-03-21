extends Node2D
#Variável de controle para saber se o vídeo tutorial deve ser exibido ou não
var video = true

var relogio = preload("res://Cenas/popUpRelogio.tscn").instance()
#var quiz1 = preload("res://Cenas/quiz1.tscn").instance()
onready var mov = get_node("/root/GlobalTeste")

func _ready():
	$timer/CanvasLayer/Control.start_timer()

func _process(_delta):
	if video:
		if($Player.position.x >= 475 and $Player.position.x <=500):
			#Chama a função do popUp para mostrar o tutorial para o player 
			mov.movimento_player = false
			get_tree().current_scene.add_child(relogio)
			video = false
#	if ($Player.position.x >= 1050):
#		get_tree().current_scene.add_child(quiz1)
#		mov.movimento_player = false
