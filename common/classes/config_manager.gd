class_name ConfigManager
extends Object

const _CONFIG_FILE_PATH: String = "res://config.cfg"

static var CONFIG_FILE: ConfigFile = null

static var default: Dictionary = {
	"Master" : 0.5,
	"Music" : 1.0,
	"Effects" : 1.0,
	"MasterMute" : false,
	"MusicMute" : false,
	"EffectsMute" : false,
	"DisplayMode" : "Windowed",
	"DisplayRes" : Vector2(1152, 648),
	"VsyncMode" : "Enabled",
	"FPSLimit" : 0,
	"FPSCount" : false
}

static func set_config(section: String, key: String, value: Variant) -> void:
	load_config_file()
	CONFIG_FILE.set_value(section, key, value)
	save_config_file()

static func get_config(section: String, key: String) -> Variant:
	load_config_file()
	return CONFIG_FILE.get_value(section, key)

static func load_config_file() -> void:
	if CONFIG_FILE != null:
		return
	CONFIG_FILE = ConfigFile.new()
	CONFIG_FILE.load(_CONFIG_FILE_PATH)

static func save_config_file() -> void:
	if CONFIG_FILE == null:
		return
	CONFIG_FILE.save(_CONFIG_FILE_PATH)

static func check_for_config() -> void:
	CONFIG_FILE = ConfigFile.new()
	var err = CONFIG_FILE.load(_CONFIG_FILE_PATH)
	if err != OK:
		set_defaults()
		save_config_file()

static func set_defaults() -> void:
	CONFIG_FILE.set_value("Audio", "Master", default["Master"])
	CONFIG_FILE.set_value("Audio", "Music", default["Music"])
	CONFIG_FILE.set_value("Audio", "Effects", default["Effects"])
	CONFIG_FILE.set_value("Audio", "MasterMute", default["MasterMute"])
	CONFIG_FILE.set_value("Audio", "MusicMute", default["MusicMute"])
	CONFIG_FILE.set_value("Audio", "EffectsMute", default["EffectsMute"])
	CONFIG_FILE.set_value("Video", "DisplayMode", default["DisplayMode"])
	CONFIG_FILE.set_value("Video", "DisplayRes", default["DisplayRes"])
	CONFIG_FILE.set_value("Video", "VsyncMode", default["VsyncMode"])
	CONFIG_FILE.set_value("Video", "FPSLimit", default["FPSLimit"])
	CONFIG_FILE.set_value("Video", "FPSCount", default["FPSCount"])
	save_config_file()

static func apply_settings() -> void:
	#Audio Settings
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), \
		(CONFIG_FILE.get_value("Audio", "Master") * 50) - 50.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), \
		(CONFIG_FILE.get_value("Audio", "Music") * 50) - 50.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), \
		(CONFIG_FILE.get_value("Audio", "Effects") * 50) - 50.0)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), CONFIG_FILE.get_value("Audio", "MasterMute"))
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), CONFIG_FILE.get_value("Audio", "MusicMute"))
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Effects"), CONFIG_FILE.get_value("Audio", "EffectsMute"))
	set_display_mode(CONFIG_FILE.get_value("Video", "DisplayMode"))
	set_vsync_mode(CONFIG_FILE.get_value("Video", "VsyncMode"))
	Engine.max_fps = CONFIG_FILE.get_value("Video", "FPSLimit")
	MasterGUI.FPS_LABEL.visible = CONFIG_FILE.get_value("Video", "FPSCount")

static func set_display_mode(mode: String) -> void:
	match mode:
		"Windowed":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		"Maximized":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		"Fullscreen":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		"Exclusive Fullscreen":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

static func set_vsync_mode(mode: String) -> void:
	match mode:
		"Disabled":
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		"Enabled":
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		"Adaptive":
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ADAPTIVE)
		"Mailbox":
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_MAILBOX)
