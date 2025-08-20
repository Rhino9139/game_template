class_name Game
extends Node

static var GAMER_TAG: String


func _ready() -> void:
	configure_settings()


func configure_settings() -> void:
	ConfigManager.check_for_config()
	ConfigManager.apply_settings()
