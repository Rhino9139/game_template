class_name PlayerStateMachine
extends Node

@export var base: Player3D

var states: Dictionary[StringName, PlayerState]
var current_state: PlayerState


func _ready() -> void:
	for child in get_children():
		if child is PlayerState:
			states[child.name] = child
			child.base = base
			child.state_changed.connect(_state_changed)
	set_starting_state()


func _unhandled_input(event: InputEvent) -> void:
	current_state.process_input(event)


func _process(delta: float) -> void:
	current_state.update(delta)


func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)


func set_starting_state() -> void:
	current_state = get_child(0)
	current_state.enter()


func _state_changed(new_state: PlayerState) -> void:
	current_state.exit()
	current_state = new_state
	new_state.enter()
