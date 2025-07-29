class_name Player
extends Node

const _PATH: String = "uid://ckm72g5pswfem"

var player_id: int
var gamer_tag: String


static func CREATE(new_id: int) -> Player:
	var new_player: Player = load(_PATH).instantiate()
	new_player.name = str(new_id)
	new_player.player_id = new_id
	return new_player
