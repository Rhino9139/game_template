class_name PlayerStateMachine
extends Node

@export var base: Character

var states: Dictionary
var current_state: State


func _ready() -> void:
	for child in get_children():
		states[child.name] = child
		child.base = base
		child.state_changed.connect(_on_state_changed)
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


func _on_state_changed(new_state: String) -> void:
	current_state.exit()
	states[new_state].enter()
	current_state = states[new_state]
