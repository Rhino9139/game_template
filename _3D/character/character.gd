class_name Character
extends CharacterBody3D

const _PATHS: Dictionary[int, String] = {
	0 : "uid://dyd2a5m0ql71m",
}

@export_group("Camera")
@export var camera: Camera3D
@export var cam_horizontal: Node3D
@export var cam_vertical: Node3D

var turn_x_sens: float = 75.0
var turn_y_sens: float = 75.0
var power: float = 15.0


static func CREATE() -> Character:
	var new_character: Character = load(_PATHS[0]).instantiate()
	return new_character


func calc_move_input(delta: float) -> void:
	var input_vec: Vector2 = Input.get_vector("move_right", "move_left", "move_backward", "move_forward")
	var input_strength: float = input_vec.length()
	var direction: Vector3 = (cam_horizontal.global_transform.basis * \
		Vector3(input_vec.x, 0.0, input_vec.y)).normalized()
	if input_vec:
		velocity.x = move_toward(velocity.x, direction.x * power * input_strength, delta * 100.0)
		velocity.z = move_toward(velocity.z, direction.z * power * input_strength, delta * 100.0)
	else:
		velocity.x = move_toward(velocity.x, 0.0, delta * 20.0)
		velocity.z = move_toward(velocity.z, 0.0, delta * 20.0)
	step_decimals(20.0)


func handle_turn_input(delta: float) -> void:
	var turn_vec: Vector2 = Input.get_vector("look_left", "look_right", "look_down", "look_up")
	cam_horizontal.rotation_degrees.y -= turn_vec.x * turn_x_sens * delta
	cam_vertical.rotation_degrees.x += turn_vec.y * turn_y_sens * delta
	cam_vertical.rotation_degrees.x = clamp(cam_vertical.rotation_degrees.x, -85.0, 30.0)
