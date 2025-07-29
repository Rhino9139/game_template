extends State


func process_input(_event: InputEvent) -> void:
	pass


func physics_update(delta: float) -> void:
	base.calc_move_input(delta)
	base.handle_turn_input(delta)
	base.move_and_slide()
