
extends Node

#cria variavel e carrega a musica principal do jogo
var musica_tematica = load("res://efeito sonoros/theWknd.ogg")

#função para tocar a musica
func play_musica():
	#carrega a musica tematica e toca
	$musica.stream = musica_tematica
	$musica.play() 

#funcao para tocar efeito sonoro do botao de start
func botao_start():
	$BotaoStartFx.play()

#funcao para tocar efeito sonoro do poder do kanban
func kanbanFx():
	$PoderKanbanFx.play()
	
#funcao para tocar efeito sonoro do personagem tomando dano
func danoPersonagem():
	$DanoPersonagemFx.play()
	
#funcao para tocar efeito sonoro da tela de gameover
func gameover():
	$gameoverFx.play()

	
#funcao para tocar efeito sonoro do poder do pomodoro
func pomodoroFx():
	$pomodoroFx.play()

	
