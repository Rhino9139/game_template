extends Node


var peer: ENetMultiplayerPeer


func _ready() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(NetworkAgent._PORT, NetworkAgent.MAX_PLAYERS)
	multiplayer.multiplayer_peer = peer
	
	print("Hosting on port: ", NetworkAgent._PORT)


func _exit_tree() -> void:
	peer.close()
	peer = null
	multiplayer.multiplayer_peer = null
