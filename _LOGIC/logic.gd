class_name Logic
extends Node

static var M: Logic


static func CLOSE_GAME() -> void:
	M.get_tree().quit()


static func OPEN_GAME() -> void:
	#System.MENU.change_menu(Library.MAIN_MENU)
	WorldSystem.ADD_SECTOR(Library.SECTOR_1)
	UnitSystem.SPAWN_UNIT(Library.CHARACTER, Vector3(0, 1, 0))
	HUDSystem.ADD_HUD(Library.MAIN_HUD)
	System.MENU.clear_menu()


static func SINGLEPLAYER_PRESSED() -> void:
	WorldSystem.ADD_SECTOR(Library.SECTOR_1)
	UnitSystem.SPAWN_UNIT(Library.CHARACTER, Vector3(0, 1, 0))
	HUDSystem.ADD_HUD(Library.MAIN_HUD)
	System.MENU.clear_menu()


func _init() -> void:
	M = self
