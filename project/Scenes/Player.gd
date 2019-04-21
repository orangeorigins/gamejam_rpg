extends KinematicBody2D

const GRAVITY : float = 400.0
const WALK_SPEED : float = 200.0

var velocity : Vector2 = Vector2()


func _physics_process(delta):
	
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("ui_left"):
		$FRESHMAIN_Template.set_flip_h(true)
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		$FRESHMAIN_Template.set_flip_h(false)
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -500
	
	
	if velocity.y < 1:
		velocity.y += 1
		
		
	move_and_slide(velocity, Vector2(0, -1))
	
	
	pass