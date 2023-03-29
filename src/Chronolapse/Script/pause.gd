extends CanvasLayer


func _process(delta):
	if $popUpControl.fechou:
		$popUpControl.visible = false


func _on_retornar_pressed():
	$".".visible = false


func _on_controlBtn_pressed():
	$popUpControl.visible = true
	$popUpControl.fechou = false


func _on_quitBtn_pressed():
	get_tree().change_scene("res://Cenas/primeiraTela.tscn")
