class_name MultiplayerManager
extends Node

static var MASTER: MultiplayerManager
static var SERVER: DedicatedServer
static var CLIENT: Client
static var PLAYER_LIST: Node
static var GAMER_TAG: String


func _init() -> void:
	MASTER = self


func _ready() -> void:
	PLAYER_LIST = find_child("PlayerList")


static func START_SERVER() -> void:
	SERVER = DedicatedServer.new()
	MASTER.add_child(SERVER)
	SERVER.name = "Server"


static func START_CLIENT() -> void:
	CLIENT = Client.new()
	MASTER.add_child(CLIENT)
	CLIENT.name = "Client"


static func ADD_PLAYER(new_id: int) -> void:
	PLAYER_LIST.add_child(Player.CREATE(new_id))
