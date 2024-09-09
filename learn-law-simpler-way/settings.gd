extends Button

# References to nodes
@onready var click_sound = $AudioStreamPlayer
@onready var settings_popup = $SettingsPopup
@onready var language_option = $SettingsPopup/VBoxContainer/LanguageOption

func _ready():
	# Connect the button's pressed signal to the on_settings_pressed function
	self.pressed.connect(on_settings_pressed)
	# Connect OptionButton item selection signal
	language_option.item_selected.connect(on_language_selected)

# Function called when the Settings button is pressed
func on_settings_pressed():
	click_sound.play()  # Play the sound when the button is clicked
	settings_popup.popup_centered()  # Show the settings popup when the button is clicked

# Function called when a language option is selected
func on_language_selected(index):
	# Get the selected item text
	var selected_item = language_option.get_item_text(index)
	
	# Handle the selected language option
	match selected_item:
		"English":
			print("Language set to English")
			# Add your logic to set the language to English
		"Hindi":
			print("Language set to Hindi")
			# Add your logic to set the language to Hindi
