extends Node

@export var roster: Roster
@export var network_agent: NetworkAgent


#func _ready() -> void:
	#if DisplayServer.get_name() == "headless":
		#create_server()
	#else:
		#create_client()


func create_server() -> void:
	network_agent.start_server()
	multiplayer.peer_connected.connect(_peer_connected)
	multiplayer.peer_disconnected.connect(_peer_disconnected)


func destroy_server() -> void:
	network_agent.stop_server()
	multiplayer.peer_connected.disconnect(_peer_connected)
	multiplayer.peer_disconnected.disconnect(_peer_disconnected)


func create_client() -> void:
	network_agent.start_client()
	multiplayer.connected_to_server.connect(_connected_to_server)
	multiplayer.server_disconnected.connect(_server_disconnected)
	multiplayer.connection_failed.connect(_connection_failed)


func destroy_client() -> void:
	network_agent.stop_client()
	multiplayer.connected_to_server.disconnect(_connected_to_server)
	multiplayer.server_disconnected.disconnect(_server_disconnected)
	multiplayer.connection_failed.disconnect(_connection_failed)


func _peer_connected(id: int) -> void:
	roster.create_player(id)
	print("Player ", id, " connected!")


func _peer_disconnected(id: int) -> void:
	roster.remove_player(id)
	print("Player ", id, " disconnected!")


func _connected_to_server() -> void:
	print("Connected to Server at ", NetworkAgent._HOST_IP)


func _server_disconnected() -> void:
	print("Disconnected from Server")


func _connection_failed() -> void:
	print("Could not connect to Server")
