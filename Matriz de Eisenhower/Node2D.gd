extends Node2D


func _ready():
	$HSlider/Label.text = "Tempo: 0h"
	$HSlider2/Label2.text = "Tempo: 0h"
	$HSlider3/Label3.text = "Tempo: 0h"
	$HSlider4/Label4.text = "Tempo: 0h"
	
	get_node("HSlider").set_max(24)
	get_node("HSlider2").set_max(24)
	get_node("HSlider3").set_max(24)
	get_node("HSlider4").set_max(24)

func _on_HSlider_value_changed(value):
	$HSlider/Label.text = "Tempo:" + str($HSlider.value) + "h"

func _on_HSlider2_value_changed(value):
	$HSlider2/Label2.text = "Tempo:" + str($HSlider2.value) + "h"

func _on_HSlider3_value_changed(value):
	$HSlider3/Label3.text = "Tempo:" + str($HSlider3.value) + "h"

func _on_HSlider4_value_changed(value):
	$HSlider4/Label4.text = "Tempo:" + str($HSlider4.value) + "h"
