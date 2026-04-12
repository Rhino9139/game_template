extends MeshInstance3D


@export var mat: StandardMaterial3D

func _ready() -> void:
	set_surface_override_material(0, mat)
	var tween: Tween = create_tween()
	tween.tween_property(self, "scale", Vector3.ONE * 1.5, 0.08)
	tween.tween_property(self, "mat:albedo_color:a", 0, 0.08)
	await tween.finished
	queue_free()
