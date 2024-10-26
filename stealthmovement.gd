extends CharacterBody3D

# Declare member variables here
var speed = 200
var isStealth = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_input()

func handle_input():
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"): direction.x += 1
	if Input.is_action_pressed("move_left"): direction.x -= 1
	if Input.is_action_pressed("move_back"): direction.z += 1
	if Input.is_action_pressed("move_forward"): direction.z -= 1


	direction = direction.normalized()

	if direction != Vector3.ZERO:
		move_and_slide()

	if Input.is_action_just_pressed("toggle_stealth"):
		isStealth = !isStealth
		if isStealth:
			print("Stealth mode activated")
		else:
			print("Stealth mode deactivated")
