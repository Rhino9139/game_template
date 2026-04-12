class_name HUDSystem
extends System


static func ADD_HUD(path: String) -> void:
	var new_hud: Control = load(path).instantiate()
	MASTER_GUI.add_child(new_hud)


func _init() -> void:
	HUD = self
