extends Node2D

#Variáveis de controle de cada quadrante da matriz
#Imp representa importante e Urg representa urgente, o N serve para representar a negação de um campo
var imp_urg = 0 # variável importante e urgente
var imp_n_urg = 0 # variável importante e não urgente
var n_imp_urg = 0 # variavel não importante e urgente
var n_imp_n_urg = 0 # não importante e não urgente
#Variável para controlar quais da categorias tem a maior discrepância entre o ideal
var index
#Variável global, a qual armazena a categoria
onready var categoria = get_node("/root/CategoriaGlobal")
var cliclou2 = false
func _ready():
	$Jogar.hide()
	
	
	
	
	
	
	
	
	
	
	
	
#Função de controle para o total de horas não passar de 24hrs
func fazer_Soma_Total():
	return imp_urg + imp_n_urg + n_imp_n_urg + n_imp_urg

func alteraLabel(temp):
	$Label2.text = "Tempo total: "+ str(temp) + "h"
	
#Função para diminuir uma hora de uma categoria qualquer
func diminuir_Valor(categoria,Label,ProgressBar):
#	Verifica se a categoria não ficará negativa
	if categoria > 0:
		#Altera tanto o label quanto a progress bar para a nova quantidade de horas
		Label.text = "Tempo: " + str(categoria-1) + "h"
		ProgressBar.value = categoria - 1
		alteraLabel(fazer_Soma_Total()-1)
		#Retorna verdadeiro para permitir que seja diminuido 1 da variável global
		return true
	#Retorna falso para impedir que seja diminuído 1 da variável global
	return false

#Função para aumentar uma hora de uma categoria qualquer
func aumentar_Valor(categoria,Label,ProgressBar):
	#Verifica se o aumento não ultrapassará as 24 horas	
	if(fazer_Soma_Total()+1 <= 24):
		#Altera tanto o label quanto a progress bar para a nova quantidade de horas
		Label.text = "Tempo: " + str(categoria + 1) + "h"
		ProgressBar.value = int(categoria) + 1
		alteraLabel(fazer_Soma_Total()+1)
		#Retorna verdadeiro para permitir que seja aumentado 1 da variável global
		return true
	#Retorna falso para impedir que seja aumentado 1 da variável global
	return false

func _on_IU_menos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável imp_urg
	if diminuir_Valor(imp_urg,$LblImportanteUrgente,$ProgressBarImpUrg):
		imp_urg -= 1

func _on_IU_mais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável imp_urg
	if aumentar_Valor(imp_urg,$LblImportanteUrgente,$ProgressBarImpUrg):
		imp_urg +=1

func _on_INU_menos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável ImpNurg
	if diminuir_Valor(imp_n_urg,$LblImportanteNUrgente,$ProgressBarImpNUrg):
		imp_n_urg -= 1

func _on_INU_mais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável ImpNurg
	if aumentar_Valor(imp_n_urg,$LblImportanteNUrgente,$ProgressBarImpNUrg):
		imp_n_urg +=1

func _on_NIU_menos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável Nimp_urg
	if diminuir_Valor(n_imp_urg,$LblNImportanteUrgente,$ProgressBarNImpUrg):
		n_imp_urg -= 1

func _on_NIU_mais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável Nimp_urg
	if aumentar_Valor(n_imp_urg,$LblNImportanteUrgente,$ProgressBarNImpUrg):
		n_imp_urg +=1
		
func _on_NINU_menos_pressed():
	#Chama a função para a verificar se é possível diminuir a variável NImpNUrg
	if diminuir_Valor(n_imp_n_urg,$LblNImportanteNUrgente,$ProgressBarNImpNUrg):
		n_imp_n_urg -= 1

func _on_NINU_mais_pressed():
	#Chama a função para a verificar se é possível aumentar a variável NImpNUrg
	if aumentar_Valor(n_imp_n_urg,$LblNImportanteNUrgente,$ProgressBarNImpNUrg):
		n_imp_n_urg +=1

#Envia as variáveis para a análise da matriz, dando um feedback para o usuário sobre a 
#organização de suas tarefas
func _on_Analise_pressed():
#	Mostra o botão de jogar
	$Jogar.show()	
	
	$TextEdit.hide()
	$TextEdit2.hide()
	$TextEdit3.hide()
	$TextEdit4.hide()
	
	
#	Desabilita os botões de subtrair e adicionar horas para evitar que o jogador altere suas horas após pedir análise
	$IU_mais.disabled = true
	$IU_menos.disabled = true
	$INU_mais.disabled = true
	$INU_menos.disabled = true
	$NIU_mais.disabled = true
	$NIU_menos.disabled = true
	$NINU_mais.disabled = true
	$NINU_menos.disabled = true
	#Diferença entre as horas ideais e o apresentado pelo player 	
	var perc_iu = abs(imp_urg-5.0)
	var perc_i_nu = abs(imp_n_urg-14.0)
	var perc_ni_u = abs(n_imp_urg-4.0)
	var perc_ni_nu = abs(n_imp_n_urg-2.0)
	
	#Lista com os percentuais
	var lista = [perc_iu,perc_i_nu,perc_ni_u,perc_ni_nu]
	#variável auxiliar para indicar em qual índice da lista ele está
	var counter = 0
	#For para percorrer a lista e achar a posição com o maior valor
	for i in lista:
		if i == lista.max():
			index = counter
		counter += 1 
	
	#Análise da categoria Importante e Urgente, dando seu feedback dependendo da quantidade de horas	
	if imp_urg > 6:
		$LblImportanteUrgente.text ="Você tem muitas tarefas urgentes e importantes! Atividades importantes têm a ver com o resultado, contribui para nossa missão, nossos valores e metas prioritárias.  As tarefas que estão nesse quadrante atendem a isso?"
	elif imp_urg < 4:
		$LblImportanteUrgente.text = "Você não tem muitas tarefas urgentes e importantes em sua lista! Considere adicionar tarefas que possam melhorar sua produtividade no futuro."
	else:
		$LblImportanteUrgente.text = "Você tem um bom equilíbrio de tarefas urgentes e importantes! Continue a priorizar essas tarefas e mantenha o bom trabalho."
	
	#Análise da categoria Importante e Não Urgente, dando seu feedback dependendo da quantidade de horas
	if imp_n_urg > 15:
		$LblImportanteNUrgente.text = "Você tem muitas tarefas importantes que não são urgentes! Isso dificulta a sua organização, o que pode tornar essas tarefas urgentes no futuro."
	elif imp_n_urg < 13:
		$LblImportanteNUrgente.text = "Você não tem muitas tarefas importantes que não são urgentes! Considere adicionar tarefas que você considera importante, mas que não tem a necessidade de serem completadas imediatamente."
	else:
		$LblImportanteNUrgente.text = "Você tem um bom número de tarefas importantes que não são urgentes! Certifique-se de continuar a trabalhar nessas tarefas e mantenha o bom trabalho."
	
	#Análise da categoria Não Importante e Urgente, dando seu feedback dependendo da quantidade de horas
	if n_imp_urg > 5:
		$LblNImportanteUrgente.text = "Você tem muitas tarefas não importantes que são urgentes! Tente delegar ou eliminar essas tarefas da sua lista para ter um melhor aproveitamento do seu tempo."
	elif n_imp_urg < 3:
		$LblNImportanteUrgente.text = "Você não tem muitas tarefas não importantes que são urgentes! Certifique-se de priorizar as tarefas que são realmente importantes para você."
	else:
		$LblNImportanteUrgente.text = "Você tem um bom número de tarefas não importantes que são urgentes! Continue a se organizar dessa maneira e mantenha o bom trabalho."

	#Análise da categoria Não Importante e Não Urgente, dando seu feedback dependendo da quantidade de horas
	if n_imp_n_urg > 2:
		$LblNImportanteNUrgente.text = "Você tem muitas tarefas não importantes não urgentes! Tente rever suas prioridades e reavaliar a importância das suas tarefas."
	else:
		$LblNImportanteNUrgente.text = "Você tem um bom número de tarefas não importantes não urgentes! Continue a priorizar as tarefas certas e mantenha o bom trabalho."


func _on_Jogar_pressed():
#	Atribui o tipo da matriz que teve mais discrepância a global Categoria, para que se possa definir a quantidade de horas para cada fase.
	categoria.categoria = index
	get_tree().change_scene("res://Cenas/World.tscn")



