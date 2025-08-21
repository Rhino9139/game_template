extends VBoxContainer

@export var display_modes: OptionButton
@export var vsync_options: OptionButton
@export var fps_limit_options: OptionButton
@export var fps_visible_toggle: CheckButton


func _ready() -> void:
	update()


func update() -> void:
	var display_id: int = ConfigManager.get_config("Video", "DisplayMode")
	display_modes.select(display_modes.get_item_index(display_id))
	DisplayServer.window_set_mode(display_id)
	
	var vsync_id: int = ConfigManager.get_config("Video", "VsyncMode")
	vsync_options.select(vsync_options.get_item_index(vsync_id))
	DisplayServer.window_set_vsync_mode(vsync_id)
	
	fps_limit_options.select(get_fps_limit_index())
	fps_visible_toggle.button_pressed = ConfigManager.get_config("Video", "FPSVisible")


func get_fps_limit_index() -> int:
	var limit: String = str(ConfigManager.get_config("Video", "FPSLimit"))
	if limit == "0":
		limit = "Unlimited"
	for i in fps_limit_options.item_count:
		if limit == fps_limit_options.get_item_text(i):
			return i
	return 0


func _on_display_options_item_selected(index: int) -> void:
	var option_id: int = display_modes.get_item_id(index)
	DisplayServer.window_set_mode(option_id)
	ConfigManager.set_config("Video", "DisplayMode", option_id)


func _on_v_sync_options_item_selected(index: int) -> void:
	DisplayServer.window_set_vsync_mode(index)
	ConfigManager.set_config("Video", "VsyncMode", index)


func _on_fps_limit_options_item_selected(index: int) -> void:
	var limit: int = int(fps_limit_options.get_item_text(index))
	ConfigManager.set_config("Video", "FPSLimit", limit)
	Engine.max_fps = limit


func _on_fps_count_toggle_toggled(toggled_on: bool) -> void:
	#MasterGUI.FPS_LABEL.visible = toggled_on
	ConfigManager.set_config("Video", "FPSVisible", toggled_on)
