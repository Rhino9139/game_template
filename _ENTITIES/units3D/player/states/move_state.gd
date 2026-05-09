extends PlayerState


func process_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		base.handle_mouse_turn(event)
	elif event.is_action_pressed("primary_action"):
		base.primary_fire()
	elif event.is_action_pressed("jump"):
		state_changed.emit(%JumpState)


func physics_update(delta: float) -> void:
	base.handle_gravity(delta)
	base.calc_move_input(delta)
	base.handle_controller_turn(delta)
	base.move_and_slide()
