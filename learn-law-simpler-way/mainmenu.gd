extends Control

# Node paths
@onready var button = $ConstitutionButton  # Ensure this path is correct
@onready var window_dialog = $ConstitutionPopup  # Adjust if necessary
@onready var audio_player = $AudioStreamPlayer
@onready var start_button = $Start
@onready var chapters_popup = $ChaptersPopup

func _ready():
	# Connect button press to function
	button.pressed.connect(on_constitution_button_pressed)
	start_button.pressed.connect(on_start_button_pressed)

func on_constitution_button_pressed():
	# Play the click sound
	audio_player.play()
	
	# Show the window dialog
	window_dialog.popup_centered()


func _on_constitution_popup_close_requested() -> void:
	window_dialog.visible = false
	pass # Replace with function body.

func on_start_button_pressed():
	# Show the chapters popup
	chapters_popup.show_popup()


func _on_chapters_popup_close_requested() -> void:
	chapters_popup.visible = false
	pass # Replace with function body.
