extends Control

# Path to the nodes
@onready var popup = $ConstitutionPopup  # Reference to the WindowDialog node
@onready var audio_player = $AudioStreamPlayer  # Reference to the AudioStreamPlayer node
@onready var button = CB  # Adjusted path to the button node

func _ready():
	# Connect the button's pressed signal to the event handler function
	button.pressed.connect(on_CB_pressed)

func on_cb_pressed():
	# Play click sound	audio_player.play()
	
	# Show the popup
	popup.popup_centered()
