extends PopupPanel


@onready var master_volume: Slider = find_child("MasterVolume")
@onready var sfx_volume: Slider = find_child("SFXVolume")
@onready var music_volume: Slider = find_child("MusicVolume")
@onready var vsync: CheckBox = find_child("VSync")
@onready var max_fps: SpinBox = find_child("MaxFPS")
@onready var mouse_x: Slider = find_child("MouseX")
@onready var mouse_y: Slider = find_child("MouseY")
@onready var screen_darken: ColorRect = get_tree().current_scene.find_child("ScreenDarken")


func update_widgets() -> void:
	master_volume.value = Globals.master_volume
	sfx_volume.value = Globals.sfx_volume
	music_volume.value = Globals.music_volume
	vsync.button_pressed = DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED
	max_fps.value = Engine.max_fps
	mouse_x.value = Globals.mouse_x_sensitivity
	mouse_y.value = Globals.mouse_y_sensitivity


func _on_OptionsWindow_about_to_show() -> void:
	screen_darken.visible = true
	update_widgets()


func _on_OptionsWindow_popup_hide() -> void:
	screen_darken.visible = false


func _on_MasterVolume_value_changed(value) -> void:
	Globals.master_volume = value


func _on_SFXVolume_value_changed(value) -> void:
	Globals.sfx_volume = value


func _on_MusicVolume_value_changed(value) -> void:
	Globals.music_volume = value


func _on_VSync_toggled(button_pressed) -> void:
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if button_pressed else DisplayServer.VSYNC_DISABLED)


func _on_MaxFPS_value_changed(value) -> void:
	Engine.max_fps = value


func _on_MouseX_value_changed(value) -> void:
	Globals.mouse_x_sensitivity = value


func _on_MouseY_value_changed(value) -> void:
	Globals.mouse_y_sensitivity = value


func _on_ResumeButton_pressed() -> void:
	visible = false


func _ready() -> void:
	visible = false
