class_name MenuSystem
extends System

var current_menu: Control


func _init() -> void:
	MENU = self


func change_menu(path: String) -> void:
	if current_menu:
		current_menu.queue_free()
	current_menu = load(path).instantiate()
	MASTER_GUI.add_child(current_menu)


func clear_menu() -> void:
	if current_menu:
		current_menu.queue_free()
