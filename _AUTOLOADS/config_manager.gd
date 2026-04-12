extends Node

const _CONFIG_FILE_PATH: String = "res://config.cfg"

var CONFIG_FILE: ConfigFile = null

var default: Dictionary = {
	"Master" : 0.5,
	"Music" : 1.0,
	"Effects" : 1.0,
	"MasterMute" : false,
	"MusicMute" : false,
	"EffectsMute" : false,
	"DisplayMode" : 0,
	"VsyncMode" : 1,
	"FPSLimit" : 0,
	"FPSVisible" : false,
}


func check_for_config() -> void:
	CONFIG_FILE = ConfigFile.new()
	var err = CONFIG_FILE.load(_CONFIG_FILE_PATH)
	if err != OK:
		set_defaults()
		save_config_file()


func set_config(section: String, key: String, value: Variant) -> void:
	load_config_file()
	CONFIG_FILE.set_value(section, key, value)
	save_config_file()


func get_config(section: String, key: String) -> Variant:
	load_config_file()
	return CONFIG_FILE.get_value(section, key)


func save_config_file() -> void:
	if CONFIG_FILE == null:
		return
	CONFIG_FILE.save(_CONFIG_FILE_PATH)


func load_config_file() -> void:
	if CONFIG_FILE != null:
		return
	CONFIG_FILE = ConfigFile.new()
	CONFIG_FILE.load(_CONFIG_FILE_PATH)


func set_defaults() -> void:
	CONFIG_FILE.set_value("Audio", "Master", default["Master"])
	CONFIG_FILE.set_value("Audio", "Music", default["Music"])
	CONFIG_FILE.set_value("Audio", "Effects", default["Effects"])
	
	CONFIG_FILE.set_value("Audio", "MasterMute", default["MasterMute"])
	CONFIG_FILE.set_value("Audio", "MusicMute", default["MusicMute"])
	CONFIG_FILE.set_value("Audio", "EffectsMute", default["EffectsMute"])
	
	CONFIG_FILE.set_value("Video", "DisplayMode", default["DisplayMode"])
	CONFIG_FILE.set_value("Video", "VsyncMode", default["VsyncMode"])
	CONFIG_FILE.set_value("Video", "FPSLimit", default["FPSLimit"])
	CONFIG_FILE.set_value("Video", "FPSVisible", default["FPSVisible"])
	
	save_config_file()


func apply_settings() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), \
		(CONFIG_FILE.get_value("Audio", "Master") * 50) - 50.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), \
		(CONFIG_FILE.get_value("Audio", "Music") * 50) - 50.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), \
		(CONFIG_FILE.get_value("Audio", "Effects") * 50) - 50.0)
	
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), CONFIG_FILE.get_value("Audio", "MasterMute"))
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), CONFIG_FILE.get_value("Audio", "MusicMute"))
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Effects"), CONFIG_FILE.get_value("Audio", "EffectsMute"))
	
	DisplayServer.window_set_vsync_mode(CONFIG_FILE.get_value("Video", "VsyncMode"))
	DisplayServer.window_set_mode(CONFIG_FILE.get_value("Video", "DisplayMode"))
	Engine.max_fps = CONFIG_FILE.get_value("Video", "FPSLimit")
