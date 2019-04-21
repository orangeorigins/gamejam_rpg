extends KinematicBody2D

const GRAVITY : float = 500.0
const WALK_SPEED : float = 200.0

var velocity : Vector2 = Vector2()


func _physics_process(delta):
	
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("left"):
		$FRESHMAIN_Template.set_flip_h(true)
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("right"):
		$FRESHMAIN_Template.set_flip_h(false)
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	#cancel upward momentum if hit ceiling
	if velocity.y < 0 && is_on_ceiling():
		velocity.y = 0
		
	#keep downward momentum 0 if on floor
	if velocity.y < 1 && !is_on_floor ():
		velocity.y += 5
	elif is_on_floor ():
		velocity.y = 0
	
	#jump
	if Input.is_action_pressed("up") && is_on_floor():
		velocity.y = -500

	move_and_slide(velocity, Vector2(0, -1))	
	pass