extends CharacterBody2D

@export var speed = 100
@export var accel = 0
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("front_idle")


func _physics_process(delta):
	player_movement(delta)
	var moveDirection: Vector2 = Input.get_vector("left","right","up","down")
	
	
	velocity.x = move_toward(velocity.x, speed * moveDirection.x,accel)
	velocity.y = move_toward(velocity.y, speed * moveDirection.y,accel)
	
	move_and_slide()
	

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
	else:
		play_anim(0)
	
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
		
func player():
	pass
