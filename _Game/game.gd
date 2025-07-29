class_name Game
extends Node

static var MASTER: Game


func _init() -> void:
	MASTER = self


func _ready() -> void:
	configure_settings()
	EventBus.program_started.emit()


func configure_settings() -> void:
	ConfigManager.check_for_config()
	ConfigManager.apply_settings()
