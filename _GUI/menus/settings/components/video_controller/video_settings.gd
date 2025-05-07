extends VBoxContainer

@export var display_modes: OptionButton
@export var res_options: OptionButton
@export var vsync_options: OptionButton
@export var fps_limit_options: OptionButton
@export var fps_count_toggle: CheckButton

func _ready() -> void:
	update()

func update() -> void:
	display_modes.selected = get_display_mode_index(ConfigManager.get_config("Video", "DisplayMode"))
	_on_display_options_item_selected(display_modes.selected)
	get_viewport().size = ConfigManager.get_config("Video", "DisplayRes")
	res_options.selected = get_res_index(get_viewport().size)
	vsync_options.selected = get_vsync_mode_index(ConfigManager.get_config("Video", "VsyncMode"))
	fps_limit_options.select(get_fps_limit_index())
	Engine.max_fps = ConfigManager.get_config("Video", "FPSLimit")
	fps_count_toggle.button_pressed = ConfigManager.get_config("Video", "FPSCount")

func get_display_mode_index(mode: String) -> int:
	match mode:
		"Windowed":
			return 0
		"Maximized":
			return 1
		"Fullscreen":
			return 2
		"Exclusive Fullscreen":
			return 3
	return 0

func get_res_vector(index: int) -> Vector2:
	match index:
		0:
			return Vector2(854, 480)
		1:
			return Vector2(1152, 648)
		2:
			return Vector2(1280, 720)
		3:
			return Vector2(1920, 1080)
	return Vector2(1152, 648)

func get_res_index(res: Vector2) -> int:
	match res:
		Vector2(854, 480):
			return 0
		Vector2(1152, 648):
			return 1
		Vector2(1280, 720):
			return 2
		Vector2(1920, 1080):
			return 3
	return 0

func get_vsync_mode_index(mode: String) -> int:
	match mode:
		"Disabled":
			return 0
		"Enabled":
			return 1
		"Adaptive":
			return 2
		"Mailbox":
			return 3
	return 0

func get_fps_limit_index() -> int:
	var limit: String = str(ConfigManager.get_config("Video", "FPSLimit"))
	if limit == "0":
		limit = "Unlimited"
	for i in fps_limit_options.item_count:
		if limit == fps_limit_options.get_item_text(i):
			return i
	return 0

func _on_display_options_item_selected(index: int) -> void:
	var option: String = display_modes.get_item_text(index)
	ConfigManager.set_display_mode(option)
	ConfigManager.set_config("Video", "DisplayMode", option)

func _on_resolution_options_item_selected(index: int) -> void:
	var new_res: Vector2 = get_res_vector(index)
	get_viewport().size = new_res
	ConfigManager.set_config("Video", "DisplayRes", new_res)

func _on_v_sync_options_item_selected(index: int) -> void:
	var option: String = vsync_options.get_item_text(index)
	ConfigManager.set_vsync_mode(option)
	ConfigManager.set_config("Video", "VsyncMode", option)

func _on_fps_limit_options_item_selected(index: int) -> void:
	var limit: int = int(fps_limit_options.get_item_text(index))
	ConfigManager.set_config("Video", "FPSLimit", limit)
	Engine.max_fps = limit

func _on_fps_count_toggle_toggled(toggled_on: bool) -> void:
	MasterGUI.FPS_LABEL.visible = toggled_on
	ConfigManager.set_config("Video", "FPSCount", toggled_on)
