@abstract
class_name Unit
extends CharacterBody3D

var spawn_pos: Vector3


func _enter_tree() -> void:
	global_position = spawn_pos
