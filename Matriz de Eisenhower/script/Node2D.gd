extends Node2D

#Variáveis de controle de cada campo da matriz
var impUrg = 0
var impNurg = 0
var nImpUrg = 0
var nImpNurg = 0

func _ready():
	pass
	
#Função de controle para o total de horas não passar de 24hrs
func fazerSomaTotal():
	return impUrg + impNurg + nImpNurg + nImpUrg
	
func _on_BtnImpUrgMenos_pressed():
	if impUrg != 0:
		impUrg -= 1
#		Retângulo q acenderá 
		$LblImportanteUrgente.text = "Tempo: " + str(impUrg) + "h"
		$ProgressBarImpUrg.value = impUrg

func _on_BtnImpUrgMais_pressed():
	impUrg += 1
	if(fazerSomaTotal() <= 24):
		#Retângulo pintando
		$LblImportanteUrgente.text = "Tempo: " + str(impUrg) + "h"
		$ProgressBarImpUrg.value = impUrg
	else:
		impUrg -=1

func _on_BtnImpNurgMenos_pressed():
	if impNurg != 0:
		impNurg -= 1
#		Retângulo q acenderá 
		$LblImportanteNUrgente.text = "Tempo: " + str(impNurg) + "h"
		$ProgressBarImpNUrg.value = impNurg


func _on_BtnImpNurgMais_pressed():
	impNurg += 1
	if(fazerSomaTotal() <= 24):
		#Retângulo pintando
		$LblImportanteNUrgente.text = "Tempo: " + str(impNurg) + "h"
		$ProgressBarImpNUrg.value = impNurg
	else:
		impNurg -=1

func _on_BtnNImpUrgMenos_pressed():
	if nImpUrg != 0:
		nImpUrg -= 1
#		Retângulo q acenderá 
		$LblNImportanteUrgente.text = "Tempo: " + str(nImpUrg) + "h"
		$ProgressBarNImpUrg.value = nImpUrg


func _on_BtnNImpUrgMais_pressed():
	nImpUrg += 1
	if(fazerSomaTotal() <= 24):
		#Retângulo pintando
		$LblNImportanteUrgente.text = "Tempo: " + str(nImpUrg) + "h"
		$ProgressBarNImpUrg.value = nImpUrg
	else:
		nImpUrg -=1
		
func _on_BtnNImpNUrgMenos_pressed():
	if nImpNurg != 0:
		nImpNurg -= 1
#		Retângulo q acenderá 
		$LblNImportanteNUrgente.text = "Tempo: " + str(nImpNurg) + "h"
		$ProgressBarNImpNUrg.value = nImpNurg


func _on_BtnNImpNUrgMais_pressed():
	nImpNurg += 1
	if(fazerSomaTotal() <= 24):
		#Retângulo pintando
		$LblNImportanteNUrgente.text = "Tempo: " + str(nImpNurg) + "h"
		$ProgressBarNImpNUrg.value = nImpNurg
	else:
		nImpNurg -=1


func _on_Button_pressed():
	if impUrg > 6:
		$LblImportanteUrgente.text ="Bombeiro"
	elif impUrg < 4:
		$LblImportanteUrgente.text = "Faltam atividades"
	else:
		$LblImportanteUrgente.text = "Carai meno ta perfeito viado"
	
	if impNurg > 15:
		$LblImportanteNUrgente.text = "Ta organizado ate demais paizao"
	elif impNurg < 13:
		$LblImportanteNUrgente.text = "Se organiza melhor ai"
	else:
		$LblImportanteNUrgente.text = "Carai meno ta perfeito viado"
	
	if nImpUrg > 5:
		$LblNImportanteUrgente.text = "Ta organizado ate demais paizao"
	elif nImpUrg < 3:
		$LblNImportanteUrgente.text = "Se organiza melhor ai"
	else:
		$LblNImportanteUrgente.text = "Carai meno ta perfeito viado"
	
	if nImpNurg > 2:
		$LblNImportanteNUrgente.text = "Ta organizado ate demais paizao"
	elif nImpNurg < 1:
		$LblNImportanteNUrgente.text = "Se organiza melhor ai"
	else:
		$LblNImportanteNUrgente.text = "Carai meno ta perfeito viado"

