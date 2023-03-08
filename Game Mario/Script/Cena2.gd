extends Node

var Tomate = preload("res://Cenas/Tomate.tscn")
var jogador = preload("res://Branch/Player.tscn").instance()
var gravidadeDoTomate = 40
var velocidadeDoTomate = Vector2(0.0, 0.0)
var atirando = false
var b = 0

func _ready():
	add_child(jogador)
	$Bloco_Tomate/AnimatedSprite.play("default")
	$Node2D.hide()



func _process(_delta):
	atirar_tomate()
	
	

func atirar_tomate():
	if Input.is_action_just_pressed("ui_atirar") and atirando:
		var direcao
		var tomate = Tomate.instance()
		if $Player/Sprite.flip_h == true:
			direcao = 1
			tomate.position = Vector2($Player.position.x - 55, $Player.position.y)
			tomate.linear_velocity = (Vector2(-550, 40))
		else:
			direcao = 0
			tomate.position = Vector2($Player.position.x + 55, $Player.position.y)
			tomate.linear_velocity = (Vector2(550, 40))
		add_child(tomate)


func _on_Area2D_body_entered(body):
	get_node("Bloco_Tomate").get_node("AnimatedSprite").play("new_default")
	atirando = true
	$Node2D.show()
