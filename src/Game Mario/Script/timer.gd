extends Control
#Variáveis de controle de minutos e segundos.
export (int) var minutes = 0
export (int) var seconds = 100
var ms = 0

func _ready():
#	Deixa o timer pausado para que não rode desde que o jogador inicie o jogo
	pause_timer()


func _process(_delta):
#	Verifica se os segundos são maiores que 60, para assim trocar de minuto
	if seconds > 60:
		minutes += seconds/60
		seconds = (seconds%60)
	#Diminui a cada segundo
	if seconds > 0 and ms <= 0:
		seconds	-= 1
		ms = 10
#	Diminui um minuto após a passagem de 60 segundos
	if minutes > 0 and seconds <= 0:
		minutes	-= 1
		seconds = 60
#	Verifica se os segundos são maiores que 10 e diferentes de 60, pois ambos apresentam diferentes displays
	if seconds >= 10 and seconds != 60:
		$sec.set_text(str(seconds))
#	Caso os segundos sejam iguais à 60, é atribuído 0, pois não há 1:60 no relógio.
	elif seconds == 60:
		$sec.set_text("00")
#	Caso os segundos sejam menores que dez, é atribuído um zero antes dos segundos, para não confundir o jogador
	else:
		$sec.set_text("0" + str(seconds))
#	Verifica se os milissegundos sejam maior que 10, caso contrário, atribuí um zero para evitar erro de visualização
	if ms >= 10:
		$ms.set_text(str(ms))
	else:
		$ms.set_text("0" + str(ms))
#Verifica se os segundos não são iguais a 60, se forem é para exibir 1 minuto a mais para evitar o erro de 1:60
	if seconds != 60:
		#Vefica se os minutos são maiores que 10, caso contrário, atribuí um zero para evitar erro de visualização.
		if minutes >= 10:
			$min.set_text(str(minutes))
		else:
			$min.set_text("0" + str(minutes))
	else:
		#Vefica se os minutos são maiores que 10, caso contrário, atribuí um zero para evitar erro de visualização.
		if minutes >= 10:
			$min.set_text(str(minutes+1))
		else:
			$min.set_text("0" + str(minutes+1))
#	Caso seu tempo se esgote, ele perderá o jogo, assim sendo levado para o gameOver
	if minutes <= 0 and seconds <= 0:
		get_tree().change_scene("res://Cenas/GameOver.tscn")
		
func _on_Timer_timeout():
	ms -= 1

#Função para diminuir os segundos
func _alterSeconds(i):
	seconds -= i

#Função para iniciar o timer com uma determinada quantia de tempo.
func start_timer(sec):
	seconds = sec
	$Timer.start()
	
#Função para parar o timer, quando o jogador apertar pause. Ainda não foi implementada a mecânica de pause.
func pause_timer():
	$Timer.stop()
	
#Função para o inimigo tirar tempo do player
func perder_tempo():
	seconds -= 10


func _on_Button_pressed():
	pause_timer()


func _on_Button2_pressed():
	start_timer(seconds)
