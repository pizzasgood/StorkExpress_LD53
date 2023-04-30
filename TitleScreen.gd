extends Node


@onready var start_button : Button = find_child("StartButton")
@onready var exit_button : Button = find_child("ExitButton")

@onready var about_window : PopupPanel = find_child("AboutWindow")
@onready var options_window : PopupPanel = find_child("OptionsWindow")


func _on_StartButton_pressed() -> void:
	seed(1)
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_OptionsButton_pressed() -> void:
	options_window.popup_centered()


func _on_AboutButton_pressed() -> void:
	about_window.popup_centered()


func _on_ExitButton_pressed() -> void:
	get_tree().quit()


func _ready() -> void:
	start_button.grab_focus()

	if OS.get_name() == "HTML5":
		exit_button.queue_free()

