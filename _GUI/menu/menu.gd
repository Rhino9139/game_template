class_name Menu
extends Control

enum GameObject{MAIN, SETTINGS}

const _PATHS: Dictionary[GameObject, String] = {
	GameObject.MAIN : "uid://csfbqq5q2k233",
	GameObject.SETTINGS : "uid://c3peiw5sl8h8y",
}

static var CONTROLLER: Controller = Controller.new()

var current_menu: Control


func _ready() -> void:
	CONTROLLER.change_menu.connect(_change_menu)
	CONTROLLER.clear_menu.connect(_clear_menu)


func _change_menu(new_menu: GameObject) -> void:
	_clear_menu()
	current_menu = load(_PATHS[new_menu]).instantiate()
	add_child(current_menu)


func _clear_menu() -> void:
	if current_menu:
		current_menu.queue_free()


@warning_ignore_start("unused_signal")
class Controller:
	signal change_menu(new_menu: Menu.GameObject)
	signal clear_menu
