extends Node

var peer: ENetMultiplayerPeer


func _ready() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(NetworkAgent._HOST_IP, NetworkAgent._PORT)
	multiplayer.multiplayer_peer = peer


func _exit_tree() -> void:
	peer.close()
	peer = null
	multiplayer.multiplayer_peer = null
