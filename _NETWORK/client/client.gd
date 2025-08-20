class_name Client
extends Node

var peer: ENetMultiplayerPeer


func start_client() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(Server._HOST_IP, Server._PORT)
	multiplayer.multiplayer_peer = peer


func stop_client() -> void:
	peer.close()
	peer = null
	multiplayer.multiplayer_peer = null
