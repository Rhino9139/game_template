extends Node
@warning_ignore_start("unused_signal")

var MENU_START: MenuStart = MenuStart.new()
var MENU_END: MenuEnd = MenuEnd.new()


class MenuStart:
	pass


class MenuEnd:
	signal change_menu(new_menu: Menu.GameObject)
	signal clear_menu
