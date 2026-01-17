class_name Menu
extends Control

enum GameObject{MAIN, SETTINGS}

const _PATHS: Dictionary[GameObject, String] = {
	GameObject.MAIN : "uid://csfbqq5q2k233",
	GameObject.SETTINGS : "uid://c3peiw5sl8h8y",
}

var current_menu: Control


func _ready() -> void:
	Events.MENU_END.change_menu.connect(_change_menu)
	Events.MENU_END.clear_menu.connect(_clear_menu)


func _change_menu(new_menu: GameObject) -> void:
	_clear_menu()
	current_menu = load(_PATHS[new_menu]).instantiate()
	add_child(current_menu)


func _clear_menu() -> void:
	if current_menu:
		current_menu.queue_free()
