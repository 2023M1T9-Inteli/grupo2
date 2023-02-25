extends KinematicBody2D	

const UP = Vector2(0,-1)
const GRAVITY = 40 # dobrou o valor antes era 20
var SPEED = 250
var JUMP_HEIGHT = -800 # antes era 550

var motion = Vector2() # vai passar duas variaveis x e y.

onready var ani = $Sprite

var recorded_data = [] # this is our array we update when moving, check when recording
var is_rewinding = false # we'll use this to disable this object when true. so we can add recorded data to it
var rewind_length = (60 * 3) # 180 this is 3seconds running at 60fps
var rewind_ghost = load("res://Cenas/rewind_ghost.tscn") # direct to a sprite we'll use as a ghost

#aciona os processos físico do personagem, ou seja, a movimentação de andar para os lados e pular. Além de conter a gravdidade para queda da personagem
func _physics_process(delta):
	handle_rewind_function()
	motion.y += GRAVITY
	player_movement()
	
	if is_on_floor(): # AVISO do que falta: colcoar imagme do pulo quando tiver pronta
#		print("esta no chao")
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT	
			
	motion = move_and_slide(motion, UP)
	


func handle_rewind_function():
	var ani_number = ani.get_index()
	var dir_number = 0

	if(Input.is_action_pressed("ui_space")): # DO REWIND
		is_rewinding = true
		if(recorded_data.size() > 0):
			var current_frame = recorded_data[0]
			
			#Set our values to the first frame of the array
			if(current_frame != null):
				ani.animation = current_frame[0]
				global_position = current_frame[1]
				ani.flip_h = current_frame[2]
				
				var ghost : Sprite = rewind_ghost.instance()
				ghost.texture = ani.frames.get_frame(ani.animation,ani.frame)
				ghost.global_position = global_position
				ghost.flip_h = ani.flip_h
				get_parent().add_child(ghost)
				
			#remove thet first frame as we've just used it
			recorded_data.pop_front()
			
	else: # WE are recording
		is_rewinding = false
		
		if(ani.flip_h):
			dir_number = 1
		else:
			dir_number = 0
		
		recorded_data.push_front([ani.animation,global_position,ani.flip_h])
		if(recorded_data.size() > rewind_length): #our record is longer than 3 secs, remove last frame
			recorded_data.pop_back()

#movimentos da personagem principal(Player), como andar para os lados e pular
func player_movement():
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")

func _on_pes_body_entered(body):
	body.dano()
