extends Menu

func _on_singleplayer_pressed() -> void:
	pass

func _on_multiplayer_pressed() -> void:
	pass

func _on_settings_pressed() -> void:
	MasterGUI.GO_TO_SETTINGS()

func _on_quit_pressed() -> void:
	get_tree().quit()
