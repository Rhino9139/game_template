extends State

func physics_update(delta: float) -> void:
	base.calc_move_input(delta)
	base.apply_gravity(delta)
	base.move_and_slide()

func _input(event: InputEvent) -> void:
	base.mouse_camera_input(event)
	if Input.is_action_just_pressed("jump"):
		base.perform_jump()
