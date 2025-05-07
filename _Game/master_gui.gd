class_name MasterGUI
extends Control

static var MASTER: MasterGUI

static var main_menu: Menu
static var settings_menu: Menu

static var FPS_LABEL: Label

static func GO_TO_MAIN() -> void:
	MASTER.clear_menus()
	MASTER.add_child(Menu.CREATE_MAIN_MENU())

static func GO_TO_SETTINGS() -> void:
	MASTER.clear_menus()
	MASTER.add_child(Menu.CREATE_SETTINGS_MENU())

func _init() -> void:
	MASTER = self

func _ready() -> void:
	FPS_LABEL = find_child("FPSLabel")

func clear_menus() -> void:
	for child in get_children():
		if child is Menu:
			child.queue_free()
