extends CharacterBody2D

@export var speed = 100 #speed of the player
@export var accel = 100 #affects the smoothness of the movement (lower values makes it like walking on ice)
var current_dir = "none" 

func _ready():
	$AnimatedSprite2D.play("frontIdle") #starts the player off with the idle anim

func _physics_process(_delta): #gets player's input and moves the character accordingly
	playerMovement()
	var moveDirection: Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down") 
	
	
	velocity.x = move_toward(velocity.x, speed * moveDirection.x,accel) #does math stuff to calculate positioning :D
	velocity.y = move_toward(velocity.y, speed * moveDirection.y,accel)
	
	move_and_slide() #closes the function as a movement function

func playerMovement(): #sets the variable "current_dir" to what is inputted by the player and starts the animation
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

func playAnim(movement): #chooses what animation to play based off "current_dir" (dir is short for current_dir im just using slang)
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

func player(): #passes the script :D
	pass
