extends Node2D

func _ready():
	$AnimatedSprite.play("anim1")
	$Timer.start()
	
func _on_Timer_timeout():
	$Timer2.start()
	$AnimatedSprite.play("anim2")
	
func _on_Timer2_timeout():
	$Timer3.start()
	$AnimatedSprite.play("anim3")

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Matriz.tscn")

func _on_Timer3_timeout():
	get_tree().change_scene("res://Cenas/Matriz.tscn")
