class_name Sector
extends Node3D


var spawn_pos: Vector3 = Vector3.ZERO


func _enter_tree() -> void:
	global_position = spawn_pos
