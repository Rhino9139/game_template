extends Control


func _on_back_pressed() -> void:
	Menu.CONTROLLER.change_menu.emit(Menu.GameObject.MAIN)


func _on_default_pressed() -> void:
	ConfigManager.set_defaults()
	get_tree().call_group("Setting", "update")
