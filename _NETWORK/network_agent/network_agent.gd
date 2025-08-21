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
	multiplayer.peer_connected.connect(_peer_connected)
	multiplayer.peer_disconnected.connect(_peer_disconnected)


func stop_server() -> void:
	_clear_agent()
	multiplayer.peer_connected.disconnect(_peer_connected)
	multiplayer.peer_disconnected.disconnect(_peer_disconnected)


func start_client() -> void:
	_clear_agent()
	current_agent = load(_PATHS[GameObject.CLIENT]).instantiate()
	add_child(current_agent)
	multiplayer.connected_to_server.connect(_connected_to_server)
	multiplayer.server_disconnected.connect(_server_disconnected)
	multiplayer.connection_failed.connect(_connection_failed)


func stop_client() -> void:
	_clear_agent()
	multiplayer.connected_to_server.disconnect(_connected_to_server)
	multiplayer.server_disconnected.disconnect(_server_disconnected)
	multiplayer.connection_failed.disconnect(_connection_failed)


func _clear_agent() -> void:
	if current_agent:
		current_agent.queue_free()


func _peer_connected(id: int) -> void:
	print("Player ", id, " connected!")


func _peer_disconnected(id: int) -> void:
	print("Player ", id, " disconnected!")


func _connected_to_server() -> void:
	print("Connected to Server at ", NetworkAgent._HOST_IP)


func _server_disconnected() -> void:
	print("Disconnected from Server")


func _connection_failed() -> void:
	print("Could not connect to Server")
