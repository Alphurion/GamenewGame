extends CharacterBody2D

@export var speed = 100
@export var accel = 100
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("frontIdle")


func _physics_process(delta):
	playerMovement(delta)
	var moveDirection: Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	
	velocity.x = move_toward(velocity.x, speed * moveDirection.x,accel)
	velocity.y = move_toward(velocity.y, speed * moveDirection.y,accel)
	
	move_and_slide()
	

func playerMovement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		playAnim(1)
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		playAnim(1)
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		playAnim(1)
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		playAnim(1)
	else:
		playAnim(0)
	
	
func playAnim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("sideWalk")
		elif movement == 0:
			anim.play("sideIdle")
	
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("sideWalk")
		elif movement == 0:
			anim.play("sideIdle")
	
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("frontWalk")
		elif movement == 0:
			anim.play("frontIdle")
	
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("backWalk")
		elif movement == 0:
			anim.play("backIdle")
		
func player():
	pass
