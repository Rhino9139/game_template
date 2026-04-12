class_name PlayerState
extends Node

signal state_changed(next_state: StringName)

var base: Player3D


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


func _dummy() -> void:
	state_changed.emit()
