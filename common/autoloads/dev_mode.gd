extends Node

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed():
			if event.keycode == KEY_ESCAPE:
				get_tree().quit()
			if event.keycode == KEY_H:
				if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
					Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				else:
					Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
