class_name ClientMaster
extends Node

const _LOCAL_HOST: String = "127.0.0.1"

static var HOST_IP: String
static var HOST_PORT: int = 10919
static var PEER: ENetMultiplayerPeer
static var PLAYER_TOKEN: String

func _ready() -> void:
	PEER = ENetMultiplayerPeer.new()

func start_client() -> void:
	#PEER.create_client(HOST_IP, HOST_PORT)
	PEER.create_client(_LOCAL_HOST, HOST_PORT)
	multiplayer.multiplayer_peer = PEER
	print("Connecting to host at: ", HOST_IP)

static func ANON_LOGIN() -> void:
	var res = await HathoraSDK.auth_v1.login_anonymous().async()
	if res.is_error():
		print("Login error!", res)
		return
	PLAYER_TOKEN = res.get_data().token
