extends HBoxContainer

@export_enum("Master", "Music", "Effects") var volume_bus: String
@export var volume_label: Label
@export var volume_number: LineEdit
@export var volume_slider: HSlider
@export var mute_button: Button

var bus_index: int
var mute_type: String

func _ready() -> void:
	volume_label.text = volume_bus
	mute_type = volume_bus + "Mute"
	update()

func update() -> void:
	bus_index = AudioServer.get_bus_index(volume_bus)
	var start: float = ConfigManager.get_config("Audio", volume_bus)
	start *= 100.0
	volume_slider.value = start
	_on_slider_value_changed(start)
	mute_button.button_pressed = ConfigManager.get_config("Audio", mute_type)

func _on_slider_value_changed(value: float) -> void:
	var new_vol: float = (value / 2.0) - 50.0
	new_vol = clamp(new_vol, -50.0, 0.0)
	AudioServer.set_bus_volume_db(bus_index, new_vol)
	volume_number.text = str(int(value))
	ConfigManager.set_config("Audio", volume_bus, value / 100.0)

func _on_mute_button_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(bus_index, toggled_on)
	ConfigManager.set_config("Audio", mute_type, toggled_on)
