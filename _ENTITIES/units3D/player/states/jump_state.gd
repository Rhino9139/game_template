extends PlayerState

var locked: bool = false

func enter() -> void:
	locked = true
	base.perform_jump()
	await get_tree().create_timer(0.10).timeout
	locked = false


func process_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		base.handle_mouse_turn(event)
	elif event.is_action_pressed("primary_action"):
		base.primary_fire()


func physics_update(delta: float) -> void:
	base.handle_gravity(delta)
	base.calc_move_input(delta)
	base.handle_controller_turn(delta)
	base.move_and_slide()
	if base.is_on_floor() and !locked:
		state_changed.emit(%MoveState)
