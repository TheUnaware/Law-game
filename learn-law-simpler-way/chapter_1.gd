extends Node2D  # Make sure this matches the node type where you attach the script

@onready var dialogue_label = $Panel/ScrollContainer/RichTextLabel  # Path to RichTextLabel
@onready var dialogue_button = $Panel/TextureButton  # Button to handle clicks
@onready var text_timer = $Timer  # Timer for auto-typing effect

var dialogues = [
	{"text": "Prosecutor: On a quiet night... a scream pierced the silence!", "speaker": "Prosecutor"},
	{"text": "Prosecutor: This case will challenge your perception of justice.", "speaker": "Prosecutor"},
	{"text": "Priya Verma: I will prove that my client's rights were violated!", "speaker": "Priya Verma"},
	# Add more dialogues as needed
]

var current_dialogue_index = 0  # Index to keep track of the current dialogue
var current_text = ""  # The current full text to be displayed
var displayed_text = ""  # The text currently displayed in the label
var text_index = 0  # The current character index being displayed
var autoplaying = false  # To track if text is currently auto-typing
var full_text_displayed = false  # To track if the full text is already displayed

func _ready():
	# Update signal connection syntax
	dialogue_button.pressed.connect(_on_dialogue_button_pressed)
	text_timer.timeout.connect(_on_text_timer_timeout)
	start_dialogue()  # Start the first dialogue on ready

func start_dialogue():
	current_dialogue_index = 0
	_show_next_dialogue()

func _show_next_dialogue():
	if current_dialogue_index < dialogues.size():
		current_text = dialogues[current_dialogue_index]["text"]
		displayed_text = ""
		text_index = 0
		autoplaying = true
		full_text_displayed = false
		dialogue_label.clear()  # Clear previous text
		text_timer.start()  # Start auto-typing text
	else:
		print("End of dialogues")  # Or switch to another scene

func _on_text_timer_timeout():
	if text_index < current_text.length():
		displayed_text += current_text[text_index]
		text_index += 1
		dialogue_label.bbcode_text = displayed_text  # Update text using BBCode
		dialogue_label.scroll_to_line(dialogue_label.get_line_count() - 1)  # Auto-scroll to the last line
	else:
		text_timer.stop()  # Stop the timer when the full text is displayed
		autoplaying = false
		full_text_displayed = true

func _on_dialogue_button_pressed():
	if autoplaying:
		text_timer.stop()
		dialogue_label.bbcode_text = current_text  # Complete the text instantly
		dialogue_label.scroll_to_line(dialogue_label.get_line_count() - 1)  # Ensure it scrolls to the last line
		autoplaying = false
		full_text_displayed = true
	elif full_text_displayed:
		current_dialogue_index += 1
		_show_next_dialogue()
