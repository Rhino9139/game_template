class_name Level
extends Node3D

const _PATHS: Dictionary[int, String] = {
	0 : "uid://cadk6ard0gt6q",
}

static func CREATE(index: int) -> Level:
	var new_level: Level = load(_PATHS[index]).instantiate()
	return new_level

func _ready() -> void:
	EventBus.level_loaded.emit()
