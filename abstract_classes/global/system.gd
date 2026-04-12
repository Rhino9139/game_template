class_name System
extends Node

static var MASTER_GUI: Control
static var MASTER_3D: Node3D

static var HUD: HUDSystem
static var MENU: MenuSystem
static var SPAWNABLE: SpawnableSystem
static var UNIT: UnitSystem
static var WORLD: WorldSystem


func _ready() -> void:
	MASTER_GUI = %GUI
	MASTER_3D = %"3D"
