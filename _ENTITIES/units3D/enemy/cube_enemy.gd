extends Unit


@export var mesh: MeshInstance3D
@export var hit_effect_scene: PackedScene

var base_speed: float = 10.0
var target_player: Player


func _enter_tree() -> void:
	pass


func _physics_process(_delta: float) -> void:
	if target_player:
		look_at(target_player.global_position)
		velocity = -global_basis.z * base_speed
	
	move_and_slide()


func take_hit() -> void:
	print("hit")
	var new_effect: MeshInstance3D = hit_effect_scene.instantiate()
	mesh.add_child(new_effect)


func _on_aggro_area_body_entered(body: Node3D) -> void:
	if body is Player:
		target_player = body
