extends Node2D
var video = true

func _ready():
	ControleMusica.play_musica()
	$"popUpRelogio".hide()

func _process(delta):
	if(video):
		if($Player.position.x >= 475):
			$popUpRelogio/Popup.ativaPopUp()
			video = false
