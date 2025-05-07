extends Menu

@export_group("Navigation")
@export var audio_tab: Label
@export var video_tab: Label
@export var controls_tab: Label
@export_group("Categories")
@export var audio_settings: CenterContainer
@export var video_settings: CenterContainer
@export var control_settings: CenterContainer

func show_underline(tab: Label) -> void:
	tab.get_child(0).visible = true

func hide_underline(tab: Label) -> void:
	tab.get_child(0).visible = false

func _on_label_clicked(event: InputEvent, index: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			match index:
				0:
					show_underline(audio_tab)
					hide_underline(video_tab)
					hide_underline(controls_tab)
					audio_settings.visible = true
					video_settings.visible = false
					control_settings.visible = false
				1:
					hide_underline(audio_tab)
					show_underline(video_tab)
					hide_underline(controls_tab)
					audio_settings.visible = false
					video_settings.visible = true
					control_settings.visible = false
				2:
					hide_underline(audio_tab)
					hide_underline(video_tab)
					show_underline(controls_tab)
					audio_settings.visible = false
					video_settings.visible = false
					control_settings.visible = true

func _on_back_pressed() -> void:
	MasterGUI.GO_TO_MAIN()

func _on_default_pressed() -> void:
	ConfigManager.set_defaults()
	get_tree().call_group("Setting", "update")
