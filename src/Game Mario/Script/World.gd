extends Node2D
#Variável de controle para saber se o vídeo tutorial deve ser exibido ou não
var video = true

func _ready():
	#Esconde o tutorial para que o jogador não veja antes de ver o primeiro inimigo
	$"popUpRelogio".hide()

func _process(_delta):
	#Verifica se deve mostrar o vídeo
	if(video):
		#Verifica a posição do jogador		
		if($Player.position.x >= 475):
			#Chama a função do popUp para mostrar o tutorial para o player 
			$popUpRelogio/Popup.ativa_pop_up()
			#Desativa a possibilidade de mostrar o vídeo novamente, permitindo assim que o usuário feche o vídeo
			video = false
