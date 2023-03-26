extends Node2D

# Called when the node enters the scene tree for the first time.
onready var player = get_node("/root/GlobalTeste")

func _ready():
	$Popup.popup()
	
func _process(_delta):
	pass

func _on_Popup_popup_hide():
#	Permite o jogador voltar a andar quanto o popUp estiver fechado
	player.movimento_player = true
	queue_free()
