class_name Client
extends Node

const _LOCAL_HOST: String = "127.0.0.1"

static var HOST_IP: String
static var PEER: ENetMultiplayerPeer
static var PLAYER_TOKEN: String


func _ready() -> void:
	PEER = ENetMultiplayerPeer.new()


func start_client() -> void:
	PEER.create_client(_LOCAL_HOST, DedicatedServer.PORT)
	multiplayer.multiplayer_peer = PEER
	print("Connecting to host at: ", HOST_IP)
