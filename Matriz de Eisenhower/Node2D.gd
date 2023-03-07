extends Node2D

#Variáveis de controle de cada campo da matriz
var impUrg = 0
var impNurg = 0
var nImpUrg = 0
var nImpNurg = 0

func _ready():
	get_node("HSlider").set_max(24)
	get_node("HSlider2").set_max(24)
	get_node("HSlider3").set_max(24)
	get_node("HSlider4").set_max(24)

func _on_HSlider_value_changed(value):
	impUrg= $HSlider.value 
	if (fazerSomaTotal() <= 24):
		$HSlider/Label.text = "Tempo:" + str($HSlider.value) + "h"
	else:
		$HSlider.value = fazerSomaTotal()-24
		
func _on_HSlider2_value_changed(value):
	impNurg= $HSlider2.value 
	if (fazerSomaTotal() <= 24):
		$HSlider2/Label2.text = "Tempo:" + str($HSlider2.value) + "h"
	else:
		$HSlider2.value = fazerSomaTotal() - 24

func _on_HSlider3_value_changed(value):
	nImpUrg = $HSlider3.value 
	if (fazerSomaTotal() <= 24):
		$HSlider3/Label3.text = "Tempo:" + str($HSlider3.value) + "h"
	else:
		$HSlider3.value = fazerSomaTotal()-24

func _on_HSlider4_value_changed(value):
	nImpNurg = $HSlider4.value 
	if (fazerSomaTotal() <= 24):
		$HSlider4/Label4.text = "Tempo:" + str($HSlider4.value) + "h"
	else:
		$HSlider4.value = fazerSomaTotal()-24

#Função de controle para o total de horas não passar de 24hrs
func fazerSomaTotal():
	return impUrg + impNurg + nImpNurg + nImpUrg
	


func _on_Button_pressed():
	$HSlider.hide()
	$HSlider2.hide()
	$HSlider3.hide()
	$HSlider4.hide()
	
#	verificaUrgImp()
#	verificaNurgImp()
#	verificaUrgNimp()
#	verificaNurgNimp()
#
#func verificaUrgImp():
#	if 
#func verificaNurgImp():
#	pass
#func verificaUrgNimp():
#	pass
#func verificaNurgNimp():
#	pass
