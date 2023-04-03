extends Node2D
#Variável de controle para saber se o vídeo tutorial deve ser exibido ou não
var video = true
var tempo
#var quiz1 = preload("res://Cenas/quiz1.tscn").instance()
onready var mov = get_node("/root/GlobalTeste")
onready var categoria = get_node("/root/CategoriaGlobal")

func _ready():
#	Atribui um valor para o tempo que o jogador tem, baseado no desempenho da matriz
	if(categoria.categoria == 0): tempo = 150
	elif categoria.categoria == 1: tempo = 225
	elif categoria.categoria == 2: tempo = 180
	elif categoria.categoria == 3: tempo = 120
	else: tempo = 225
#	Invoca o timer e passa quanto tempo ele deve ter
	$Player/timer/CanvasLayer/Control.start_timer(tempo)
	$popUpRelogio.visible = false
	self.pause_mode = false
	
func _process(_delta):

	#se o player cair fora do mapa, troca para cena gameover
	$Player.morte_queda()
	if !$popUpRelogio.visible and !$Player.pausar:
		get_tree().paused = false

	
func _on_Area2D_body_entered(body):
	$popUpRelogio.visible = true
	$popUpRelogio/Popup.popup_centered()
	$AnimatedSprite.visible = false
	get_tree().paused = true

