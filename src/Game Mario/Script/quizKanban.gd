extends Node2D
var cont = 0

func _ready():
	$perguntas.show()
	$erro.hide()
	$acerto.hide()
	
	
func _process(delta):
	if cont ==3:
		get_tree().change_scene("res://Cenas/GameOver.tscn")
		
func _on_avancar_pressed():
	get_tree().change_scene("res://Cenas/Mapa_Gantt.tscn")

func _on_Button4_pressed():
	$perguntas.hide()
	$acerto.show()

func _on_Button3_pressed():
	$perguntas.hide()
	$erro.show()
	cont+=1

func _on_Button2_pressed():
	$perguntas.hide()
	$erro.show()
	cont+=1
	

func _on_Button_pressed():
	$perguntas.hide()
	$erro.show()
	cont+=1

func _on_TextureButton_pressed():
	$erro.hide()
	$perguntas.show()
