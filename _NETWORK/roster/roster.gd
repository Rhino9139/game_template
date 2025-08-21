class_name Roster
extends Node

enum GameObject{PLAYER}

const _PATHS: Dictionary[GameObject, String] = {
	GameObject.PLAYER : "uid://ckm72g5pswfem",
}

static var PUB: Publisher = Publisher.new()

@export var player_spawner: MultiplayerSpawner
@export var player_list: Node


func _ready() -> void:
	player_spawner.spawn_function = __spawn_player


func add_player(new_id: int) -> void:
	player_spawner.spawn(new_id)


func remove_player(id: int) -> void:
	for player in player_list.get_children():
		if player.player_id == id:
			player.queue_free()


func _player_added(id: int) -> void:
	PUB.num_players += 1
	PUB.player_added.emit(id)


func _player_removed(id: int) -> void:
	PUB.num_players -= 1
	PUB.player_removed.emit(id)


func __spawn_player(id: int) -> Node:
	var new_player: Player = load(_PATHS[GameObject.PLAYER]).instantiate()
	new_player.player_id = id
	new_player.set_multiplayer_authority(id)
	new_player.player_added.connect(_player_added)
	new_player.player_removed.connect(_player_removed)
	return new_player


class Publisher:
	signal player_added(id: int)
	signal player_removed(id: int)
	
	var num_players: int = 0
