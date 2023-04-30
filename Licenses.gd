extends VBoxContainer


@export var header_color := Color("#f79122")
@export var header_font_size := 24
@export var popup_width := 800
@export var popup_height := 800


func _ready() -> void:
	var licenses := Engine.get_license_info()
	for license in licenses:
		var button := Button.new()
		button.text = license
		add_child(button)
		
		var popup := PopupPanel.new()
		popup.size.x = popup_width
		popup.size.y = popup_height
		add_child(popup)
		button.pressed.connect(popup.popup_centered)
		
		var scroll := ScrollContainer.new()
		popup.add_child(scroll)
		
		var vbox := VBoxContainer.new()
		vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		scroll.add_child(vbox)
		
		var header := Label.new()
		header.text = license
		header.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		header.add_theme_color_override('font_color', header_color)
		header.add_theme_font_size_override('font_size', header_font_size)
		vbox.add_child(header)
		vbox.add_child(HSeparator.new())
		
		var label := Label.new()
		label.text = licenses[license]
		vbox.add_child(label)
