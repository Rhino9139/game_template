extends Control


func _on_singleplayer_pressed() -> void:
	pass


func _on_multiplayer_pressed() -> void:
	pass


func _on_settings_pressed() -> void:
	Menu.CONTROLLER.change_menu.emit(Menu.GameObject.SETTINGS)


func _on_quit_pressed() -> void:
	pass
