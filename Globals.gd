extends Node


var master_volume: float: set = set_master_volume
var sfx_volume: float: set = set_sfx_volume
var music_volume: float: set = set_music_volume
var mouse_x_sensitivity: float
var mouse_y_sensitivity: float


func _ready() -> void:
	seed(1)
	restore_defaults()


func restore_defaults() -> void:
	self.master_volume = 1.0
	self.sfx_volume = 1.0
	self.music_volume = 1.0
	self.mouse_x_sensitivity = 0.05
	self.mouse_y_sensitivity = 0.05


func set_volume_by_bus(bus_name: String, volume_percent: float) -> void:
	var idx := AudioServer.get_bus_index(bus_name)
	var db: float = -60.0 * (1.0 - volume_percent)
	AudioServer.set_bus_volume_db(idx, db)
	AudioServer.set_bus_mute(idx, false if volume_percent > 0 else true)


func set_master_volume(value: float) -> void:
	master_volume = value
	set_volume_by_bus("Master", value)


func set_sfx_volume(value: float) -> void:
	sfx_volume = value
	set_volume_by_bus("SFX", value)


func set_music_volume(value: float) -> void:
	music_volume = value
	set_volume_by_bus("Music", value)
