extends Node

#cria variavel e carrega a musica principal do jogo
var musica_tematica = load("res://efeitos sonoros/theWeeknd.ogg")

#função para tocar a musica
func play_musica():
	$musica.stream = musica_tematica
	$musica.play()
