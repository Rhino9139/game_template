class_name PlayerMaster
extends Node

static var SCENE: PackedScene = load("uid://ckm72g5pswfem")

var player_id: int
var gamer_tag: String

static func CREATE(new_id: int) -> PlayerMaster:
	var new_player: PlayerMaster = SCENE.instantiate()
	new_player.name = str(new_id)
	new_player.player_id = new_id
	return new_player
