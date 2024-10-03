extends CharacterBody2D


const speed = 300.0
const jump_power = -350.0

var gravity = 900


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	  
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()