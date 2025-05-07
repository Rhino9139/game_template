class_name Game
extends Node

static var MASTER: Game

func _init() -> void:
	MASTER = self

func _ready() -> void:
	
	initialize_game()
	
	

func initialize_game() -> void:
	ConfigManager.check_for_config()
	ConfigManager.apply_settings()
	get_viewport().size = ConfigManager.get_config("Video", "DisplayRes")
	
	MasterGUI.GO_TO_MAIN()
