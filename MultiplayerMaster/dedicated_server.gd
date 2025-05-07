class_name DedicatedServer
extends Node

static var PORT: int = 10919
static var MAX_PLAYERS: int = 4

var peer: MultiplayerPeer

func _ready() -> void:
	peer = ENetMultiplayerPeer.new()
	start_host()

func start_host():
	peer.create_server(PORT, MAX_PLAYERS)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	print("Hosting on port: ", PORT)

func _on_peer_connected(id: int):
	print("Player ", id, " connected!")
	MultiplayerManager.ADD_PLAYER_MASTER(id)

func _on_peer_disconnected(id: int) -> void:
	print("Player ", id, " disconnected!")
