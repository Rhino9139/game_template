extends Menu

func _on_singleplayer_pressed() -> void:
	EventBus.singleplayer_clicked.emit()

func _on_multiplayer_pressed() -> void:
	pass

func _on_settings_pressed() -> void:
	EventBus.menu_changed.emit(Menu.HeadType.SETTINGS)

func _on_quit_pressed() -> void:
	get_tree().quit()
