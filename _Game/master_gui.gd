class_name MasterGUI
extends Control

static var MASTER: MasterGUI

var current_menu: Menu


func _init() -> void:
	MASTER = self


#func _ready() -> void:
	#EventBus.program_started.connect(_on_program_started)
	#EventBus.menu_changed.connect(_on_menu_changed)
	#EventBus.singleplayer_clicked.connect(_on_singleplayer_clicked)


#func _on_program_started() -> void:
	#current_menu = Menu.CREATE(Menu.HeadType.MAIN)
	#add_child(current_menu)
#
#
#func _on_menu_changed(new_head_type: Menu.HeadType) -> void:
	#if current_menu:
		#current_menu.queue_free()
	#
	#current_menu = Menu.CREATE(new_head_type)
	#add_child(current_menu)
#
#
#func _on_singleplayer_clicked() -> void:
	#if current_menu:
		#current_menu.queue_free()
