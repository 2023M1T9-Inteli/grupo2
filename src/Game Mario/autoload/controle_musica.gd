
extends Node

#cria variavel e carrega a musica principal do jogo
var musica_tematica = load("res://efeito sonoros/theWknd.ogg")

#função para tocar a musica
func play_musica():
	#carrega a musica tematica e toca
	$musica.stream = musica_tematica
	$musica.play() 
