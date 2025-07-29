class_name State
extends Node

@warning_ignore("unused_signal")
signal state_changed(next_state: State)

var base: Character


func _init() -> void:
	process_mode = PROCESS_MODE_DISABLED


func enter() -> void:
	pass


func exit() -> void:
	pass


func process_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass
