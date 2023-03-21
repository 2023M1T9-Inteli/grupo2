extends Node2D

# Called when the node enters the scene tree for the first time.
onready var player = get_node("/root/GlobalTeste")

func _ready():
	$Popup.popup()
	
func _process(delta):
	print(player.movimento_player)

func _on_Popup_popup_hide():
	player.movimento_player = true
	print("fechou")
	print(player.movimento_player)
	queue_free()
