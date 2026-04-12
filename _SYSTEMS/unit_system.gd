class_name UnitSystem
extends System


static func SPAWN_UNIT(path: String, spawn_pos: Vector3) -> void:
	var new_unit: Unit = load(path).instantiate()
	new_unit.spawn_pos = spawn_pos
	MASTER_3D.add_child(new_unit)


func _init() -> void:
	UNIT = self
