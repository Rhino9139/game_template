class_name Menu
extends Control

enum Header{MAIN, SETTINGS}

const _PATHS: Dictionary[Menu.Header, String] = {
	Menu.Header.MAIN : "uid://csfbqq5q2k233",
	Menu.Header.SETTINGS : "uid://c3peiw5sl8h8y"
}

var current_menu: Menu


func add_menu(new_head_type: Header) -> Menu:
	var new_menu: Menu = load(_PATHS[new_head_type]).instantiate()
	return new_menu
