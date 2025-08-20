class_name Server
extends Node

const _PORT: int = 10919
const _HOST_IP: String = "127.0.0.1"

static var MAX_PLAYERS: int = 4

var peer: ENetMultiplayerPeer


func start_server():
	peer = ENetMultiplayerPeer.new()
	peer.create_server(_PORT, MAX_PLAYERS)
	
	multiplayer.multiplayer_peer = peer
	
	print("Hosting on port: ", _PORT)


func stop_server() -> void:
	peer.close()
	peer = null
	multiplayer.multiplayer_peer = null
