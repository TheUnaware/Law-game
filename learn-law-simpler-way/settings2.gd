extends Button

@onready var language_menu = $LanguageMenu

func _ready():
	# Connect the button's pressed signal to the function
	self.pressed.connect(on_settings_pressed)
	# Connect PopupMenu item selection signals
	language_menu.item_selected.connect(on_language_selected)

func on_settings_pressed():
	# Show the PopupMenu when the Settings button is pressed
	language_menu.popup()  # Show the menu

func on_language_selected(index):
	# Get the selected item text
	var selected_item = language_menu.get_item_text(index)
	
	# Handle the selected language option
	match selected_item:
		"English":
			print("Language set to English")
			# Add your logic to set the language to English
		"Hindi":
			print("Language set to Hindi")
			# Add your logic to set the language to Hindi
