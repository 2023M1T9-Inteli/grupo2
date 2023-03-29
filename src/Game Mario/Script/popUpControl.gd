extends CanvasLayer


var fechou = false

func _ready():
	$".".visible = false

#função que fecha o popup assim que o botão é pressionado
func _on_TextureButton_pressed():
	$".".visible = false
	fechou = true
