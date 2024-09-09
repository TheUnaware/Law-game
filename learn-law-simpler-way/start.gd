extends Button

@onready var click_sound = $AudioStreamPlayer

func _ready():
	# Connect the button's pressed signal to a function
	self.pressed.connect(on_button_pressed)

func on_button_pressed():
	click_sound.play()  # Play the sound when the button is pressed


func _on_cb_pressed() -> void:
	pass # Replace with function body.
