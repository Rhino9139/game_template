class_name Master3D
extends Node3D

static var MASTER: Master3D

var current_level: Level


func _init() -> void:
	MASTER = self


#func _ready() -> void:
	#EventBus.singleplayer_clicked.connect(_on_singleplayer_clicked)
	#EventBus.level_loaded.connect(_on_level_loaded)


func _on_singleplayer_clicked() -> void:
	if current_level:
		current_level.queue_free()
	
	current_level = Level.CREATE(0)
	add_child(current_level)


func _on_level_loaded() -> void:
	add_child(Character.CREATE())
