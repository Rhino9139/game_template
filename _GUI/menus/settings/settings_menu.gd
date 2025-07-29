extends Menu


func _on_back_pressed() -> void:
	EventBus.menu_changed.emit(Menu.HeadType.MAIN)


func _on_default_pressed() -> void:
	ConfigManager.set_defaults()
	get_tree().call_group("Setting", "update")
