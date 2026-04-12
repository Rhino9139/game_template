class_name Player
extends Unit

@export_group("Camera")
@export var camera: Camera3D
@export var cam_h: Node3D
@export var cam_v: Node3D
@export var cam_raycast: RayCast3D
@export var projectile_marker: Marker3D

var turn_x_sens: float = 0.04
var turn_y_sens: float = 0.04
var power: float = 15.0
var cam_y_rot: float = 0.0
var cam_h_rot: float = 0.0
var jump_power: float = 25.0


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	cam_h.global_position = lerp(cam_h.global_position, global_position, 5.0 * delta)


func handle_gravity(delta: float) -> void:
	velocity += get_gravity() * delta


func calc_move_input(delta: float) -> void:
	var input_vec: Vector2 = Input.get_vector("move_right", "move_left", "move_backward", "move_forward")
	var input_strength: float = input_vec.length()
	var direction: Vector3 = (cam_h.global_transform.basis * \
		Vector3(input_vec.x, 0.0, input_vec.y)).normalized()
	if input_vec:
		velocity.x = move_toward(velocity.x, direction.x * power * input_strength, delta * 100.0)
		velocity.z = move_toward(velocity.z, direction.z * power * input_strength, delta * 100.0)
	else:
		velocity.x = move_toward(velocity.x, 0.0, delta * 100.0)
		velocity.z = move_toward(velocity.z, 0.0, delta * 100.0)


func handle_mouse_turn(event: InputEvent) -> void:
	var turn_vec: Vector2 = event.relative
	cam_y_rot = turn_vec.x * turn_x_sens
	cam_h_rot = turn_vec.y * turn_y_sens
	cam_h.rotation_degrees.y -= cam_y_rot
	cam_v.rotation_degrees.x -= cam_h_rot
	cam_v.rotation_degrees.x = clamp(cam_v.rotation_degrees.x, -85.0, 85.0)


func handle_controller_turn(delta: float) -> void:
	var turn_vec: Vector2 = Input.get_vector("look_left", "look_right", "look_down", "look_up")
	cam_y_rot -= turn_vec.x * turn_x_sens * delta
	cam_h_rot += turn_vec.y * turn_y_sens * delta
	cam_h_rot = clamp(cam_v.rotation_degrees.x, -85.0, 85.0)


func perform_jump() -> void:
	velocity.y = jump_power


func primary_fire() -> void:
	cam_raycast.force_raycast_update()
	var hit_pos: Vector3
	if cam_raycast.is_colliding():
		hit_pos = cam_raycast.get_collision_point()
	else:
		hit_pos = camera.global_position - camera.global_basis.z * 1000
	projectile_marker.look_at(hit_pos)
	SpawnableSystem.SPAWN_OBJECT(Library.DUMMY, hit_pos)
	SpawnableSystem.SPAWN_PROJECTILE(Library.SPHERE_PROJECTILE, projectile_marker.global_transform)
