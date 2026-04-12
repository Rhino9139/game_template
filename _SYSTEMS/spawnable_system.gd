class_name SpawnableSystem
extends System


static func SPAWN_OBJECT(path: String, pos: Vector3) -> void:
	var new_obj: Node3D = load(path).instantiate()
	MASTER_3D.add_child(new_obj)
	new_obj.global_position = pos


static func SPAWN_PROJECTILE(path: String, trans: Transform3D) -> void:
	var new_obj: Node3D = load(path).instantiate()
	MASTER_3D.add_child(new_obj)
	new_obj.global_transform = trans


func _init() -> void:
	SPAWNABLE = self
