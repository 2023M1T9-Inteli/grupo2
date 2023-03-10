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
		$LblImportanteUrgente.text ="Você tem muitas tarefas urgentes e importantes! Tente rever as suas prioridades e repensar na importância de cada uma."
	elif impUrg < 4:
		$LblImportanteUrgente.text = "Você não tem muitas tarefas urgentes e importantes em sua lista! Considere adicionar tarefas que possam melhorar sua produtividade no futuro."
	else:
		$LblImportanteUrgente.text = "Você tem um bom equilíbrio de tarefas urgentes e importantes! Continue a priorizar essas tarefas e mantenha o bom trabalho."
	
	if impNurg > 15:
		$LblImportanteNUrgente.text = "Você tem muitas tarefas importantes que não são urgentes! Isso dificulta a sua organização, o que pode tornar essas tarefas urgentes no futuro."
	elif impNurg < 13:
		$LblImportanteNUrgente.text = "Você não tem muitas tarefas importantes que não são urgentes! Considere adicionar tarefas que você considera importante, mas que não tem a necessidade de serem completadas imediatamente."
	else:
		$LblImportanteNUrgente.text = "Você tem um bom número de tarefas importantes que não são urgentes! Certifique-se de continuar a trabalhar nessas tarefas e mantenha o bom trabalho."
	
	if nImpUrg > 5:
		$LblNImportanteUrgente.text = "Você tem muitas tarefas não importantes que são urgentes! Tente delegar ou eliminar essas tarefas da sua lista para ter um melhor aproveitamento do seu tempo."
	elif nImpUrg < 3:
		$LblNImportanteUrgente.text = "Você não tem muitas tarefas não importantes que são urgentes! Certifique-se de priorizar as tarefas que são realmente importantes para você."
	else:
		$LblNImportanteUrgente.text = "Você tem um bom número de tarefas não importantes que são urgentes! Continue a se organizar dessa maneira e mantenha o bom trabalho."
	
	if nImpNurg > 2:
		$LblNImportanteNUrgente.text = "Você tem muitas tarefas não importantes não urgentes! Tente rever suas prioridades e reavaliar a importância das suas tarefas."
	elif nImpNurg < 1:
		$LblNImportanteNUrgente.text = "Você não tem muitas tarefas não importantes não urgentes! Considere adicionar tarefas que possam melhorar sua vida pessoal ou profissional no futuro."
	else:
		$LblNImportanteNUrgente.text = "Você tem um bom número de tarefas não importantes não urgentes! Continue a priorizar as tarefas certas e mantenha o bom trabalho."
