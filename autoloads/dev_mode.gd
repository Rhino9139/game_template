extends Node


func _ready() -> void:
	if OS.get_cmdline_args().size() > 2:
		Game.GAMER_TAG = OS.get_cmdline_args()[2]


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed():
			if event.keycode == KEY_ESCAPE:
				print("DEV ESCAPE")
				get_tree().quit()
