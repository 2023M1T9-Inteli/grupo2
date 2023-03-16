extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var tela = get_viewport()
	$Popup.popup_centered()



func _on_Popup_popup_hide():
	queue_free()
