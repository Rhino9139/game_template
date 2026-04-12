extends ShapeCast3D

var speed: float = 75.0


func _physics_process(delta: float) -> void:
	global_position -= global_basis.z * delta * speed
	if is_colliding():
		var collider = get_collider(0)
		print(get_collision_count())
		if collider.has_method("take_hit"):
			collider.take_hit()
		queue_free()


func _on_life_timer_timeout() -> void:
	queue_free()
