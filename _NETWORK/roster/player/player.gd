class_name Player
extends Node

signal player_added(id: int)
signal player_removed(id: int)


var player_id: int
var gamer_tag: String = "New Player"


func _enter_tree() -> void:
	player_added.emit(player_id)


func _ready() -> void:
	if is_multiplayer_authority():
		gamer_tag = Game.GAMER_TAG


func _exit_tree() -> void:
	player_removed.emit(player_id)
