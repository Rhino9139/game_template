class_name Game
extends Node

static var GAMER_TAG: String

@export var logic_bridge: LogicBridge


func _ready() -> void:
	configure_settings()
	Menu.CONTROLLER.change_menu.emit(Menu.GameObject.MAIN)


func configure_settings() -> void:
	ConfigManager.check_for_config()
	ConfigManager.apply_settings()
