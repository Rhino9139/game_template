class_name Menu
extends Control

enum GameObject{MAIN, SETTINGS}

const _PATHS: Dictionary[GameObject, String] = {
	GameObject.MAIN : "uid://csfbqq5q2k233",
	GameObject.SETTINGS : "uid://c3peiw5sl8h8y",
}

var current_menu: Control


func add_menu(new_head_type: GameObject) -> Menu:
	_clear_menu()
	
	var new_menu: Control = load(_PATHS[new_head_type]).instantiate()
	return new_menu


func _clear_menu() -> void:
	if current_menu:
		current_menu.queue_free()
