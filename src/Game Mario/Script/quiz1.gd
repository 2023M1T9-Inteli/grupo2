extends Node2D

# Called when the node enters the scene tree for the first time.
onready var andar_player = get_node("/root/GlobalTeste")
func _ready():
#	$Popup.popup()
	pass
	


func _on_Popup_popup_hide():
	queue_free()
	andar_player.movimento_player = true
