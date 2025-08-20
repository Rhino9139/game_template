class_name NetworkAgent
extends Node

enum GameObject{SERVER, CLIENT}

const _PORT: int = 10919
const _HOST_IP: String = "127.0.0.1"
const _PATHS: Dictionary[GameObject, String] = {
	GameObject.SERVER : "uid://ctvmluvivjfbm",
	GameObject.CLIENT : "uid://dcsk8rsa4gqdi",
}

static var MAX_PLAYERS: int = 4


var current_agent: Node


func start_server() -> void:
	_clear_agent()
	current_agent = load(_PATHS[GameObject.SERVER]).instantiate()
	add_child(current_agent)


func stop_server() -> void:
	_clear_agent()


func start_client() -> void:
	_clear_agent()
	current_agent = load(_PATHS[GameObject.CLIENT]).instantiate()
	add_child(current_agent)


func stop_client() -> void:
	_clear_agent()


func _clear_agent() -> void:
	if current_agent:
		current_agent.queue_free()
