extends Node2D

#Variáveis de controle de cada quadrante da matriz
#Imp representa importante e Urg representa urgente, o N serve para representar a negação de um campo
var impUrg = 0
var impNurg = 0
var nImpUrg = 0
var nImpNurg = 0

func _ready():
	$btnJogar.hide()
	
#Função de controle para o total de horas não passar de 24hrs
func fazerSomaTotal():
	return impUrg + impNurg + nImpNurg + nImpUrg

#Função para diminuir uma hora de uma categoria qualquer
func diminuirValor(categoria,Label,ProgressBar):
#	Verifica se a categoria não ficará negativa
	if categoria > 0:
		#Altera tanto o label quanto a progress bar para a nova quantidade de horas
		Label.text = "Tempo: " + str(categoria-1) + "h"
		ProgressBar.value = categoria - 1
		#Retorna verdadeiro para permitir que seja diminuido 1 da variável global
		return true
	#Retorna falso para impedir que seja diminuído 1 da variável global
	return false

#Função para aumentar uma hora de uma categoria qualquer
func aumentarValor(categoria,Label,ProgressBar):
	#Verifica se o aumento não ultrapassará as 24 horas	
	if(fazerSomaTotal()+1 <= 24):
		#Altera tanto o label quanto a progress bar para a nova quantidade de horas
		Label.text = "Tempo: " + str(categoria+1) + "h"
		ProgressBar.value = categoria + 1
		#Retorna verdadeiro para permitir que seja aumentado 1 da variável global
		return true
	#Retorna falso para impedir que seja aumentado 1 da variável global
	return false

func _on_BtnImpUrgMenos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável ImpUrg
	if diminuirValor(impUrg,$LblImportanteUrgente,$ProgressBarImpUrg):
		impUrg -= 1

func _on_BtnImpUrgMais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável ImpUrg
	if aumentarValor(impUrg,$LblImportanteUrgente,$ProgressBarImpUrg):
		impUrg +=1	

func _on_BtnImpNurgMenos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável ImpNurg
	if diminuirValor(impNurg,$LblImportanteNUrgente,$ProgressBarImpNUrg):
		impNurg -= 1

func _on_BtnImpNurgMais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável ImpNurg
	if aumentarValor(impNurg,$LblImportanteNUrgente,$ProgressBarImpNUrg):
		impNurg +=1

func _on_BtnNImpUrgMenos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável NImpUrg
	if diminuirValor(nImpUrg,$LblNImportanteUrgente,$ProgressBarNImpUrg):
		nImpUrg -= 1

func _on_BtnNImpUrgMais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável NImpUrg
	if aumentarValor(nImpUrg,$LblNImportanteUrgente,$ProgressBarNImpUrg):
		nImpUrg +=1
		
func _on_BtnNImpNUrgMenos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável NImpNUrg
	if diminuirValor(nImpNurg,$LblNImportanteNUrgente,$ProgressBarNImpNUrg):
		nImpNurg -= 1

func _on_BtnNImpNUrgMais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável NImpNUrg
	if aumentarValor(nImpNurg,$LblNImportanteNUrgente,$ProgressBarNImpNUrg):
		nImpNurg +=1

#Envia as variáveis para a análise da matriz, dando um feedback para o usuário sobre a 
#organização de suas tarefas
func _on_Button_pressed():
	$btnJogar.show()	
	#Análise da categoria Importante e Urgente, dando seu feedback dependendo da quantidade de horas	
	if impUrg > 6:
		$LblImportanteUrgente.text ="Você tem muitas tarefas urgentes e importantes! Tente rever as suas prioridades e repensar na importância de cada uma."
	elif impUrg < 4:
		$LblImportanteUrgente.text = "Você não tem muitas tarefas urgentes e importantes em sua lista! Considere adicionar tarefas que possam melhorar sua produtividade no futuro."
	else:
		$LblImportanteUrgente.text = "Você tem um bom equilíbrio de tarefas urgentes e importantes! Continue a priorizar essas tarefas e mantenha o bom trabalho."
	
	#Análise da categoria Importante e Não Urgente, dando seu feedback dependendo da quantidade de horas
	if impNurg > 15:
		$LblImportanteNUrgente.text = "Você tem muitas tarefas importantes que não são urgentes! Isso dificulta a sua organização, o que pode tornar essas tarefas urgentes no futuro."
	elif impNurg < 13:
		$LblImportanteNUrgente.text = "Você não tem muitas tarefas importantes que não são urgentes! Considere adicionar tarefas que você considera importante, mas que não tem a necessidade de serem completadas imediatamente."
	else:
		$LblImportanteNUrgente.text = "Você tem um bom número de tarefas importantes que não são urgentes! Certifique-se de continuar a trabalhar nessas tarefas e mantenha o bom trabalho."
	
	#Análise da categoria Não Importante e Urgente, dando seu feedback dependendo da quantidade de horas
	if nImpUrg > 5:
		$LblNImportanteUrgente.text = "Você tem muitas tarefas não importantes que são urgentes! Tente delegar ou eliminar essas tarefas da sua lista para ter um melhor aproveitamento do seu tempo."
	elif nImpUrg < 3:
		$LblNImportanteUrgente.text = "Você não tem muitas tarefas não importantes que são urgentes! Certifique-se de priorizar as tarefas que são realmente importantes para você."
	else:
		$LblNImportanteUrgente.text = "Você tem um bom número de tarefas não importantes que são urgentes! Continue a se organizar dessa maneira e mantenha o bom trabalho."

	#Análise da categoria Não Importante e Não Urgente, dando seu feedback dependendo da quantidade de horas
	if nImpNurg > 2:
		$LblNImportanteNUrgente.text = "Você tem muitas tarefas não importantes não urgentes! Tente rever suas prioridades e reavaliar a importância das suas tarefas."
	else:
		$LblNImportanteNUrgente.text = "Você tem um bom número de tarefas não importantes não urgentes! Continue a priorizar as tarefas certas e mantenha o bom trabalho."


func _on_btnJogar_pressed():
	get_tree().change_scene("res://Cenas/World.tscn")
