extends CanvasLayer

# função que verifica o estado do canvaslayer e mantém o pop up invisivel quando a condição fechou permanece verdadeira
func _process(_delta):
	if $popUpControl.fechou:
		$popUpControl.visible = false


# botão de retornar do pause, que retira o estado de paused da tree, ou seja, de todas as outras cenas
func _on_retornar_pressed():
	$".".visible = false
	get_tree().paused = false


# botão que aciona o pop up de controles
func _on_controlBtn_pressed():
	$popUpControl.visible = true
	$popUpControl.fechou = false


# botão de retornar a tela de menu, muda de cena para a primeira tela e retira o estado de paude da tree
func _on_quitBtn_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Cenas/primeiraTela.tscn")
