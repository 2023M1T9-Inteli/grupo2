extends Control




func _ready():
	$controls/startBtn.grab_focus()



func _on_startBtn_pressed():
	get_tree().change_scene("res://Cenas/World.tscn")#vai para a proxima tela

func _on_controlBtn_pressed():
	var controlScreen = load("res://ControlScreens.tscn").instance() #aparecer menu de controle
	get_tree().current_scene.add_child(controlScreen) #voltar ao menu

func _on_quitBtn_pressed():
	get_tree().quit() #do proprio programa que fecha ele 


