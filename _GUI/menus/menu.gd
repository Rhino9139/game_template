class_name Menu
extends Control

enum HeadType {MAIN, SETTINGS}

const _PATHS: Dictionary[Menu.HeadType, String] = {
	Menu.HeadType.MAIN : "uid://csfbqq5q2k233",
	Menu.HeadType.SETTINGS : "uid://c3peiw5sl8h8y"
}

static func CREATE(new_head_type: HeadType) -> Menu:
	var new_menu: Menu = load(_PATHS[new_head_type]).instantiate()
	return new_menu
