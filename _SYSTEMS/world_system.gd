class_name WorldSystem
extends System


static func ADD_SECTOR(path: String) -> void:
	var new_sector: Sector = load(path).instantiate()
	MASTER_3D.add_child(new_sector)


func _init() -> void:
	WORLD = self
